%Exercise 4
close all
clear
dt = 1/200; %sampling rate
st = 0; %start time
et = 8; %end time
t = st:dt:et; %time steps (vector)
y1 = 2*sin(10*pi*t); 
y2 = 2*sin(10*pi*t) + 3*sin(40*pi*t);
y3 = 5*sin(10*pi*t)+2*cos(40*pi*t)+3*sin(80*pi*t);
y4 = rand(1,200);

%Takes the Fourier transform of the signal
%and shifts the zero frequency component to origin.
F1 = fftshift(fft(y1));
F2 = fftshift(fft(y2));
F3 = fftshift(fft(y3));
F4 = fftshift(fft(y4));

%Amount of peaks in the Fft - plot is 
%relatable with amount of frequency components * 2

%Amount of peaks in the Fft plot of y4 is at the most equal
%to the length of y4, as there might be values that are similar
%within the vector. 


figure(1)
subplot(3,2,1)
plot(t,y1), title('y1(t)')
xlabel('t [s]')
subplot(3,2,2)
stem(abs(F1)), title('Fourier trans. of y1'), grid on 
xlabel('f [s^{-1}]')

subplot(3,2,3)
plot(t,y2), title('y2(t)')
xlabel('t [s]')
subplot(3,2,4)
stem((abs(F2))), title('Fourier trans. of y2'), grid on
xlabel('f [s^{-1}]')

subplot(3,2,5)
plot(t,y3), title('y3(t)')
xlabel('t [s]')
subplot(3,2,6)
stem(abs(F3)), title('Fourier trans. of y3'), grid on 
xlabel('f [s^{-1}]')

figure(2)
subplot(1,2,1)
plot(y4), title('y4')
subplot(1,2,2)
stem(abs(F4)), title('Fourier trans. of y4'), grid on

