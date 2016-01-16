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

#Include, Pet.ahk

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
  openRefinatorWindow()
  refinateResource("duranium")
  refinateResource("prometid")
  closeRefinatorWindow()
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

refinateResource(resource) {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, % "*5 ./img/" resource ".bmp"

  if(ErrorLevel = 0) {
    ;click to resource "refinateResource"
    corsY += 80

    MouseClick, Left, corsX, corsY, 1, 0

    timeWaiting := 0

    Loop { ;wait for prometid
      ImageSearch, arrowCorsX, arrowCorsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 ./img/refinator_selector_arrow.bmp

      if(ErrorLevel = 0) {
        break
      } else {

        if(timeWaiting >= 2000) {
          break
          return false
        }

        Sleep, 100
        timeWaiting += 100
      }
    }

    ;click arrow
    MouseClick, Left, arrowCorsX, arrowCorsY, 1, 0

    anchorY := arrowCorsY

    ;wait for select opened
    timeWaiting := 0

    Loop {
      PixelGetColor, color, arrowCorsX, arrowCorsY + 20

      if(color = "0xFFD89A") {
        break
      } else {
        if(timeWaiting >= 2000) {
          break
          return false
        }
      }

      Sleep, 100
      timeWaiting += 100
    }

    ;find last amount
    Loop {
      anchorY += 20

      PixelGetColor, color, arrowCorsX, anchorY

      if(color = "0xFFFFFF" or color = "0xFFD89A") {
        amountYCors := anchorY
      } else {
        break
      }
    }

    ;select amount
    MouseClick, Left, arrowCorsX, amountYCors, 1, 0
    
    ;wait for select close
    timeWaiting := 0

    Loop {
      PixelGetColor, color, arrowCorsX, arrowCorsY + 20

      if(color <> "0xFFD89A") {
        break
      } else {
        if(timeWaiting > 2000) {
          break
          return false
        }
      }

      Sleep, 100
      timeWaiting += 100
    }


    ;click refinateResource
    MouseClick, Left, arrowCorsX - 65, arrowCorsY + 43, 1, 0
    

    timeWaiting := 0
    Loop { ;wait for finish
      ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/prometid.bmp

      if(ErrorLevel = 0) {
        break
      } else {

        if(timeWaiting >= 3000) {
          break
          return false
        }

        Sleep, 100
        timeWaiting += 100
      }
    }
  }
}

openRefinatorWindow() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/refinator_window_button.bmp

  if(ErrorLevel = 0) {
    MouseClick, Left, corsX + 1, corsY + 1, 1, 0
    timeWaiting := 0

    Loop { ;wait for prometid
      ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/prometid.bmp

      if(ErrorLevel = 0) {
        break
      } else {

        if(timeWaiting >= 3000) {
          break
          return false
        }

        Sleep, 100
        timeWaiting += 100
      }
    }
  }
}

closeRefinatorWindow() {
  timeWaiting := 0

  Loop {
      ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/refinator_window_button_close.bmp

      if(ErrorLevel = 0) {
        MouseClick, Left, corsX + 1, corsY + 1, 1, 0
        break
      } else {

        if(timeWaiting >= 2000) {
          break
          return false
        }

        Sleep 100
        timeWaiting += 100
      }
    }
}

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