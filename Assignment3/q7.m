dataset = csvread('Altitude.csv');
N = size(dataset,1);
M = size(dataset,2);
dataset = [ones(N, 1) dataset];

Y = dataset(1:floor(0.9*N), M+1);
X = dataset(1:floor(0.9*N), 1:M);

theta_old = zeros(1,3);
theta_new = zeros(1,3);
alpha = 0.0001;

for i = 1:1000
	temp = alpha/(floor(0.9*N));
	temp1 = (X * theta_old' - Y);
    theta_new(1) = theta_old(1) - temp * sum(temp1 .* X(:, 1));
    theta_new(2) = theta_old(2) - temp * sum(temp1 .* X(:, 2));
    theta_new(3) = theta_old(3) - temp * sum(temp1 .* X(:, 3));
    theta_old = theta_new;
end

Y_test = dataset(floor(0.9*N)+1:N, 1+M);
X_test = dataset(floor(0.9*N)+1:N, 1:M);

Y_expected = X_test * theta_new';

l2_test = norm(Y_test, 2);
l2_expected = norm(Y_expected, 2);

temp_abs = abs(l2_test - l2_expected);
Percentage_error = temp_abs/l2_test * 100

