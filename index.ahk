

!q::
  TrayTip, PetShortcuts, Kamikaze...
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
  TrayTip, PetShortcuts, Kamikaze...
  if(isDead()) {
    revive()
  }

  if(isPaused()) {
    play()
  }

  openModules()
  setDefense()
return

!e::
  TrayTip, PetShortcuts, Kamikaze...
  if(isDead()) {
    revive()
  }

  if(isPaused()) {
    play()
  }

  openModules()
  setTracker()
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
  ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/module_defense.bmp

  if(ErrorLevel = 0) {
    MouseGetPos, mouseX, mouseY
    MouseClick, Left, corsX + 1, corsY + 1, 1, 0
    MouseMove, mouseX, mouseY, 0

    return true
  } else {
    return false
  }
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
    MouseGetPos, mouseX, mouseY
    MouseClick, Left, corsX + 1, corsY + 1, 1, 0
    MouseMove, mouseX, mouseY, 0

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