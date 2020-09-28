%% c - Generating a bit sequence x
N1=1000; %number of sample bits
x=randi([0 1],1,N1);


%% d - Mapping x to symbol sequences
S_BPSK=mapper(x,'BPSK');
S_QPSK=mapper(x,'QPSK');
S_16_QAM=mapper(x,'16-QAM');
S_64_QAM=mapper(x,'64-QAM');

%% e- Addition of Complex Random Noise

variance=0.05;
n=sqrt(variance)*(randn(1,length(S_BPSK))+1i*randn(1,length(S_BPSK)));
n1=sqrt(variance)*(randn(1,length(S_QPSK))+1i*randn(1,length(S_QPSK)));
n2=sqrt(variance)*(randn(1,length(S_16_QAM))+1i*randn(1,length(S_16_QAM)));
n3=sqrt(variance)*(randn(1,length(S_64_QAM))+1i*randn(1,length(S_64_QAM)));

%Symbolstreams with noise
Y_BPSK=S_BPSK+n; 
Y_QPSK=S_QPSK+n1;
Y_16_QAM=S_16_QAM+n2;
Y_64_QAM=S_64_QAM+n3;

%This commented code over here was used to plot the gray mapping when there
%is noise present
% We will need it, do not delete it! 
% for i=1:length(Y_16_QAM)
%     
% plot(Y_16_QAM(i),'r--*');
%     grid on;
%     axis([-1.5,+1.5,-1.5,+1.5])
%     hold on
%     xL = xlim;
%     yL = ylim;
%     line([0 0], yL);  %y-axis
%     line(xL, [0 0]);  %x-axis
%     hold on
% end
%% f-Demap the Noisy Signals
x_not1=demapper(Y_BPSK,'BPSK');
x_not2=demapper(Y_QPSK,'QPSK');
x_not3=demapper(Y_16_QAM,'16-QAM');
x_not4=demapper(Y_64_QAM,'64-QAM');
x_not4=x_not4(1:N1);
%Converting them to Binary Format 

a=length(x_not1);
i=1;
while i<a

    if(abs(x_not1(i)-1)<abs(x_not1(i)-0))
       x_not1(i)=1;
    else
       x_not1(i)=0;
    end
i=i+1;
end

a=length(x_not2);
i=1;
while i<a

    if(abs(x_not2(i)-1)<abs(x_not2(i)-0))
       x_not2(i)=1;
    else
       x_not2(i)=0;
    end
i=i+1;
end


a=length(x_not3);
i=1;
while i<a

    if(abs(x_not3(i)-1)<abs(x_not3(i)-0))
       x_not3(i)=1;
    else
       x_not3(i)=0;
    end
i=i+1;
end


a=length(x_not4);
i=1;
while i<=a

    if(abs(x_not4(i)-1)<abs(x_not4(i)-0))
       x_not4(i)=1;
    else
       x_not4(i)=0;
    end
i=i+1;
end

x_not_BPSK=real(x_not1);
x_not_QPSK=real(x_not2);
x_not_16_QAM=real(x_not3);
x_not_64_QAM=real(x_not4);


%% g - Computing their Bit Error Rates

BER1=biterr(int16(x_not_BPSK),x,[],'column-wise');
ber_BPSK = sum(BER1(:) == 1)
BER2=biterr(int16(x_not_QPSK),x,[],'column-wise');
ber_QPSK= sum(BER2(:) == 1)
BER3=biterr(int16(x_not_16_QAM),x,[],'column-wise');
ber_16_QAM = sum(BER3(:) == 1)
BER4=biterr(int16(x_not_64_QAM),x,[],'column-wise');
ber_64_QAM = sum(BER4(:) == 1)

%% h- Computing signal Error Rates
S_BPSK_not=mapper(x_not_BPSK,'BPSK');
S_QPSK_not=mapper(x_not_QPSK,'QPSK');
S_16_QAM_not=mapper(x_not_16_QAM,'16-QAM');
S_64_QAM_not=mapper(x_not_64_QAM,'64-QAM');

