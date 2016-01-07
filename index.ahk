

!q::
  if(isDead()) {
    revive()
  }

  if(isPaused()) {
    play()
  }

  openModules()
  setKami()
return

!w::
  if(isDead()) {
    revive()
  }

  if(isPaused()) {
    play()
  }

  setDefense()
return

!e::
  if(isDead()) {
    revive()
  }

  if(isPaused()) {
    play()
  }

  openModules()
  setTracker()
return

f4::
  MouseGetPos, mouseX, mouseY
  openRefinatorWindow()
  refinate("prometid")
  refinate("duranium")
  Sleep, 200
  closeRefinatorWindow()
  MouseMove, mouseX, mouseY, 0
return

isDead() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/dead.bmp

  if(ErrorLevel = 0) {
    return true
  } else {
    return false
  }

}

isPlaying() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/playing.bmp

  if(ErrorLevel = 0) {
    return true
  } else {
    return false
  }
}


isPaused() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/paused.bmp

  if(ErrorLevel = 0) {
    return true
  } else {
    return false
  }
}

modulesIsOpen() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/modules_button_open.bmp

  if(ErrorLevel = 0) {
    return true
  } else {
    return false
  } 
}

openModules() {
  if(modulesIsOpen() = false) {
    ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/modules_button.bmp

    if(ErrorLevel = 0) {
      MouseGetPos, mouseX, mouseY
      MouseClick, Left, corsX + 1, corsY + 1, 1, 0
      MouseMove, mouseX, mouseY, 0
      
      timeWaiting = 0

      Loop { ;wait reviven
        if(modulesIsOpen()) {
          Sleep, 150
          break
        } else {
          timeWaiting += 100

          if(timeWaiting >= 2000) {
            break
          }

          Sleep, 100
        }
      }

      return true
    } else {
      return false
    }
  }
}

setKami() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/module_kami.bmp

  if(ErrorLevel = 0) {
    MouseGetPos, mouseX, mouseY
    MouseClick, Left, corsX + 1, corsY + 1, 1, 0
    MouseMove, mouseX, mouseY, 0

    return true
  } else {
    return false
  }
}

setDefense() {
  Send {m}
}

setTracker() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/module_tracker.bmp

  if(ErrorLevel = 0) {
    MouseGetPos, mouseX, mouseY
    MouseMove, corsX + 1, corsY + 1, 0
    Sleep, 100

    ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/klon.bmp

    if(ErrorLevel = 0) {
      MouseClick, Left, corsX, corsY, 1, 0
    }

    MouseMove, mouseX, mouseY, 0

    return true
  } else {
    return false
  }
}

revive() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/dead.bmp

  if(ErrorLevel = 0) {
    MouseGetPos, mouseX, mouseY
    MouseClick, Left, corsX + 1, corsY + 1, 1, 0
    MouseMove, mouseX, mouseY, 0

    timeWaiting = 0

    Loop { ;wait reviven
      if(isPaused()) {
        break
      } else {
        timeWaiting += 100

        if(timeWaiting >= 2000) {
          break
        }

        Sleep, 100
      }
    }

    return true
  } else {
    return false
  }
}

play() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/paused.bmp

  if(ErrorLevel = 0) {
    Send {n}

    timeWaiting = 0

    Loop { ;wait reviven
      if(isPlaying()) {
        break
      } else {
        timeWaiting += 100

        if(timeWaiting >= 2000) {
          break
        }

        Sleep, 100
      }
    }

    return true
  } else {
    return false
  }
}

refinate(resource) {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, % "*5 ./img/" resource ".bmp"

  if(ErrorLevel = 0) {
    ;click to resource "refinate"
    corsY += 80

    MouseClick, Left, corsX, corsY, 1, 0

    timeWaiting := 0

    Loop { ;wait for prometid
      ImageSearch, arrowCorsX, arrowCorsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/refinator_selector_arrow.bmp

      if(ErrorLevel = 0) {
        break
      } else {
        timeWaiting += 100

        if(timeWaiting >= 2000) {
          break
        }
      }
    }

    ;click arrow
    MouseClick, Left, arrowCorsX, arrowCorsY, 1, 0
    Sleep, 300

    anchorY := arrowCorsY
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
    Sleep, 300

    ;click refinate
    MouseClick, Left, arrowCorsX - 65, arrowCorsY + 43, 1, 0
    

    timeWaiting := 0
    Loop { ;wait for finish
      ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/prometid.bmp

      if(ErrorLevel = 0) {
        break
      } else {
        timeWaiting += 100

        if(timeWaiting >= 3000) {
          break
        }
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
        timeWaiting += 100

        if(timeWaiting >= 3000) {
          break
        }
      }
    }
  }
}

closeRefinatorWindow() {
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/refinator_window_button_close.bmp

  if(ErrorLevel = 0) {
    MouseClick, Left, corsX + 1, corsY + 1, 1, 0
  }
}