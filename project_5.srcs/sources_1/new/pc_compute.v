module pc_compute (
    input clk,                  // Clock input
    input [1:0] SWITCHES,       // Switches to select between programs
    input [31:0] immediate,     // Immediate value for branching
    input branch,               // Branch flag
    input zero,                 // Zero flag
    output reg [7:0] pc         // Program counter output
);

    reg reset;  // Store the previous value of SWITCHES for detecting changes
    initial begin
        pc <= 8'h0;
    end
    // Initialize program counter based on SWITCHES
    always @ (posedge clk) begin
        if (SWITCHES[0] != reset) begin
            if (SWITCHES[0] == 1'b0) begin
                pc <= 8'h0;  // Program 1
            end else begin
                pc <= 8'h40; // Program 2
            end
        end
        reset <= SWITCHES[0];
        case (branch & zero)
            1'b0: pc <= pc + 4;
            1'b1: pc <= pc + (immediate * 4);
            default: pc <= pc;
        endcase
    end

endmodule