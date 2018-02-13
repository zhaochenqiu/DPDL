function net = cnn_mnist_init(varargin)
% CNN_MNIST_LENET Initialize a CNN similar for MNIST
opts.batchNormalization = true ;
opts.networkType = 'simplenn' ;
opts = vl_argparse(opts, varargin) ;

rng('default');
rng(0) ;

f=1/100 ;
net.layers = {} ;


global g_block g_epoch g_learningRate;


num = g_block/3;
global g_initnetwidth;

value = g_initnetwidth;

net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(3,3,3,32, 'single'), zeros(1, 32, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [3 3], ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(3,3,32,64, 'single'), zeros(1, 64, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [3 3], ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(3,3,64,128, 'single'), zeros(1, 128, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(3,3,128,256, 'single'), zeros(1, 256, 'single')}}, ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'pool', ...
                           'method', 'max', ...
                           'pool', [3 3], ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(1,1,256,512, 'single'), zeros(1,512,'single')}}, ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'conv', ...
                           'weights', {{f*randn(1,1,512,255, 'single'), zeros(1,255,'single')}}, ...
                           'stride', 1, ...
                           'pad', 0) ;
net.layers{end+1} = struct('type', 'softmaxloss') ;

net = insertBnorm(net, 1) ;
net = insertBnorm(net, 4) ;
net = insertBnorm(net, 8) ;





% % optionally switch to batch normalization
% if opts.batchNormalization
%     value = 1;
%     for i = 1:num
%         net = insertBnorm(net, value) ;
%         value = value + 3;
%     end
% end
% 



global g_batchSize;

% Meta parameters
net.meta.inputSize = [g_block g_block 3] ;
net.meta.trainOpts.learningRate = g_learningRate ;
net.meta.trainOpts.numEpochs = g_epoch ;
net.meta.trainOpts.batchSize = g_batchSize;

% Fill in defaul values
net = vl_simplenn_tidy(net) ;

% Switch to DagNN if requested
switch lower(opts.networkType)
  case 'simplenn'
    % done
  case 'dagnn'
    net = dagnn.DagNN.fromSimpleNN(net, 'canonicalNames', true) ;
    net.addLayer('top1err', dagnn.Loss('loss', 'classerror'), ...
      {'prediction', 'label'}, 'error') ;
    net.addLayer('top5err', dagnn.Loss('loss', 'topkerror', ...
      'opts', {'topk', 5}), {'prediction', 'label'}, 'top5err') ;
  otherwise
    assert(false) ;
end

% --------------------------------------------------------------------
function net = insertBnorm(net, l)
% --------------------------------------------------------------------
assert(isfield(net.layers{l}, 'weights'));
ndim = size(net.layers{l}.weights{1}, 4);
layer = struct('type', 'bnorm', ...
               'weights', {{ones(ndim, 1, 'single'), zeros(ndim, 1, 'single')}}, ...
               'learningRate', [1 1 0.05], ...
               'weightDecay', [0 0]) ;
net.layers{l}.weights{2} = [] ;  % eliminate bias in previous conv layer
net.layers = horzcat(net.layers(1:l), layer, net.layers(l+1:end)) ;
