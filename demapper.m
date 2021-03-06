function bitstream = demapper(symbolstream, mode)
    
    bitstream = [];
    if strcmp(mode, 'BPSK')
        for i = 1:length(symbolstream)
            bit = (symbolstream(i)+1)/2;
            bitstream = [bitstream, bit];
        end
    elseif strcmp(mode, 'QPSK')
        norm_factor = 2*sqrt(1/2);
        for i = 1:length(symbolstream)
            bit_1 = (imag(symbolstream(i)*norm_factor)+1)/2;
            bit_2 = (real(symbolstream(i)*norm_factor)+1)/2;
            bitstream = [bitstream, bit_1, bit_2];
        end
    elseif strcmp(mode, '16-QAM')
        norm_factor = sqrt(10);
        for i = 1:length(symbolstream)
            bit_1 = (sign(imag(symbolstream(i)))+1)/2;
            bit_2 = (sign(real(symbolstream(i)))+1)/2;
            bit_3 = abs(abs(imag(symbolstream(i))) * norm_factor - 3)/2;
            bit_4 = abs(abs(real(symbolstream(i))) * norm_factor - 3)/2;
            bitstream = [bitstream, bit_1, bit_2, bit_3, bit_4];
        end
    elseif strcmp(mode, '64-QAM')
        norm_factor = sqrt(42);
        for i = 1:length(symbolstream)
            bit_1 = (sign(imag(symbolstream(i)))+1)/2;
            bit_2 = (sign(real(symbolstream(i)))+1)/2;
            amp_imag = abs(imag(symbolstream(i)) * norm_factor);
            amp_real = abs(real(symbolstream(i)) * norm_factor);
            bit_3 = or(amp_real == 3, amp_real == 1);
            bit_4 = or(amp_imag == 1, amp_imag == 3);
            bit_5 = or(amp_imag == 5, amp_imag == 3);
            bit_6 = or(amp_real == 3, amp_real == 5);
            bitstream = [bitstream, bit_1, bit_2, bit_3, bit_4, bit_5, bit_6];
        end
    end            
end