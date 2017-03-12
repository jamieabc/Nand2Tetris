// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// initialize test
// @5
// D = A
// @R0
// M = D
// @4
// D = A
// @R1
// M = D

// initialize R2 to 0
@R2
M = 0

// put R0 to R3
@R0
D = M
@R3
M = D

// negate R3 if R3 < 0
@R3
D = M
@NEGATIVE_R3
D; JLT

// do nothing if R3 >= 0
@POSITIVE_R3
D; JGE

// negate R3
(NEGATIVE_R3)
  @R3
  D = M
  M = -D

(POSITIVE_R3)

// put R1 to R4
@R1
D = M
@R4
M = D

// negate R4 if R4 < 0
@NEGATIVE_R4
D; JLT

// do nothing if R4 >= 0
@POSITIVE_R4
D; JGE

// negate R4
(NEGATIVE_R4)
  @R3
  D = M
  M = -D

(POSITIVE_R4)

// temporarily sum is stored at R5
@R5
M = 0

// loop add
(LOOP)

  // put R4 to d register
  @R4
  D = M

  // jump to end if R4(d) == 0
  @JUSTIFY
  D; JEQ

  // multiply is multiple add
  @R5
  D = M
  @R3
  D = D + M

  // store new value to R5
  @R5
  M = D

  // reduce multiplier by 1
  @R4
  M = M - 1

  // goback to loop
  @LOOP
  0; JEQ

// justify result
(JUSTIFY)

// negate output if R0 < 0
@R0
D = M
@NEGATE_R0
D; JEQ
@POSITIVE_R0
0; JEQ

// negate output value
(NEGATE_R0)
@R5
M = -M
(POSITIVE_R0)

// negate output if R1 < 0
@R1
D = M
@NEGATE_R1
D; JEQ
@POSITIVE_R1
0; JEQ

(NEGATE_R1)
@R5
M = -M

(POSITIVE_R1)

// put calculation result to R2
@R5
D = M
@R2
M = D

(END)
  @END
  0; JEQ