SER1=biterr(int16(real(abs(S_BPSK_not))),int16(real(abs(S_BPSK))),[],'column-wise');
ser_BPSK = sum(SER1(:) == 1)
SER2=biterr(int16(real(abs(S_QPSK_not))),int16(real(abs(S_QPSK))),[],'column-wise');
ser_QPSK= sum(SER2(:) == 1)
SER3=biterr(int16(real(abs(S_16_QAM_not))),int16(real(abs(S_16_QAM))),[],'column-wise');
ser_16_QAM = sum(SER3(:) == 1)
SER4=biterr(int16(real(abs(S_64_QAM_not))),int16(real(abs(S_64_QAM))),[],'column-wise');
ser_64_QAM = sum(SER4(:) == 1)

%% i,j- Plotting for different values of variance

Es = 1;
variance = [0.001 0.05 0.1 0.4 1];
SNR=Es./variance;
SNR_db=10*log10(SNR);

Vector_BER1=ones([1 length(variance)]);
Vector_BER2=ones([1 length(variance)]);
Vector_BER3=ones([1 length(variance)]);
Vector_BER4=ones([1 length(variance)]);

for i = variance
 
j=1; %used to count in order to form the vectors for Bit Error Rates
n=sqrt(i)*(randn(1,length(S_BPSK))+1i*randn(1,length(S_BPSK)));
n1=sqrt(i)*(randn(1,length(S_QPSK))+1i*randn(1,length(S_QPSK)));
n2=sqrt(i)*(randn(1,length(S_16_QAM))+1i*randn(1,length(S_16_QAM)));
n3=sqrt(i)*(randn(1,length(S_64_QAM))+1i*randn(1,length(S_64_QAM)));

%Symbolstreams with noise
Y_BPSK=S_BPSK+n; 
Y_QPSK=S_QPSK+n1;
Y_16_QAM=S_16_QAM+n2;
Y_64_QAM=S_64_QAM+n3;
    
x_not1=demapper(Y_BPSK,'BPSK');
x_not2=demapper(Y_QPSK,'QPSK');
x_not3=demapper(Y_16_QAM,'16-QAM');
x_not4=demapper(Y_64_QAM,'64-QAM');
x_not4=x_not4(1:N1);
%Converting them to Binary Format 

a=length(x_not1);
i=1;
while i<a

    if(abs(x_not1(i)-1)<abs(x_not1(i)-0))
       x_not1(i)=1;
    else
       x_not1(i)=0;
    end
i=i+1;
end

a=length(x_not2);
i=1;
while i<a

    if(abs(x_not2(i)-1)<abs(x_not2(i)-0))
       x_not2(i)=1;
    else
       x_not2(i)=0;
    end
i=i+1;
end


a=length(x_not3);
i=1;
while i<a

    if(abs(x_not3(i)-1)<abs(x_not3(i)-0))
       x_not3(i)=1;
    else
       x_not3(i)=0;
    end
i=i+1;
end


a=length(x_not4);
i=1;
while i<=a

    if(abs(x_not4(i)-1)<abs(x_not4(i)-0))
       x_not4(i)=1;
    else
       x_not4(i)=0;
    end
i=i+1;
end

x_not_BPSK=real(x_not1);
x_not_QPSK=real(x_not2);
x_not_16_QAM=real(x_not3);
x_not_64_QAM=real(x_not4);   

BER1=biterr(int16(x_not_BPSK),x,[],'column-wise');
ber_BPSK = sum(BER1(:) == 1);
Vector_BER1(j)=ber_BPSK;
BER2=biterr(int16(x_not_QPSK),x,[],'column-wise');
ber_QPSK= sum(BER2(:) == 1);
Vector_BER2(j)=ber_QPSK;
BER3=biterr(int16(x_not_16_QAM),x,[],'column-wise');
ber_16_QAM = sum(BER3(:) == 1);
Vector_BER3(j)=ber_16_QAM;
BER4=biterr(int16(x_not_64_QAM),x,[],'column-wise');
ber_64_QAM = sum(BER4(:) == 1);
Vector_BER4(j)=ber_64_QAM;
j=j+1;


semilogy(SNR_db,Vector_BER1,'mx-','LineWidth',2);
hold on
semilogy(SNR_db,Vector_BER2,'b-','LineWidth',2);
hold on
semilogy(SNR_db,Vector_BER3,'r-','LineWidth',2);
hold on
semilogy(SNR_db,Vector_BER4,'g-','LineWidth',2);
axis([0 5 10^-5 1])
grid on

end

