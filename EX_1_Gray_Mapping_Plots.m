%% Plot for BPSK

%Just one bit generation is required (unique values)
figure;

for i=0:1
    
    b=mapper(i,'BPSK');
    plot(b,0,'r--*');
    grid on;
    axis([-1.5,+1.5,-1.5,+1.5])
    hold on
    xL = xlim;
    yL = ylim;
    line([0 0], yL);  %y-axis
    line(xL, [0 0]);  %x-axis
    hold on
    text(b,0++0.10,string(i))
    hold on
    
end
title('BPSK Gray Mapping')



%% Plot for QPSK

%Two unique bits are required to be generated
figure;

for i=0:1
    for j=0:1
    
    bitstream=[i,j];
    b=mapper(bitstream,'QPSK');
    plot(b,'r--*');
    grid on;
    axis([-1.5,+1.5,-1.5,+1.5])
    hold on
    xL = xlim;
    yL = ylim;
    line([0 0], yL);  %y-axis
    line(xL, [0 0]);  %x-axis
    hold on
    text(real(b)-0.04,imag(b)+0.10,strcat(string(i),string(j)))
    hold on 
    bitstream=[];    
    end
    
 
    
end
title('QPSK Gray Mapping')

%% Plot for 16-QAM

%four unique bits are required to be generated
figure;

for i=0:1
    for j=0:1
    for k=0:1
    for l=0:1
                
    bitstream=[i,j,k,l];
    b=mapper(bitstream,'16-QAM');
    plot(b,'r--*');
    grid on;
    axis([-1.5,+1.5,-1.5,+1.5])
    hold on
    xL = xlim;
    yL = ylim;
    line([0 0], yL);  %y-axis
    line(xL, [0 0]);  %x-axis
    hold on
    text(real(b)-0.08,imag(b)+0.10,strcat(string(i),string(j),string(k),string(l)))
    hold on 
    bitstream=[]; 
    end
        
    end
   
    end
    
 
    
end
title('16-QAM Gray Mapping')

%% Plot for 64-QAM
%6 unique bits are required to be generated
figure;

for i=0:1
    for j=0:1
    for k=0:1
    for l=0:1
      for m=0:1
          for n=0:1 
                bitstream=[i,j,k,l,m,n];
    b=mapper(bitstream,'64-QAM');
    plot(b,'r--*');
    grid on;
    axis([-1.27,+1.27,-1.27,+1.27])
    hold on
    xL = xlim;
    yL = ylim;
    line([0 0], yL);  %y-axis
    line(xL, [0 0]);  %x-axis
    hold on
    text(real(b)-0.08,imag(b)+0.10,strcat(string(i),string(j),string(k),string(l),string(m),string(n)," "))
    hold on 
    bitstream=[]; 
          end
      end
              
  
    end
        
    end
   
    end
    
 
    
end
title('64-QAM Gray Mapping')
