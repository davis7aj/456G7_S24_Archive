module pc_compute (
    input clk,                  // Clock input
    input [31:0] immediate,     // Immediate value for branching
    input branch,               // Branch flag
    input zero,                 // Zero flag
    input HALT,
    output reg [31:0] pc         // Program counter output
);
    initial begin
        pc = 0;
    end
    
    always @ (posedge clk) begin
        if (HALT != 1) begin
            case (branch & zero)
                1'b0: pc <= pc + 4;
                1'b1: pc <= pc + (immediate * 4);
                default: pc <= pc + 4;
            endcase
        end
        else begin
            pc <= pc + 0; // Increment by 0 when HALT is 1
        end
    end

endmodule
