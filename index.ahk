#SingleInstance, Force

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

;----------- Configuration --------------
shipCenterX := 639
shipCenterY := 538
circleRadium := 230
circleSpeed := 0.0157
circleActive := false
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
  TrayTip, Helper, Circle Activated...
  initCircles()
return

f2::
  TrayTIp, Helper, Circle Stoped...
  stopCircles()
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

incrementRadium() {
  global circleRadium

  circleRadium++

  TrayTip, Helper, Radium %circleRadium%
}

decrementRadium() {
  global circleRadium

  circleRadium--

  TrayTip, Helper, Radium %circleRadium%
}

incrementSpeed() {
  global circleSpeed

  circleSpeed += 0.0001

  TrayTip, Helper, Speed %circleSpeed%
}

decrementSpeed() {
  global circleSpeed

  circleSpeed -= 0.0001

  TrayTip, Helper, Speed %circleSpeed%
}