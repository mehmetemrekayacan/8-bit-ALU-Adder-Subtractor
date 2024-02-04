module ALU_8bit (
  input [7:0] A,
  input [7:0] B,
  input [2:0] opcode,
  output reg [7:0] result,
  output reg zero_flag,
  output reg overflow_flag
);

  reg [8:0] temp_result; 

  always @*
    case (opcode)
      3'b000: result = A + B; // Addition
      3'b001: result = A - B; // Subtraction
      3'b010: result = A & B; // AND
      3'b011: result = A | B; // OR
      3'b100: begin 
                temp_result = A * B;
                result = temp_result[7:0];
              end
      3'b101: result = A ^ B; // XOR
      default: result = 8'b00000000;
    endcase

  always @*
    zero_flag = (result == 8'b00000000);

  always @*
    overflow_flag = ((A[7] & B[7] & ~result[7]) | (~A[7] & ~B[7] & result[7]));

endmodule
