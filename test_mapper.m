function [result] = test_mapper()
    
    result = true;

    for i = 0:1
        % initialize bitstream as vector of bits
        bitstream = dec2bin(i) - '0';
        % map the bitstream to a symbol
        symbol = mapper(bitstream, 'BPSK');
        % recover the bitstream
        recovered_bitstream = demapper(symbol, 'BPSK');
        % check if we got the same (DON'T test for equality due tue
        % rounding)
        if sum(bitstream - recovered_bitstream) > 10^-3
            disp("Error in BPSK mapping detected")
            disp("Original stream:")
            disp(bitstream)
            disp("Recovered stream:")
            disp(recovered_bitstream)
            result = false;
        end
    end
    % repeat for the other modes
    for i = 0:3
        bitstream = dec2bin(i) - '0';
        if length(bitstream) < 2
            bitstream = [0,bitstream];
        end
        symbol = mapper(bitstream, 'QPSK');
        recovered_bitstream = demapper(symbol, 'QPSK');
        if sum(bitstream - recovered_bitstream) > 10^-3
            disp("Error in QPSK mapping detected")
            disp("Original stream:")
            disp(bitstream)
            disp("Recovered stream:")
            disp(recovered_bitstream)
            result = false;
        end
    end
    for i = 0:15
        bitstream = dec2bin(i) - '0';
        while length(bitstream) < 4
            bitstream = [0,bitstream];
        end
        symbol = mapper(bitstream, '16-QAM');
        recovered_bitstream = demapper(symbol, '16-QAM');
        if sum(bitstream - recovered_bitstream) > 10^-3
            disp("Error in 16-QAM mapping detected")
            disp("Original stream:")
            disp(bitstream)
            disp("Recovered stream:")
            disp(recovered_bitstream)
            result = false;
        end
    end
    for i = 0:63
        bitstream = dec2bin(i) - '0';
        while length(bitstream) < 6
            bitstream = [0,bitstream];
        end
        symbol = mapper(bitstream, '64-QAM');
        recovered_bitstream = demapper(symbol, '64-QAM');
        if sum(bitstream - recovered_bitstream) > 10^-3
            disp("Error in 64-QAM mapping detected")
            disp("Original stream:")
            disp(bitstream)
            disp("Recovered stream:")
            disp(recovered_bitstream)
            result = false;
        end
    end        
end
