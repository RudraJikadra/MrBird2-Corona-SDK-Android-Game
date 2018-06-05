
local storyboard = require ("storyboard")

local scene = storyboard.newScene()




function scene:createScene(event)

   local screenGroup = self.view

    infoPage = display.newImageRect("infoPage.png", display.contentWidth, display.contentHeight)
	infoPage.anchorX = 0.5
	infoPage.anchorY = 0.5
	infoPage.x = display.contentCenterX
	infoPage.y = display.contentCenterY
    screenGroup:insert(infoPage)
	
	

    cross = display.newImageRect("cross.png",80,80)
	cross.anchorX = 1
	cross.anchorY = 1
	cross.x = display.contentWidth - 37
	cross.y = display.contentHeight - 37
	screenGroup:insert(cross)
   
   
end



function cancelInfoPage(event)

       if event.phase == "ended" then
	 storyboard.gotoScene("start")
     end

end




function scene:enterScene(event)
 	storyboard.removeScene("start")
  	storyboard.removeScene("restart")
	--start:addEventListener("touch", startGame)
	cross:addEventListener("touch", cancelInfoPage)

	
end


function scene:exitScene(event)

	--start:removeEventListener("touch", startGame)
	cross:removeEventListener("touch", cancelInfoPage)
	--transition.cancel(downTransition)
--	transition.cancel(upTransition)
	
  
end




scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)

return scene
