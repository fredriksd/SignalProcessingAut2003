dt = 1/200;
st = 0;
et = 8;
t = st:dt:et;
y1 = 2*sin(10*pi*t);
y2 = 2*sin(10*pi*t) + 3*sin(40*pi*t);
y3 = 5*sin(10*pi*t)+2*cos(40*pi*t)+3*sin(80*pi*t);
y4 = rand(1,200);


F1 = fft(y1);
F1 = fftshift(F1);
F2 = fftshift(fft(y2));
F3 = fftshift(fft(y3));
F4 = fftshift(fft(y4));

figure(1)
subplot(3,2,1)
plot(t,y1),ylim([-4 4]),xlim([0 2*pi])
subplot(3,2,2)
stem(abs(F1))
subplot(3,2,3)
plot(t,y2)
subplot(3,2,4)
stem(abs(F2))
subplot(3,2,5)
plot(t,y3)
subplot(3,2,6)
stem(abs(F3))


figure(2)
subplot(1,2,1)
plot(y4);
subplot(1,2,2)
stem(abs(F4))