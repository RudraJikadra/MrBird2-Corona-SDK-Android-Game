-- requires 


local storyboard = require ("storyboard")
local scene = storyboard.newScene()
local mydata = require( "mydata" )
local score = require( "score" )

-- background


local RevMob = require("revmob")
local banner = RevMob.createBanner({x = display.contentWidth / 2, y = 50, width = display.contentWidth, height = 100 })
 
local fullscreen = RevMob.createFullscreen()

local swoosh_sound = audio.loadSound("swoosh.wav")

function restartGame(event)
     if event.phase == "ended" then
		saveScore()
		
		audio.play(swoosh_sound)
		fullscreen:hide()
		storyboard.gotoScene("start")
     end
end

function showStart()
	startTransition = transition.to(restart,{time=1000, alpha=1})
	scoreTextTransition = transition.to(scoreText,{time=600, alpha=1})
	scoreTextTransition = transition.to(bestText,{time=600, alpha=1})
end

function showScore()
    scoreTransition = transition.to(medal0,{time=400, y=display.contentCenterY + 23})
	scoreTransition = transition.to(scoreBg,{time=400, y=display.contentCenterY,onComplete=showStart})
	
	local prevScore = score.load()	
		if prevScore <= mydata.score then
			scoreTransition = transition.to(medal,{time=400, y=display.contentCenterY + 23})
			new.alpha = 1
			end
	
	
	audio.play(swoosh_sound)
	
end

function showGameOver()
	     transition.to(gameOver,{time=700, xScale=1, yScale=1, x = display.contentCenterX, y = display.contentCenterY - 400, onComplete=showScore})

end



function loadScore()
	local prevScore = score.load()	
	
	if prevScore ~= nil then
		if prevScore <= mydata.score then
			score.set(mydata.score)
			
			--scoreTransition = transition.to(medal,{time=400, y=display.contentCenterY + 23})
			
		else 
			score.set(prevScore)	
		end
	
	else 
		score.set(mydata.score)	
		score.save()
		
	end
end

function saveScore()
	score.save()
end

function scene:createScene(event)

	local screenGroup = self.view
	
	bg0 = display.newImageRect("bg0.png", 1800, 2700)
    bg0.x = 400
    bg0.y = 600
    screenGroup:insert(bg0)

	background = display.newImageRect("bg.png",800,1200)
	background.anchorX = 0.5
	background.anchorY = 0.5
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	screenGroup:insert(background)
	
	gameOver = display.newImageRect("gameOver.png",500,120)
	gameOver.anchorX = 0.5
	gameOver.anchorY = 0.5
	gameOver.x = display.contentCenterX 
	gameOver.y = display.contentCenterY - 400
	gameOver.xScale = 4
    gameOver.yScale = 4
	screenGroup:insert(gameOver)
	
	medal0 = display.newImageRect("medal0.png",145,164)
	medal0.anchorX = 0.5
	medal0.anchorY = 0.5
	medal0.x = display.contentCenterX - 99
	medal0.y = display.contentHeight + 500
	medal0.alpha = 1
	screenGroup:insert(medal0)
	
	medal = display.newImageRect("medal.png",145,164)
	medal.anchorX = 0.5
	medal.anchorY = 0.5
	medal.x = display.contentCenterX - 98
	medal.y = display.contentHeight + 500
	medal.alpha = 1
	screenGroup:insert(medal)
	
	scoreBg = display.newImageRect("menuBg.png",480,393)
	scoreBg.anchorX = 0.5
	scoreBg.anchorY = 0.5
    scoreBg.x = display.contentCenterX
    scoreBg.y = display.contentHeight + 500
    screenGroup:insert(scoreBg)
	
	new = display.newImageRect("new.png", 100, 80)
	new.anchorX = 0.5
	new.anchorY = 0.5
	new.x = display.contentCenterX - 94
	new.y = display.contentCenterY - 80
	new.alpha = 0
	screenGroup:insert(new)
	
	restart = display.newImageRect("start_btn.png",321,185)
	restart.anchorX = 0.5
	restart.anchorY = 1
	restart.x = display.contentCenterX - 160
	restart.y = display.contentCenterY + 500
	restart.alpha = 0
	screenGroup:insert(restart)
	
	
	scoreText = display.newText(mydata.score,display.contentCenterX + 110,
	display.contentCenterY - 60, native.systemFont, 50)
	scoreText:setFillColor(0,0,0)
	scoreText.alpha = 0 
	screenGroup:insert(scoreText)
		
	bestText = score.init({
	fontSize = 50,
	font = "Helvetica",
	x = display.contentCenterX + 70,
	y = display.contentCenterY + 85,
	maxDigits = 7,
	leadingZeros = false,
	filename = "scorefile.txt",
	})
	bestScore = score.get()
	bestText.text = bestScore
	bestText.alpha = 0
	bestText:setFillColor(0,0,0)
	screenGroup:insert(bestText)
	
end


function scene:enterScene(event)


    banner:show()
	
    fullscreen:show()
	
	storyboard.removeScene("game")
	storyboard.removeScene("game2")
	restart:addEventListener("touch", restartGame)
	showGameOver()
	loadScore()
end

function scene:exitScene(event)
	restart:removeEventListener("touch", restartGame)
--	transition.cancel(fadeTransition)
	transition.cancel(scoreTransition)
	transition.cancel(scoreTextTransition)
	transition.cancel(startTransition)
end

function scene:destroyScene(event)

end




local AMAZON_APK = false
local REVMOB_IDS = {
 [REVMOB_ID_IOS] = '5673e5cfb7e7b8f06c674ade',
 [REVMOB_ID_ANDROID] = '5673e5cfb7e7b8f06c674ade',
 
}

if AMAZON_APK then REVMOB_IDS[REVMOB_ID_ANDROID] = '5673e5cfb7e7b8f06c674ade' end

   RevMob.startSession(REVMOB_IDS)
  -- RevMob.setTestingMode(RevMob.TEST_WITH_ADS)
 --  RevMob.showFullscreen()





scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene













