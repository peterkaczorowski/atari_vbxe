

' Set the line width in number of characters for the screen
' swidth: 40,64,80
'
proc ScreenWidth swidth
  data _dt() byte = 81,65

  for x=1 to 0 step -1
    xio #0,_dt(x),12,0,"E:"

    if err()==1
      if peek($034E)!=0 then xio #0,_dt(x)-1,12,64,"E:"
    endif
  next

  if swidth!=40 then xio #0,swidth,12,192,"E:"
  put 29
endproc

'
' main
'
@ScreenWidth 80

