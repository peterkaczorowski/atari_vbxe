'
' VBXE Detect example
'
' by Peter Kaczorowski
'
'

' Useful constants
'
TRUE      = 1
FALSE     = 0


' VBXE constants
'
VBXE_BASE1_ADDR         = $D600
VBXE_BASE2_ADDR         = $D700
VBXE_BASE_ADDR          = VBXE_BASE1_ADDR
VBXE_CORE_VERSION       = $40


'
' Check if VBXE at address is active
'
' return:
    vbxeActive = FALSE
'
proc isVBXEActiveAt vbxeBase
  vbxeActive = FALSE

  majorVersion = peek(vbxeBase + VBXE_CORE_VERSION)

  if (majorVersion != $10) then exit          ' check if major is 1.xx


  minorVersion = peek(vbxeBase + VBXE_CORE_VERSION + 1)
  minorVersion = minorVersion & $70

  if (minorVersion != $20) then exit          ' check if minor is 0.2x

  vbxeActive = TRUE
endproc

'
' Check if VBXE is active
'   and set VBXE_BASE_ADDR
'
' return:
'   vbxeActive
proc isVBXEActive
  @isVBXEActiveAt VBXE_BASE1_ADDR
  if (vbxeActive)
    VBXE_BASE_ADDR = VBXE_BASE1_ADDR
    exit
  endif

  @isVBXEActiveAt VBXE_BASE2_ADDR
  if (vbxeActive)
    VBXE_BASE_ADDR = VBXE_BASE2_ADDR
  endif
endproc


'
' Checking if the casing has not been cut
'
proc isSAVOInstalled
  ? "Just a joke... You got pranked!"
endproc

'
' VBXE Detect example
'
' main
'

@isVBXEActive
if (vbxeActive)
  ? "All good."
else
  ? "Not good at all."
endif
