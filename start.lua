local physics = require "physics"
physics.start()
local mydata = require( "mydata" )
local storyboard = require ("storyboard")

local scene = storyboard.newScene()

mydata.score = 0



--local select_sound = audio.loadSound("select.wav")
local swoosh_sound = audio.loadSound("swoosh.wav")

function titleTransitionDown()
	downTransition = transition.to(titleGroup,{time=400, y=titleGroup.y+30,onComplete=titleTransitionUp})
	
end

function titleTransitionUp()
	upTransition = transition.to(titleGroup,{time=400, y=titleGroup.y-30, onComplete=titleTransitionDown})
	
end


function titleAnimation()
	titleTransitionDown()
end

function scene:createScene(event)

   local screenGroup = self.view
   
  bg0 = display.newImageRect("bg0.png", 1800, 2700)
  bg0.x = 400
  bg0.y = 600
  screenGroup:insert(bg0)
   
  bg1 = display.newImageRect("bg.png", 800, 1200)
	bg1.anchorX = 0.5
	bg1.anchorY = 0.5
	bg1.x = display.contentCenterX
	bg1.y = display.contentCenterY
  screenGroup:insert(bg1)
  
	
    start = display.newImageRect("start_btn.png",321,185)
	start.anchorX = 0.5
	start.anchorY = 1
	start.x = display.contentCenterX - 160
	start.y = display.contentCenterY + 500
	screenGroup:insert(start)

		
    infoLogo = display.newImageRect("infoLogo.png",80,80)
	infoLogo.anchorX = 1
	infoLogo.anchorY = 1
	infoLogo.x = display.contentWidth - 37
	infoLogo.y = display.contentHeight - 37
	screenGroup:insert(infoLogo)
	
	rightColumn = display.newImageRect("rightColumn.png",714,150)
	rightColumn.anchorX = 0.5
	rightColumn.anchorY = 0.5
	rightColumn.x = display.contentCenterX + 650
	rightColumn.y = display.contentCenterY - 100
	screenGroup:insert(rightColumn)
	
	
    leftColumn = display.newImageRect("leftColumn.png",714,150)
	leftColumn.anchorX = 0.5
	leftColumn.anchorY = 0.5
	leftColumn.x = display.contentCenterX - 650
	leftColumn.y = display.contentCenterY - 100
	screenGroup:insert(leftColumn)
	
	title = display.newImageRect("title.png",600,530)
	title.anchorX = 0.5
	title.anchorY = 0.5
	title.x = display.contentCenterX
	title.y = display.contentCenterY 
	screenGroup:insert(title)
	
  		p_options = 
	{
		-- Required params
		width = 100,
		height = 150,
		numFrames = 8,
		-- content scaling
		sheetContentWidth = 800,
		sheetContentHeight = 150,
	}




	birdSheet = graphics.newImageSheet( "sprite1.png", p_options )
	statue = display.newSprite( birdSheet, { name="statue", start=1, count=8, time=1200 } )
	statue.x = display.contentCenterX + 20
    statue.y = display.contentCenterY - 80
	statue:play()
	screenGroup:insert(statue)

  
  	titleGroup = display.newGroup()
	titleGroup.anchorChildren = true
	titleGroup.anchorX = 0.5
	titleGroup.anchorY = 0.5
	titleGroup.x = display.contentCenterX + 50
	titleGroup.y = display.contentCenterY - 150
	titleGroup:insert(title)
	titleGroup:insert(statue)
	screenGroup:insert(titleGroup)
	titleAnimation()

  
end


function startGame(event)
     if event.phase == "ended" then
	-- audio.play( select_sound )
	 audio.play(swoosh_sound)
	 storyboard.gotoScene("game")
     end
end


function infoPage(event)

       if event.phase == "ended" then
	 storyboard.gotoScene("info")
     end

end

function scene:enterScene(event)

  	storyboard.removeScene("restart")
	start:addEventListener("touch", startGame)
	infoLogo:addEventListener("touch", infoPage)
	
end


function scene:exitScene(event)

	start:removeEventListener("touch", startGame)
	infoLogo:removeEventListener("touch", infoPage)
	transition.cancel(downTransition)
	transition.cancel(upTransition)
	
  
end


function scene:destroyScene(event)

end





scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene

--x =800  y = 1200