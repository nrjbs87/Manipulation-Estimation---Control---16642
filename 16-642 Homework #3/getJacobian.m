function F = getJacobian(state, model_params)

x1 = state(1);
x2 = state(2);

br = model_params.br;
alpha = model_params.alpha;
c = model_params.c;
df = model_params.df;

F = [ 1 + br - alpha*x2, -alpha*x1; c*x2, 1 + c*x1 - df ];

end