#In this julia document, the Go move estimation implementation exist.
#Knet functions and other functions learned in the course are allowed to use.
#Because of my purpose, there are minor adjustmenst in cbfp function and wconv
#I get rid of pooling function in cbfp, and add padding argument into wconv in order to
#keep the input size same in each layer, following script is a small network example without
#input data
using Knet
include(Pkg.dir("Go data will be imported"))

@knet function wconv(x; out=0, window=0, paddingValue=0, cinit=Xavier(), o...)
    w = par(; o..., init=cinit, dims=(window, window, 0, out))
    return conv(w,x; padding=paddingValue,o..., )
end

@knet function cbf(x; f=:relu,cwindow=0,cpadding=0)
    y= wconv(x; o..., window=cwindow,paddingValue=cpadding)
    z=bias4(y; o...)
    return f(z; o...)
end

@knet function GoDCNNModel(x)
    y  =cbf(x,out=64,cwindow=7,cpadding=0);
    y1 =cbf(y,out=64,cwindow=5,cpadding=2);
    y2 =cbf(y1,out=64,cwindow=5,cpadding=2);
    y3 =cbf(y2,out=48,cwindow=5,cpadding=2);
    y4 =cbf(y3,out=32,cwindow=5,cpadding=2);
    return wbf(y4; out=19*19, f=:soft);
end

function main()
    minibatchsize=100;
    global trn = minibatch(input, output, batchsize)
    global tst = minibatch(input, output, batchsize)
    global model = compile(:GoDCNNModel)
    setp(model; lr=0.05)
    for epoch=1:10
               train(model,trn,softloss)
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
