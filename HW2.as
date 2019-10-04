.data
A: .byte 2,0,3,1
.text
li x5, 4 #a
li x6, 2 #b
la x10, A

li x7, 0            #i = 0
Loop1:
  bge x7, x5, End2  #i < a
  add x10, x10, x7  #A + i
  li x29,0          #j = 0
Loop2:
  bge x29, x6, End1 #j < b
  slli x30, x29, 1  #2*j
  add x30, x30, x7  #2*j + i
  lb x31, 0(x10)    #A[i]
  add x31, x31, x30 #A[i] + 2*j + i
  sb x31, 0(x10)
  addi x29, x29, 1  #j++
  jal x0, Loop2
End1:
  sub x10, x10, x7  #A - i
  addi x7, x7, 1    #i++
  jal x0, Loop1
End2:
