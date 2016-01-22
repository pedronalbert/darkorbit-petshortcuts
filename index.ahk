#SingleInstance, Force

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

;----------- Configuration --------------
shipCenterX := 639
shipCenterY := 538
circleRadium := 230
circleSpeed := 0.0157
circleActive := false
waitCubikon := false
;----------------------------------------

#Include, ./src/Refinator.ahk
#Include, ./src/Pet.ahk
!q::
  if(Pet.isDead()) {
    Pet.revive()
  }

  if(Pet.isPaused()) {
    Pet.play()
  }

  Pet.openModules()
  Pet.setKami()
return

!w::
  if(Pet.isDead()) {
    Pet.revive()
  }

  if(Pet.isPaused()) {
    Pet.play()
  }

  Pet.setDefense()
return

!e::
  if(Pet.isDead()) {
    Pet.revive()
  }

  if(Pet.isPaused()) {
    Pet.play()
  }

  Pet.openModules()
  Pet.setTracker()
return

!r::
  if(Pet.isDead()) {
    Pet.revive()
  }

  if(Pet.isPaused()) {
    Pet.play()
  }

  Pet.openModules()
  Pet.setAutocollector()
return

f4::
  MouseGetPos, mouseX, mouseY
  Refinator.openRefinatorWindow()
  Refinator.refinateResource("duranium")
  Refinator.refinateResource("prometid")
  Refinator.refinateResource("promerium")
  Refinator.closeRefinatorWindow()
  MouseMove, mouseX, mouseY, 0
return

f1::
  TrayTip, Helper, InitCubikon
  initWaitCubikon()
return

f2::
  TrayTip, Helper, Stop cubikon
  stopWaitCubikon()
return

initCircles() {
  global circleActive
  global shipCenterX
  global shipCenterY
  global circleSpeed
  global circleRadium

  circleActive := true

  i := 0

  Loop {
    xPos := shipCenterX + (circleRadium * Cos(i))
    yPos := shipCenterY + (circleRadium * Sin(i))

    MouseMove, xPos, yPos, 0
    i += circleSpeed


    if(circleActive = false) {
      break
    }

    Sleep, 1
  }
}

stopCircles() {
  global circleActive

  circleActive := false
}


initWaitCubikon() {
  global waitCubikon

  waitCubikon := true
  Loop {
    ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight,*20 ./img/cubikon.bmp

    if (ErrorLevel = 0) {
      MouseClick, Left, corsX, corsY, 1, 0
      Sleep, 500
      Send {Ctrl}
      break
    }

    if(waitCubikon = false) {
      break
    }
    
  }
}

stopWaitCubikon() {
  global waitCubikon

  waitCubikon := false
}