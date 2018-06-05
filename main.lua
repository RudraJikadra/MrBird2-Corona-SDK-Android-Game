display.setStatusBar(display.HiddenStatusBar)

local storyboard = require "storyboard"



local bg_sound = audio.loadStream("bgSound.mp3")
local rj1 = display.newImageRect("RR1.png", display.contentWidth, display.contentHeight)
rj1.anchorX = 0.5
rj1.anchorY = 0.5
rj1.x = display.contentCenterX
rj1.y = display.contentCenterY
transition.fadeOut( rj1, { time=1000, delay=5000, onComplete=storyboard.gotoScene("start") } ) 

audio.play(bg_sound, {loops=-1})
 




