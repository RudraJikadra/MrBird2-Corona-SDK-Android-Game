
local storyboard = require ("storyboard")

local physics = require "physics"
physics.start()
physics.setGravity( 0, 60 )
local mydata = require( "mydata" )

local scene = storyboard.newScene()
	
mydata.score = 0


local widget = require( "widget" )

-- Import for Vungle ads
local ads = require "ads"

-- Change this to your App ID. You will need
-- separate App IDs for Android and iOS:
--local appID = "Test_Android"
local appID = "576d10b80d86ca9140000049"

_H = display.contentHeight
_W = display.contentWidth

local point_sound = audio.loadSound("point.wav")

local flap_sound = audio.loadSound("flap.mp3")

local hit_sound = audio.loadSound("hit.wav")

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
  bg1.speed = 4
  screenGroup:insert(bg1)

  bg2 = display.newImageRect("bg.png", 800, 1200)
  bg2.anchorX = 0.5
  bg2.x = display.contentCenterX
  bg2.y = display.contentHeight + 600         
  bg2.speed = 4
  screenGroup:insert(bg2)
  
      
  elements = display.newGroup()
  elements.anchorChildren = true
  elements.anchorX = 0
  elements.anchorY = 0 --1
  elements.x = 0
  elements.y = 0
  screenGroup:insert(elements)

  
  tile13 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile13.x = -80
  tile13.y = -240
  physics.addBody(tile13, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile13)
  
  tile1 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile1.x = -80
  tile1.y = 240
  physics.addBody(tile1, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile1)
  
  tile2 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile2.x = -80
  tile2.y = 720
  physics.addBody(tile2, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile2)
 
  tile3 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile3.x = -80
  tile3.y = 1200
  physics.addBody(tile3, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile3)
  
  tile11 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile11.x = -80
  tile11.y = 1680
  physics.addBody(tile11, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile11)
 --left tiles till here
 
  tile14 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile14.x = display.contentWidth + 80
  tile14.y = -240
  physics.addBody(tile14, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile14)
 
  tile4 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile4.x = display.contentWidth + 80
  tile4.y = 240
  physics.addBody(tile4, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile4)
  
  tile5 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile5.x = display.contentWidth + 80
  tile5.y = 720
  physics.addBody(tile5, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile5)
  
  tile6 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile6.x = display.contentWidth + 80
  tile6.y = 1200
  physics.addBody(tile6, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile6)
  
  tile12 = display.newImageRect("invisibleTile1.png", 25, 480)
  tile12.x = display.contentWidth + 80
  tile12.y = 1680
  physics.addBody(tile12, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile12)
 --right tiles till here
 
  tile7 = display.newImageRect("invisibleTile2.png", 480, 25)
  tile7.x = 240
  tile7.y = -300
  physics.addBody(tile7, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile7)
 
  tile8 = display.newImageRect("invisibleTile2.png", 480, 25)
  tile8.x = 720
  tile8.y = -300
  physics.addBody(tile8, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile8)
  --up tiles till here
  
  tile9 = display.newImageRect("invisibleTile2.png", 480, 25)
  tile9.x = 240
  tile9.y = display.contentHeight + 80
  physics.addBody(tile9, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile9)
 
  tile10 = display.newImageRect("invisibleTile2.png", 480, 25)
  tile10.x = 720
  tile10.y = display.contentHeight + 80
  physics.addBody(tile10, "static", {density=1, bounce=0.1, friction=.2})
  screenGroup:insert(tile10)
 --down tiles till here

   blackAlpha1 = display.newImageRect("blackAlpha.png", display.contentWidth, display.contentHeight)
	blackAlpha1.anchorX = 1
	blackAlpha1.anchorY = 0.5
	blackAlpha1.x = display.contentCenterX - 10
	blackAlpha1.y = display.contentCenterY
	blackAlpha1.alpha = 0.2
	screenGroup:insert(blackAlpha1)
	
	blackAlpha2 = display.newImageRect("blackAlpha.png", display.contentWidth, display.contentHeight)
	blackAlpha2.anchorX = 0
	blackAlpha2.anchorY = 0.5
	blackAlpha2.x = display.contentCenterX + 10
	blackAlpha2.y = display.contentCenterY
	blackAlpha2.alpha = 0.2
	screenGroup:insert(blackAlpha2)
 
 
    tapImage = display.newImageRect("tapImage.png", 250, 250)
	tapImage.anchorX = 0.5
	tapImage.anchorY = 0.5
	tapImage.x = display.contentCenterX + 200
	tapImage.y = display.contentHeight - 350
 	screenGroup:insert(tapImage)

 
    tapImage2 = display.newImageRect("tapImage2.png", 250, 250)
	tapImage2.anchorX = 0.5
	tapImage2.anchorY = 0.5
	tapImage2.x = display.contentCenterX - 200
	tapImage2.y = display.contentHeight - 350
 	screenGroup:insert(tapImage2)

 
 
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
	statue.x = display.contentCenterX
    statue.y = display.contentHeight/4 + 150
	statue:play()
	screenGroup:insert(statue)
	
	birdSheet = graphics.newImageSheet( "sprite1.png", p_options )
	bird = display.newSprite( birdSheet, { name="bird", start=1, count=8, time=1000 } )
	bird.x = display.contentCenterX
    bird.y = display.contentHeight/4 + 150
    physics.addBody(bird, "static", {density=.1, bounce=0.1, friction=.2, radius=38}) --radius=38
	bird:play()
	bird.alpha = 0
	screenGroup:insert(bird)
 
 


    scoreText = display.newText(mydata.score,100,
	display.contentHeight - 100, "pixelmix", 120)
	scoreText:setFillColor(0,0,0)
	scoreText.alpha = 0
	screenGroup:insert(scoreText)

    instructions = display.newImageRect("instructions.png",800,1200)
	instructions.anchorX = 0.5
	instructions.anchorY = 0.5
	instructions.x = display.contentCenterX
	instructions.y = display.contentCenterY
	screenGroup:insert(instructions)

		
    instructions2 = display.newImageRect("getready.png",700,219)
	instructions2.anchorX = 0.5
	instructions2.anchorY = 0.5
	instructions2.x = display.contentCenterX
	instructions2.y = display.contentHeight/4 - 100
	screenGroup:insert(instructions2)
	
	right = display.newImageRect("rt.png", 900, 2700)
    right.anchorX = 0
	right.anchorY = 0.5
	right.x = display.contentCenterX
	right.y = display.contentCenterY
	screenGroup:insert(right)



	left = display.newImageRect("lt.png", 900, 2700)
	left.anchorX = 1
	left.anchorY = 0.5
	left.x = display.contentCenterX
	left.y = display.contentCenterY
	screenGroup:insert(left)

	toContinue = display.newImageRect("tocontinue.png", display.contentWidth, display.contentHeight/2)
	toContinue.anchorX = 0.5
	toContinue.anchorY = 0.5
	toContinue.x = display.contentCenterX
	toContinue.y = display.contentCenterY
	toContinue.alpha = 0
	screenGroup:insert(toContinue)
	
	playAd = display.newImageRect("videoPlay.png",300,170)
	playAd.anchorX = 0.5
	playAd.anchorY = 0.5
	playAd.x = display.contentCenterX - 160
	playAd.y = display.contentHeight/1.7
	playAd.alpha = 0
	screenGroup:insert(playAd)
	
	
	cancelAd = display.newImageRect("cancel button.png",250,120)
	cancelAd.anchorX = 0.5
	cancelAd.anchorY = 0.5
	cancelAd.x = display.contentCenterX + 160
	cancelAd.y = display.contentHeight/1.7
	cancelAd.alpha = 0
	screenGroup:insert(cancelAd)
  

	
	loadingAds = display.newImageRect("loadsign.png", display.contentWidth, 13)
	loadingAds.anchorX = 1
	loadingAds.anchorY = 1
	loadingAds.x = display.contentWidth
	loadingAds.y = display.contentHeight - display.contentHeight/3.9
	loadingAds.alpha = 0
	screenGroup:insert(loadingAds)
  
  	asdf = display.newImageRect("sideBars.png", display.contentWidth, 13)
	asdf.anchorX = 1
	asdf.anchorY = 1
	asdf.x = display.contentWidth
	asdf.y = display.contentHeight - display.contentHeight/3.9
	asdf.alpha = 0
	screenGroup:insert(asdf)
  
  
  
  
