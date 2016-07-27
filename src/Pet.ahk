class Pet {
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
    if(this.modulesIsOpen() = false) {
      ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/modules_button.bmp

      if(ErrorLevel = 0) {
        MouseGetPos, mouseX, mouseY
        MouseClick, Left, corsX + 1, corsY + 1, 1, 0
        MouseMove, mouseX, mouseY, 0
        
        timeWaiting := 0

        Loop { ;wait reviven
          if(this.modulesIsOpen()) {
            Sleep, 150
            break
          } else {

            if(timeWaiting >= 2000) {
              break
            }

            Sleep, 100
            timeWaiting += 100
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

  setAutocollector() {
    ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/module_autocollector.bmp

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

  setTracker(searchAllien) {
    ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/module_tracker.bmp

    if(ErrorLevel = 0) {
      MouseGetPos, mouseX, mouseY
      MouseMove, corsX + 1, corsY + 1, 0

      ;wait for selector opened
      timeWaiting := 0

      Loop {
        ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight,*5 ./img/pet_alliens/%searchAllien%.bmp

        if(ErrorLevel = 0) {
          MouseClick, Left, corsX, corsY, 1, 0
          break
        } else {
          if(timeWaiting >= 2000) {
            break
          }
        }

        Sleep, 100
        timeWaiting += 100
      }

      MouseMove, mouseX, mouseY, 0
    }
  }

  revive() {
    ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/dead.bmp

    if(ErrorLevel = 0) {
      MouseGetPos, mouseX, mouseY
      MouseClick, Left, corsX + 1, corsY + 1, 1, 0
      MouseMove, mouseX, mouseY, 0

      timeWaiting := 0

      Loop { ;wait reviven
        if(this.isPaused()) {
          break
        } else {

          if(timeWaiting >= 2000) {
            break
          }

          Sleep, 100
          timeWaiting += 100
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

      timeWaiting := 0

      Loop { ;wait reviven
        if(this.isPlaying()) {
          break
        } else {

          if(timeWaiting >= 2000) {
            break
          }

          Sleep, 100
          timeWaiting += 100
        }
      }

      return true
    } else {
      return false
    }
  }
}