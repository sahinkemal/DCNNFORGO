#In this julia document, the Go move estimation implementation exist.
#Knet functions and other functions learned in the course are allowed to use.
#Because of required actions in accordance with my paper, there are minor
#adjustmenst in cbfp function and wconv I get rid of pooling function in cbfp,
#and add padding argument into wconv in order to keep the input size same in
#each layer,The data is constructed in gameApprover.jl script and raw data is
#pulled from http://u-go.net/gamerecords/. In this link around 80000 games are
#available.In GoDCNNModel 8 convolutional layer, and one fully connected layer
#exist. The input size for input-output binaries are 25*25*8*1000000 and 19*19*1*1000000.
#The output size for input-output binaries are 25*25*8*100000 and 19*19*1*100000.
#Minibatch size is 50, and learning rate is initially fixed to 0.05, after 8th epoch
#it is assigned to 0.01. Minibatching , train and test functions are taken from course
#web-site.
using Knet
using ArgParse
using JLD
@knet function wconv(x; out=0, window=0, paddingValue=0, cinit=Xavier())
  w = par(;init=cinit, dims=(window, window, 0, out))
  return conv(w,x; padding=paddingValue)
end
@knet function cbf(x; f=:relu,cwindow=0,cpadding=0,cout=0)
  y= wconv(x; window=cwindow, paddingValue=cpadding, out=cout)
  z=bias4(y)
  return f(z)
end
@knet function GoDCNNModel(x)
  y  =cbf(x;cout=64,f=:relu,cwindow=7,cpadding=0);
  y1 =cbf(y;cout=64,f=:relu,cwindow=5,cpadding=2);
  y2 =cbf(y1;cout=64,f=:relu,cwindow=5,cpadding=2);
  y3 =cbf(y2;cout=48,f=:relu,cwindow=5,cpadding=2);
  y4 =cbf(y3;cout=48,f=:relu,cwindow=5,cpadding=2);
  y5 =cbf(y4;cout=48,f=:relu,cwindow=5,cpadding=2);
  y6 =cbf(y5;cout=32,f=:relu,cwindow=5,cpadding=2);
  y7 =cbf(y6;cout=32,f=:relu,cwindow=5,cpadding=2);
  return wbf(y7; out=361, f=:soft);
end
function main()
  endOfDataForInput=1000000;
  beginningOfDataForOutput=endOfDataForInput+1;
  endOfDataForOutput=1100000;
  TemporaryInput=load("overallData.jld","finalInputArray");
  TemporaryOutput=load("overallData.jld","resizedFinalOutputArray");
  inputForTrain=TemporaryInput[:,:,:,1:endOfDataForInput];
  outputForTrain=TemporaryOutput[:,1:endOfDataForInput];
  inputForTest=TemporaryInput[:,:,:,beginningOfDataForOutput:endOfDataForOutput];
  outputForTest=TemporaryOutput[:,beginningOfDataForOutput:endOfDataForOutput];
  batchsize=50;
  global trn=minibatch(inputForTrain,outputForTrain,batchsize)
  global tst=minibatch(inputForTest,outputForTest,batchsize)
  model = compile(:GoDCNNModel)
  for epoch=1:20
    if epoch >= 1 && epoch < 9
      setp(model; lr=0.05)
    else
      setp(model; lr=0.01)
    end
    println("epochNumber:%d\n",epoch)
    println("train is not successful")
    @time train(model,trn,softloss)
    println("train is successful")
    @printf("epoch:%d\t\t softloss:%g\t/%g\t zeroone:%g\t/%g\t\n", epoch, test(model,trn,softloss),test(model,tst,softloss),1-test(model,trn,zeroone),1-test(model,tst,zeroone))
  end
end
function minibatch(x, y, batchsize)
  data = Any[]
  for i=1:batchsize:ccount(x)
    j=min(i+batchsize-1,ccount(x))
    push!(data, (cget(x,i:j), cget(y,i:j)))
  end
  return data
end
function train(f,data,loss)
  for (x,y) in data
    forw(f, x)
    back(f, y, loss)
    update!(f)
    reset!(f)
  end
end
function test(f,data,loss)
  sumloss = numloss = 0
  for (x,ygold) in data
    ypred = forw(f, x)
    sumloss += loss(ypred, ygold)
    numloss += 1
  end
  sumloss / numloss
end
main()
