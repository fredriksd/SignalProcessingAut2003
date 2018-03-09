close all, clear all

S1 = log(1:300);
S1 = S1/max(S1);
S2 = [100:-1:1, 100:-1:1, 100:-1:1];
S2 = S2/max(S2); 
C = conv(S1,S2);
C = C/max(C);
XC = xcorr(S1,S2);
XC = XC/max(XC);
A1 = xcorr(S1,S1);
A1 = A1/max(A1);
A2 = xcorr(S2,S2);
A2 = A2/max(A2);

subplot(3,2,1)
plot(S1), title('Sample S1'), axis tight
subplot(3,2,2)
plot(S2), title('Sample S2'), axis tight
subplot(3,2,3)
plot(C), title('Convolution'), axis tight
subplot(3,2,4)
plot(XC), title('Cross correlation'), axis tight
subplot(3,2,5)
plot(A1), title('Auto correlation of S1'), axis tight
subplot(3,2,6)
plot(A2), title('Auto correlation of S2'), axis tight