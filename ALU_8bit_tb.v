module ALU_8bit_tb;

  reg [7:0] A, B;
  reg [2:0] opcode;

  wire [7:0] result;
  wire zero_flag, overflow_flag;

  ALU_8bit uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .zero_flag(zero_flag),
    .overflow_flag(overflow_flag)
  );

  // Testbench stimulus
  initial begin
    $dumpfile("alu_8bit_tb.vcd");
    $dumpvars(0, ALU_8bit_tb);

    // Test case 1: Addition
    A = 8'b11001100;
    B = 8'b00110011;
    opcode = 3'b000;
    #10;
    
    // Test case 2: Subtraction
    A = 8'b11001100;
    B = 8'b00110011;
    opcode = 3'b001;
    #10;

    // Test case 3: AND
    A = 8'b11001100;
    B = 8'b00110011;
    opcode = 3'b010;
    #10;

    // Test case 4: OR
    A = 8'b10101010;
    B = 8'b01010101;
    opcode = 3'b011;
    #10;

    // Test case 6: XOR
    A = 8'b10101010;
    B = 8'b01010101;
    opcode = 3'b101;
    #10;

    $finish;
  end

endmodule

