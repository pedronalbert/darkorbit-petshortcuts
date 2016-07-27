#SingleInstance, Force

CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

InputBox, searchAllien, "Allient to track", "Allient To Track"

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