end



function  gotoRestart()

	if loadingAds.x < 20 then
	
	storyboard.gotoScene("restart")
	
	end 

end



function videoTime()

   toContinue.alpha = 1
   asdf.alpha = 1
   loadingAds.alpha = 1
   playAd.alpha = 1
   cancelAd.alpha = 1
   bird:pause()
    physics.pause()
	Runtime:removeEventListener("touch", flyUp)
	Runtime:removeEventListener("enterFrame", bg1)
	Runtime:removeEventListener("enterFrame", bg2)
	timer.cancel(addColumnTimer)
	timer.cancel(moveColumnTimer)
	
	transition.to(loadingAds, {time = 3200, x = -100, onComplete = gotoRestart})

	
end




function onCollision( event )
	if ( event.phase == "began" ) then
	    audio.play(hit_sound)
			videoTime()
		--storyboard.gotoScene( "restart" )	
	end
end

function scrollBg(self,event) --scrollCity = scrollBg
      if self.y < -600 then
     self.y = display.contentHeight + 600
     else 
     self.y = self.y - self.speed
   end
end



function rtTouch(event)
  if event.phase == "ended" then
 -- print("aaaa")
bird:applyForce(150, -700, bird.x, bird.y)

   end
   
   
end


function ltTouch(event)
  if event.phase == "ended" then
 -- print("dddd")
