local enableSystem = true
local beat = 3;
local zoomVal = 0.02; -- adjust this to how much you want it to zoom

local otherSongs = null
function onCreate()
end

function lerp(a, b, ratio)
	return a + ratio * (b - a);
end

function onCreatePost()
	initLuaShader('radialBlur')

	makeLuaSprite('shadertest', '', 0, 0);
	setSpriteShader('shadertest','radialBlur')

	setShaderFloat('shadertest','cx',0.5) --center x
	setShaderFloat('shadertest','cy',0.5) --center y
	setShaderFloat('shadertest','blurWidth',0)-- blur amount
    	addHaxeLibrary("ShaderFilter", "openfl.filters")
	runHaxeCode([[
		trace(ShaderFilter);
		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shadertest").shader)]);
	]])

	if otherSongs[songName:lower()] then
		beat = otherSongs[songName:lower()];
	end
end





function opponentNoteHit()
		setShaderFloat('shadertest', 'blurWidth', getShaderFloat('shadertest', 'blurWidth') + zoomVal);
	end

    
    function goodNoteHit()
        setShaderFloat('shadertest', 'blurWidth', getShaderFloat('shadertest', 'blurWidth') + zoomVal);
end






--[[If you want to know the credits:
i got a ideia of the script by Washo789, 
the script is made by BF Myt.]]--

function onUpdate()
		if getProperty('camZooming') then
		setShaderFloat('shadertest','blurWidth', lerp(0, getShaderFloat('shadertest', 'blurWidth'), 0.85));
        end
    end

	function onUpdatePost()
	end


	function onBeatHit()
	end
    
function onStepHit()
    
    if curStep == 528 then
         zoomVal = 0
		 removeSpriteShader('radialBlur') 
		 runHaxeCode([[
            trace(ShaderFilter);
            game.camHUD.setFilters([]);
        ]])

    end


    if curStep == 787 then

		setSpriteShader('shadertest','radialBlur')

		runHaxeCode([[
            trace(ShaderFilter);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shadertest").shader)]);
        ]])
       zoomVal = 0.02
        

    end


    if curStep == 1583 then
        zoomVal = 0.03
end
end


function onStartCountdown() end
function onCountdownStarted() end
function onCountdownTick(swagCounter) end
function onUpdateScore() end
function onNextDialogue(line) end
function onSkipDialogue(line) end
function eventEarlyTrigger(name) end
function onResume() end
function onSpawnNote(id, dir, type, sustain) end
function onGameOver() end
function onGameOverStart() end
function onGameOverConfirm(retry) end
function onMoveCamera(target) end
function onEndSong() end
function onGhostTap(key) end
function onKeyPress(key) end
function onKeyRelease(key) end
function noteMissPress(dir) end
function onSectionHit() end
function onRecalculateRating() end
function onTweenCompleted(tag) end
function onSoundFinished(tag) end
function onCustomSubstateCreate(name) end
function onCustomSubstateCreatePost(name) end
function onCustomSubstateUpdate(name, elapsed) end
function onCustomSubstateUpdatePost(name, elapsed) end
function onCustomSubstateDestroy(name) end
function onDestroy() end




