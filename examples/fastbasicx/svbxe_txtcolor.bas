'
'
' 80x24 text mode in 128 colors
'
' by Peter Kaczorowski
' original code: KMK/DLT
'

' Atari System Equates
'
COL3          = $2C7


' SVBXE Driver
'
S2VBXE$       = "S2:"
RW            = 12
INV           = 128
TXT80x24_GR1  = 0           ' default E: device
TXT80x24      = 1           ' 80x24 text mode (2 colors per character)
GR160x192_256 = 2           ' 160x192 pixel mode (256 colors, lowres)
GR320x192_256 = 3           ' 320x192 pixel mode (256 colors, stdres)
GR640x192_16  = 4           ' 640x192 pixel mode (16 colors, hires)
TXT80x25      = 5
TXT80x30      = 6
TXT80x32      = 7
TXT80x26      = 8
TXT80x27      = 9
TXT80x28      = 10


str$ = "welcome to the world of the Video Board XE"
strLen = len(str$)

open #6, RW, TXT80x24, S2VBXE$
lastColor3 = peek(COL3)

pos. 18,8
for x=1 to strLen
  poke COL3,x
  put #6,asc(str$[x,1])
next

pos. 18,10
for x=1 to strLen
  poke COL3,x
  put #6,asc(str$[x,1])+INV
next

poke COL3,lastColor3
pos. 28,15
? #6,""$11$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$05;
pos. 28,16
? #6,                       "|press any key to exit|";
pos. 28,17
? #6,""$1A$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$12$03;

get key
close #6

gr. 0