bird:applyForce(-150, -700, bird.x, bird.y)

   end
   
   
end

local gameStarted = false

function flyUp(event)
   if event.phase == "began" then
           audio.play( flap_sound )
		if gameStarted == false then
		    right.alpha = 0
			left.alpha = 0
		--	blackAlpha1.alpha = 0
			--blackAlpha2.alpha = 0
			tapImage.alpha = 0
			tapImage2.alpha = 0
			statue.alpha = 0
			bird.alpha = 1
			bird.x = display.contentCenterX
			bird.y = display.contentHeight/4 + 150
			 bird.bodyType = "dynamic"
			 instructions.alpha = 0
		
		function Ready()
		instructions2.alpha = 0
		blackAlpha1.alpha = 0
		blackAlpha2.alpha = 0
		end
		transition.to(blackAlpha1, {time = 1000, x = -100})
		transition.to(blackAlpha2, {time = 1000, x = display.contentWidth + 100})
		transition.to(instructions2, {time = 1000, y = -500, onComplete = Ready})
			 scoreText.alpha = 1
			 addColumnTimer = timer.performWithDelay(2000, addColumns, -1)
			 moveColumnTimer = timer.performWithDelay(2, moveColumns, -1)
			 gameStarted = true
			 bird:applyForce(0, -300, bird.x, bird.y)
			 
		else 
       right.alpha = 1
	   left.alpha = 1
	   --bird:applyForce(0, -900, bird.x, bird.y)
	     scoreText.alpha = 1
      end
	end
	

	if
	
	bird.x > display.contentWidth + 80  then 
--	storyboard.gotoScene("restart")
	videoTime()
	end
	
	if
	
	bird.x < -80  then 
--	storyboard.gotoScene("restart")
	videoTime()
	end
	
	if
	
	bird.y < -200  then 
	--storyboard.gotoScene("restart")
	videoTime()
	end
	
	if
	
	bird.y > display.contentHeight + 80  then 
--	storyboard.gotoScene("restart")
	videoTime()
	end
	

end



