function res = vl_simplenn_nosoft(net, x, dzdy, res, varargin)

opts.conserveMemory = false ;
opts.sync = false ;
opts.mode = 'normal' ;
opts.accumulate = false ;
opts.cudnn = true ;
opts.backPropDepth = +inf ;
opts.skipForward = false ;
opts.parameterServer = [] ;
opts.holdOn = false ;
opts = vl_argparse(opts, varargin);

n = numel(net.layers) ;
assert(opts.backPropDepth > 0, 'Invalid `backPropDepth` value (!>0)');
backPropLim = max(n - opts.backPropDepth + 1, 1);

if (nargin <= 2) || isempty(dzdy)
  doder = false ;
  if opts.skipForward
    error('simplenn:skipForwardNoBackwPass', ...
      '`skipForward` valid only when backward pass is computed.');
  end
else
  doder = true ;
end

if opts.cudnn
  cudnn = {'CuDNN'} ;
  bnormCudnn = {'NoCuDNN'} ; % ours seems slighty faster
else
  cudnn = {'NoCuDNN'} ;
  bnormCudnn = {'NoCuDNN'} ;
end

switch lower(opts.mode)
  case 'normal'
    testMode = false ;
  case 'test'
    testMode = true ;
  otherwise
    error('Unknown mode ''%s''.', opts. mode) ;
end

testMode = true;

gpuMode = isa(x, 'gpuArray') ;

if nargin <= 3 || isempty(res)
  if opts.skipForward
    error('simplenn:skipForwardEmptyRes', ...
    'RES structure must be provided for `skipForward`.');
  end
  res = struct(...
    'x', cell(1,n+1), ...
    'dzdx', cell(1,n+1), ...
    'dzdw', cell(1,n+1), ...
    'aux', cell(1,n+1), ...
    'stats', cell(1,n+1), ...
    'time', num2cell(zeros(1,n+1)), ...
    'backwardTime', num2cell(zeros(1,n+1))) ;
end

if ~opts.skipForward
  res(1).x = x ;
end

% -------------------------------------------------------------------------
%                                                              Forward pass
% -------------------------------------------------------------------------

for i=1:n
  if opts.skipForward, break; end;
  l = net.layers{i} ;
  res(i).time = tic ;
  switch l.type
    case 'conv'
      res(i+1).x = vl_nnconv(res(i).x, l.weights{1}, l.weights{2}, ...
        'pad', l.pad, ...
        'stride', l.stride, ...
        'dilate', l.dilate, ...
        l.opts{:}, ...
        cudnn{:}) ;

    case 'convt'
      res(i+1).x = vl_nnconvt(res(i).x, l.weights{1}, l.weights{2}, ...
        'crop', l.crop, ...
        'upsample', l.upsample, ...
        'numGroups', l.numGroups, ...
        l.opts{:}, ...
        cudnn{:}) ;

    case 'pool'
      res(i+1).x = vl_nnpool(res(i).x, l.pool, ...
        'pad', l.pad, 'stride', l.stride, ...
        'method', l.method, ...
        l.opts{:}, ...
        cudnn{:}) ;

    case {'normalize', 'lrn'}
      res(i+1).x = vl_nnnormalize(res(i).x, l.param) ;

    case 'softmax'
      res(i+1).x = vl_nnsoftmax(res(i).x) ;

    case 'loss'
      res(i+1).x = vl_nnloss(res(i).x, l.class) ;

    case 'softmaxloss'
	  res(i+1).x = -1;
      % res(i+1).x = vl_nnsoftmaxloss(res(i).x, l.class) ;

    case 'relu'
      if l.leak > 0, leak = {'leak', l.leak} ; else leak = {} ; end
      res(i+1).x = vl_nnrelu(res(i).x,[],leak{:}) ;

    case 'sigmoid'
      res(i+1).x = vl_nnsigmoid(res(i).x) ;

    case 'noffset'
      res(i+1).x = vl_nnnoffset(res(i).x, l.param) ;

    case 'spnorm'
      res(i+1).x = vl_nnspnorm(res(i).x, l.param) ;

    case 'dropout'
      if testMode
        res(i+1).x = res(i).x ;
      else
        [res(i+1).x, res(i+1).aux] = vl_nndropout(res(i).x, 'rate', l.rate) ;
      end

    case 'bnorm'
      if testMode
        res(i+1).x = vl_nnbnorm(res(i).x, l.weights{1}, l.weights{2}, ...
                                'moments', l.weights{3}, ...
                                'epsilon', l.epsilon, ...
                                bnormCudnn{:}) ;
      else
        res(i+1).x = vl_nnbnorm(res(i).x, l.weights{1}, l.weights{2}, ...
                                'epsilon', l.epsilon, ...
                                bnormCudnn{:}) ;
      end

    case 'pdist'
      res(i+1).x = vl_nnpdist(res(i).x, l.class, l.p, ...
        'noRoot', l.noRoot, ...
        'epsilon', l.epsilon, ...
        'aggregate', l.aggregate, ...
        'instanceWeights', l.instanceWeights) ;

    case 'custom'
      res(i+1) = l.forward(l, res(i), res(i+1)) ;

    otherwise
      error('Unknown layer type ''%s''.', l.type) ;
  end

  % optionally forget intermediate results
  needsBProp = doder && i >= backPropLim;
  forget = opts.conserveMemory && ~needsBProp ;
  if i > 1
    lp = net.layers{i-1} ;
    % forget RELU input, even for BPROP
    forget = forget && (~needsBProp || (strcmp(l.type, 'relu') && ~lp.precious)) ;
    forget = forget && ~(strcmp(lp.type, 'loss') || strcmp(lp.type, 'softmaxloss')) ;
    forget = forget && ~lp.precious ;
  end
  if forget
    res(i).x = [] ;
  end

  if gpuMode && opts.sync
    wait(gpuDevice) ;
  end
  res(i).time = toc(res(i).time) ;
end


