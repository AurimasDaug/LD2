x= 0.1:1/22:1;
y=((1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x))/2;

w11_1 = randn(1) ; b1_1 = rand (1);
w21_1 = randn(1) ; b2_1 = rand (1);
w31_1 = randn(1) ; b3_1 = rand (1);
w41_1 = randn(1) ; b4_1 = rand (1);
w51_1 = randn(1) ; b5_1 = rand (1);

w11_2 = randn(1) ; b1_2 = rand (1);
w12_2 = randn(1) ; 
w13_2 = randn(1) ; 
w14_2 = randn(1) ; 
w15_2 = randn(1) ; 

zingsnis = 0.15;
for indx = 1:50000
for n = 1:20

v1_1 = x(n)*w11_1 + b1_1;
v2_1 = x(n)*w21_1 + b2_1;
v3_1 = x(n)*w31_1 + b3_1;
v4_1 = x(n)*w41_1 + b4_1;
v5_1 = x(n)*w51_1 + b5_1;

y1_1 = 1/(1+exp(-v1_1));
y2_1 = 1/(1+exp(-v2_1));
y3_1 = 1/(1+exp(-v3_1));
y4_1 = 1/(1+exp(-v4_1));
y5_1 = 1/(1+exp(-v5_1));

v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 +y5_1*w15_2 + b1_2;

y_aps = v1_2;


e1= y(n) - y_aps;


delta_out_1 = e1;

delta1_1 = y1_1*(1-y1_1)*(delta_out_1*w11_2);
delta2_1 = y2_1*(1-y2_1)*(delta_out_1*w12_2);
delta3_1 = y3_1*(1-y3_1)*(delta_out_1*w13_2);
delta4_1 = y4_1*(1-y4_1)*(delta_out_1*w14_2);
delta5_1 = y5_1*(1-y5_1)*(delta_out_1*w15_2);

w11_2 = w11_2 + zingsnis*delta_out_1*y1_1;
w12_2 = w12_2 + zingsnis*delta_out_1*y2_1;
w13_2 = w13_2 + zingsnis*delta_out_1*y3_1;
w14_2 = w14_2 + zingsnis*delta_out_1*y4_1;
w15_2 = w15_2 + zingsnis*delta_out_1*y5_1;
b1_2 = b1_2 + zingsnis*delta_out_1;

w11_1 = w11_1 + zingsnis*delta1_1*x(n);
w21_1 = w21_1 + zingsnis*delta2_1*x(n);
w31_1 = w31_1 + zingsnis*delta3_1*x(n);
w41_1 = w41_1 + zingsnis*delta4_1*x(n);
w51_1 = w51_1 + zingsnis*delta5_1*x(n);
b1_1 = b1_1 + zingsnis*delta1_1;
b2_1 = b2_1 + zingsnis*delta2_1;
b3_1 = b3_1 + zingsnis*delta3_1;
b4_1 = b4_1 + zingsnis*delta4_1;
b5_1 = b5_1 + zingsnis*delta5_1;
end
end

for m = 1:20
v1_1 = x(m)*w11_1 + b1_1;
v2_1 = x(m)*w21_1 + b2_1;
v3_1 = x(m)*w31_1 + b3_1;
v4_1 = x(m)*w41_1 + b4_1;
v5_1 = x(m)*w51_1 + b5_1;

y1_1 = 1/(1+exp(-v1_1));
y2_1 = 1/(1+exp(-v2_1));
y3_1 = 1/(1+exp(-v3_1));
y4_1 = 1/(1+exp(-v4_1));
y5_1 = 1/(1+exp(-v5_1));

v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 +y5_1*w15_2 + b1_2;

y_aps(m) = v1_2;
    end
    figure,
    plot(x, y, 'kx',x,y_aps,'rx')