function moveColumns()
		for a = elements.numChildren,1,-1  do
			if(elements[a].y < bird.y) then --display.contentHeight - 200
			
			
			   
				if elements[a].scoreAdded == false then

					mydata.score = mydata.score + 1
					scoreText.text = mydata.score
					elements[a].scoreAdded = true
					
					audio.play( point_sound )
				end
			end
			if(elements[a].y > -200) then
				elements[a].y = elements[a].y - 12
			else 
				elements:remove(elements[a])
			end	
		end
end




function addColumns() --add columns is in part 5
	--top=right
    --bottom=left
	width = math.random(display.contentCenterX - 200, display.contentCenterX + 200)
	
	rightColumn = display.newImageRect('rightColumn.png',714,150)
	rightColumn.anchorX = 0
	rightColumn.anchorY = 0
	rightColumn.x = width + 150 --display.contentWidth + 100
	rightColumn.y = display.contentHeight + 200    --width - 160
	rightColumn.scoreAdded = false
	physics.addBody(rightColumn, "static", {density=1, bounce=0.1, friction=.2})
	elements:insert(rightColumn)
	
	leftColumn = display.newImageRect('leftColumn.png',714,150)
	leftColumn.anchorX = 1
	leftColumn.anchorY = 0
	leftColumn.x = width - 150  --display.contentWidth + 100
	leftColumn.y = display.contentHeight + 200     --width + 160
	physics.addBody(leftColumn, "static", {density=1, bounce=0.1, friction=.2})
	elements:insert(leftColumn)

end	

-- contentWidth=full screeen width



function endGame(event)

--storyboard.gotoScene( "game2" )
transition.cancel(loadingAds)
storyboard.gotoScene( "restart" )
--storyboard.gotoScene( "game2" )

end


function startAd(event)
 print("ads are catching")
        -- On click, we call ads.show()
        ads.show( "incentivized" )

end



local function checkMemory()
   collectgarbage( "collect" )
   local memUsage_str = string.format( "MEMORY = %.3f KB", collectgarbage( "count" ) )
 --  print( memUsage_str, "TEXTURE = "..(system.getInfo("textureMemoryUsed") / (1024 * 1024) ) )
end


function scene:enterScene(event)

  
  storyboard.removeScene("start")
  Runtime:addEventListener("touch", flyUp)
 
  bg1.enterFrame = scrollBg
  Runtime:addEventListener("enterFrame", bg1)

  bg2.enterFrame = scrollBg
  Runtime:addEventListener("enterFrame", bg2)

  Runtime:addEventListener("collision", onCollision)
  
   right:addEventListener("touch", rtTouch)
	left:addEventListener("touch", ltTouch)
  
   
  	-----for ads
  playAd:addEventListener("touch", startAd)
  cancelAd:addEventListener("touch", endGame)
 
  memTimer = timer.performWithDelay( 1000, checkMemory, 0 )
  
end


function scene:exitScene(event)
    
	Runtime:removeEventListener("touch", flyUp)
	Runtime:removeEventListener("enterFrame", bg1)
	Runtime:removeEventListener("enterFrame", bg2)
	Runtime:removeEventListener("collision", onCollision)
	timer.cancel(addColumnTimer)
	timer.cancel(moveColumnTimer)
	timer.cancel(memTimer)
	
end


function scene:destroyScene(checkMemory)

end



-- AD EVENT LISTENER
-- Set this up before ads.init
local function vungleAdListener( event )
    if ( event.type == "adStart" and event.isError ) then
        -- Ad has not finished caching and will not play
    end
    if ( event.type == "adStart" and not event.isError ) then
        -- Ad will play
     transition.cancel(loadingAds)
       
    end
    if ( event.type == "cachedAdAvailable" ) then
        -- Ad has finished caching and is ready to play
       -- playAd.alpha = 1
      
     
    end
    if ( event.type == "adView" ) then
        -- An ad has completed
    end
    if ( event.type == "adEnd" ) then
        -- The ad experience has been closed- this
        -- is a good place to resume your app
		storyboard.gotoScene( "game2" )
    end
end



-- Do this as early as possible in your app
-- An ad will begin caching on init and it can take
-- up to 30 seconds before it is ready to play
ads.init( "vungle", appID, vungleAdListener )






scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)




return scene

--x =800  y = 1200