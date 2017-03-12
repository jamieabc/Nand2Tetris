// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
        
// screen range 16384 ~ 24575
// keyboard at 24576

// set screen base address to R0 (16384)
@16384
D = A
@R0
M = D

// set keyboard address to R1 (24576)
@24576
D = A
@R1
M = D

(LOOP)
  @R1
  A = M
  D = M
  @WHITE_SCREEN_VAL
  D; JEQ
  @BLACK_SCREEN_VAL
  0; JEQ

// refresh screen to white
(WHITE_SCREEN_VAL)
  @8192
  D = A
  // store initial screen position to R3
  @R3
  M = D
(LOOP_WHITE)
  @LOOP
  D; JEQ
  @R3
  D = M
  // store current scrren position to R4
  @R4
  M = D
  // get screen base memory address from R0
  @R0
  D = M
  @R4
  D = D + M
  A = D
  // clear screen
  M = 0
  // move to next memory location
  @R3
  D = M
  M = D - 1
  @LOOP_WHITE
  0; JEQ

// refresh screen to black
(BLACK_SCREEN_VAL)
  @8192
  D = A
  // store initial screen position to R3
  @R3
  M = D
(LOOP_BLACK)
  @LOOP
  D; JEQ
  @R3
  D = M
  // store current scrren position to R4
  @R4
  M = D
  // get screen base memory address from R0
  @R0
  D = M
  @R4
  D = D + M
  A = D
  // clear screen
  M = -1
  // move to next memory location
  @R3
  D = M
  M = D - 1
  @LOOP_BLACK
  0; JEQ
