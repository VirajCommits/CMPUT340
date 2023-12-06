% Vectorize the following
% Note the use of the tic/toc calls to time execution
% Compare the time once you have vectorized it

tic
for i = 1:1000
    t(i) = 2*i;
    y(i) = sin (t(i));
end
toc
tic
    vector = 1:1000;
    t = 2 * vector;
    y = sin(t);
toc

clear;
