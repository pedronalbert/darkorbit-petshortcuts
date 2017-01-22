#SingleInstance, Force

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

searchAllien := "kristallon"

#Include, ./src/Refinator.ahk
#Include, ./src/Pet.ahk

displayShortcutsList() {
  MsgBox,,Comandos, Alt+Q Kamikaze `nAlt+W Defensive `nAlt+E Revive Pet `nAlt+E Tracker `nAlt+R Autocollector `nF4 Refine `nF2 Change Alien Tracker
}

displayShortcutsList()

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
  Pet.setTracker(searchAllien)
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

  Refinator.closeRefinatorWindow()
  MouseMove, mouseX, mouseY, 0
return

f2::
  InputBox, searchAllien, "Allient to track", "Allient To Track"
return

f1::
  displayShortcutsList()
return