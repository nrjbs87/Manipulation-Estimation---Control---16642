function xNew = motionModel(x, u, model_params)

x1 = x(1);
x2 = x(2);

u1 = u(1);
u2 = u(2);

xNew = zeros(2,1);

br = model_params.br;
alpha = model_params.alpha;
c = model_params.c;
df = model_params.df;

xNew(1) = x1 + br*x1 - alpha*x2*x1 + u1;
xNew(2) = x2 + c*x2*x1 - df*x2 + u2;

end