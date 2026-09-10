module wave_generator_core #(
    parameter USE_CORDIC = 0 // 1: Dùng CORDIC, 0: Dùng LUT
)(
    input clk,
    input reset,
    
    input [31:0] frequency_step,
    input [1:0]  wave_type, // 00: Vuông, 01: Tam giác, 10: Sin, 11: Cos
    
    output reg [7:0] wave_out
);

    reg [31:0] phase_acc;
    always @(posedge clk or posedge reset) begin
        if (reset) 
            phase_acc <= 32'd0;
        else 
            phase_acc <= phase_acc + frequency_step;
    end
	 
    wire [7:0] sq_wire, tri_wire, sin_wire, cos_wire;

    wave_square u_square (
        .phase_acc(phase_acc), 
        .wave_out(sq_wire)
    );
    
    wave_triangle u_triangle (
        .phase_acc(phase_acc), 
        .wave_out(tri_wire)
    );

    generate
        if (USE_CORDIC == 1) begin : gen_cordic
            wave_cordic u_cordic (
                .clk(clk), 
                .phase_acc(phase_acc), 
                .sin_out(sin_wire), 
                .cos_out(cos_wire)
            );
        end else begin : gen_lut
            wave_lut u_lut (
                .clk(clk), 
                .phase_acc(phase_acc), 
                .sin_out(sin_wire), 
                .cos_out(cos_wire)
            );
        end
    endgenerate

    always @(posedge clk) begin
        case (wave_type)
            2'b00: wave_out <= sq_wire;
            2'b01: wave_out <= tri_wire;
            2'b10: wave_out <= sin_wire;
            2'b11: wave_out <= cos_wire;
            default: wave_out <= 8'd0;
        endcase
    end

endmodule