class Refinator {
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
        ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/refinator_window.bmp

        if(ErrorLevel = 0) {
          Sleep, 500
          MouseClick, Left, corsX + 50, corsY + 55, 1, 0
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
        ImageSearch, corsX, corsY, 0, 0, A_ScreenWidth, A_ScreenHeight, *5 ./img/refinator_window.bmp

        if(ErrorLevel = 0) {
          MouseClick, Left, corsX + 5, corsY + 5, 1, 0
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
}