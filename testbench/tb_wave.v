`timescale 1ns / 1ps

module tb_wave;

    reg clk;
    reg reset;
    reg [1:0] address;
    reg write;
    reg [31:0] writedata;
    wire [7:0] wave_out;

	wave_generator_avalon #(
        .USE_CORDIC(1)
    ) dut (
        .iClk(clk),
        .iReset_n(~reset),
        .iChipSelect_n(1'b0),
        .iWrite_n(~write),
        .iRead_n(1'b1),
        .iAddress(address),
        .iData(writedata),
        .oReadData(),
        .oData(wave_out)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        address = 0;
        write = 0;
        writedata = 0;

        #100 reset = 0;
        #100;

        address = 2'b00;
        writedata = 32'd10000000; 
        write = 1;
        #20 write = 0;
        #100;

        address = 2'b01;
        writedata = 32'd0;
        write = 1;
        #20 write = 0;
        #50000;

        address = 2'b01;
        writedata = 32'd1;
        write = 1;
        #20 write = 0;
        #50000;

        address = 2'b01;
        writedata = 32'd2;
        write = 1;
        #20 write = 0;
        #50000;

        address = 2'b01;
        writedata = 32'd3;
        write = 1;
        #20 write = 0;
        #50000;

        $display("Mo phong ket thuc thanh cong!");
        $stop;
    end

endmodule