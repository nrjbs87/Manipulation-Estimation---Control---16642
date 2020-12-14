function [xHat, pHat] = update(xNew, pNew, H, W, y)
yPredict = H * xNew;
S = H * pNew * transpose(H) + W;

xHat = xNew + pNew * transpose(H) * inv(S)* (y - yPredict);
pHat = pNew - pNew * transpose(H) * inv(S) * H * pNew;

end