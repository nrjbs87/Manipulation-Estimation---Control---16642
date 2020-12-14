function [xNew, pNew] = prediction(x, p, model_params, u, V)

xNew = motionModel(x, u, model_params);
F = getJacobian(x, model_params);
pNew = F * p * transpose(F) + V;

end