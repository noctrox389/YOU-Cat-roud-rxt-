function onCreate()



	precacheSound("pixel")
	setProperty("skipCountdown", true)

	-- messy af my bad
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');

	makeLuaSprite('YCR_sky', 'SonicP2/sky', -650, -300);
	setScrollFactor('YCR_sky', 1.1, 0.6)
	makeLuaSprite('YCR_Grass', 'SonicP2/Grass', -610, -150)
	makeLuaSprite('YCR_trees', 'SonicP2/trees', -50, -150)
	makeLuaSprite('YCR_TreesFront', 'SonicP2/TreesFront', -550, -150)
	makeLuaSprite('YCR_GrassBack', 'SonicP2/GrassBack', -620, -250)
	setScrollFactor('YCR_GrassBack', 1.4, 0.6)
	makeLuaSprite('YCR_TopOverlay', 'SonicP2/TopOverlay', -550, -150)
	makeLuaSprite('encorefloor', 'SonicP2/encorebgfloor1', -500, -240)
	makeLuaSprite('encoresky', 'SonicP2/encorebgsky1', -500, -240)
	setScrollFactor('encoresky', 0.65, 1.25)
	makeLuaSprite('sussyred','RedVG',0,0)
	setObjectCamera('sussyred', 'other');
	setScrollFactor('sussyred', 0, 0)
	scaleObject('encorefloor', 0.78, 0.78);
	scaleObject('encoresky', 0.8, 0.8);
	setScrollFactor('YCR_sky', 0.91, 0.91);
	setScrollFactor('YCR_GrassBack', 1.065, 1.0);
	setScrollFactor('YCR_trees', 1.025, 1.0);
	setProperty('YCR_sky.antialiasing', true);
	setProperty('p3_Stats.antialiasing', true);
	setProperty('YCR_backtrees.antialiasing', true);
	setProperty('YCR_floor.antialiasing', true);
	setProperty('YCR_trees.antialiasing', true);
	setProperty('sussyred.visible', false)
	
	setProperty('timeBar.color', getColorFromHex('EA1D0E'))

	makeAnimatedLuaSprite('ring','ring', 900, 4430);
	addAnimationByPrefix('ring','ring','ring',50, true);
	objectPlayAnimation('ring','ring',true);
	setProperty('ring.antialiasing', false);
      scaleObject('ring', 3, 3);



	  
	-- makeAnimatedLuaSprite('ring2','ring2', 460, -120);
	-- addAnimationByPrefix('ring2','ring2','ring2',50, true);
	-- objectPlayAnimation('ring2','ring2',true);
	-- setProperty('ring2.antialiasing', false);
    -- scaleObject('ring2', 4.7, 4.7);

	makeLuaSprite('thefrickinbg2', 'SonicP2/greenhill', -372, 3666);
	setProperty('thefrickinbg2.antialiasing', false);
	scaleObject('thefrickinbg2', 6.5, 6.5);

	makeLuaSprite('thefrickinbg2bg', 'SonicP2/greenhillbg', -362, 1966);
	setProperty('thefrickinbg2bg.antialiasing', false);
	setScrollFactor('thefrickinbg2bg', 1.4, 0.6)
	
	scaleObject('thefrickinbg2bg', 6.5, 6.5);


	makeLuaSprite('finalescape','heeheehaw',0,0)
	scaleObject('finalescape', 0.58, 0.58);
    setObjectCamera('finalescape', 'other');

	makeLuaSprite("ringmarch",'raymarcher1', -920, -450)
	scaleObject('ringmarch', 1.16, 1.19);
	setScrollFactor('ringmarch', 1.8, 1.2)


	--makeLuaSprite('crowd', 'crowd12', -500, 50);
	--setObjectCamera('crowd', 'hud');
	--setProperty('crowd.visible', false);


	setProperty('YCR_sky.visible', false);
	setProperty('YCR_Grass.visible', false);
	setProperty('ring2.visible', false)
	setProperty('YCR_GrassBack.visible', false);
	setProperty('ring.visible', true)
	setProperty('finalescape.visible', false)
	setProperty('ringmarch.visible', false)


	
	addLuaSprite('YCR_sky', false)
	addLuaSprite('YCR_GrassBack', false)
	--addLuaSprite('YCR_trees', false)
	addLuaSprite('ringmarch', false)
	addLuaSprite('YCR_Grass', false)
	--addLuaSprite('YCR_TopOverlay', false)
	--addLuaSprite('YCR_TreesFront', false)
   addLuaSprite('encoresky', false)
	addLuaSprite('encorefloor', false)
	--addLuaSprite('crowd', false)
	addLuaSprite('sussyred',true)
	addLuaSprite('finalescape',true)
end



function onCreatePost()


	--testing sonic.exe text

    initLuaShader("parralax")

	

	makeLuaText('exescrolltext', ' SONIC.EXE  SONIC.EXE   SONIC.EXE   SONIC.EXE   SONIC.EXE   SONIC.EXE   SONIC.EXE   SONIC.EXE ', 1250, 15, 0) -- Coder Tag --
	setTextSize('exescrolltext', 23)
	setTextColor('exescrolltext','FF000A')
	setObjectCamera('exescrolltext', 'camHUD')


	makeLuaText('exescrolltext2', ' SONIC.EXE  SONIC.EXE   SONIC.EXE   SONIC.EXE   SONIC.EXE   SONIC.EXE   SONIC.EXE   SONIC.EXE ', 1250, 15, 690) -- Coder Tag --
	setTextSize('exescrolltext2', 23)
	setTextColor('exescrolltext2','FF000A')
	setObjectCamera('exescrolltext2', 'camHUD')
	
	setSpriteShader('exescrolltext',"parralax")
	setSpriteShader('exescrolltext2',"parralax")

	initLuaShader("ringmarchshader")
	setSpriteShader('ringmarch',"ringmarchshader")
	precacheImage("PIXEL_NOTE_assets")
	precacheImage("NOTE_assets")

	addLuaText('exescrolltext', false)
	addLuaText('exescrolltext2', false)

	setProperty('exescrolltext.visible', false);
		setProperty('exescrolltext2.visible', false);
end


function onStepHit()
	if curStep == 520 then

		triggerEvent('Change Character', 'bf', 'bf-pixel-sonic');

		triggerEvent('Change Character', 'gf', 'gf-pixel-sonic');

		triggerEvent('Change Character', 'dad', 'pixelrunsonic');

		setCharacterX('boyfriend', 400);

		setCharacterY('boyfriend', 4229);

		setCharacterX('dad', 800);

		setCharacterY('dad', 4604);

		setCharacterX('gf', 400);

		setCharacterY('gf', 4228);

		setProperty('YCR_sky.visible', false);
		setProperty('YCR_Grass.visible', false);
		setProperty('YCR_trees.visible', false);
		setProperty('YCR_GrassBack.visible', false);
		setProperty('YCR_TopOverlay.visible', false);
		setProperty('YCR_TreesFront.visible', false);
		

		addLuaSprite('thefrickinbg2bg', false);
		addLuaSprite('thefrickinbg2', false);
		addLuaSprite('ring',false)

		
		setPropertyFromGroup('playerStrums', 0, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('playerStrums', 1, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('playerStrums', 2, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('playerStrums', 3, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('opponentStrums', 0, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('opponentStrums', 1, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('opponentStrums', 2, 'texture', 'PIXEL_NOTE_assets');
		setPropertyFromGroup('opponentStrums', 3, 'texture', 'PIXEL_NOTE_assets');
	
	end


	if curStep == 528 then
		setProperty('exescrolltext.visible', true);
		setProperty('exescrolltext2.visible', true);
	
	end



	if curStep == 783 then
		removeLuaText('exescrolltext')
		removeLuaText('exescrolltext2')
		
		triggerEvent('Change Character', 'bf', 'bf-encore');

		triggerEvent('Change Character', 'dad', 'ycr-mad');
		
		triggerEvent('Change Character', 'gf', 'gf');

		setCharacterX('boyfriend', 845);

		setCharacterY('boyfriend', 50);

		setCharacterX('dad', 60);

		setCharacterY('dad', -270);

		setCharacterX('gf', 325);

		setCharacterY('gf', 30);

		setProperty('YCR_GrassBack.visible', false);
		setProperty('YCR_TopOverlay.visible', false);
		setProperty('YCR_TreesFront.visible', false);
		setProperty('thefrickinbg2.visible', false);
		setProperty('defaultCamZoom',0.65)
		
		setPropertyFromGroup('playerStrums', 0, 'texture', 'NOTE_assets');
		setPropertyFromGroup('playerStrums', 1, 'texture', 'NOTE_assets');
		setPropertyFromGroup('playerStrums', 2, 'texture', 'NOTE_assets');
		setPropertyFromGroup('playerStrums', 3, 'texture', 'NOTE_assets');
		setPropertyFromGroup('opponentStrums', 0, 'texture', 'NOTE_assets');
		setPropertyFromGroup('opponentStrums', 1, 'texture', 'NOTE_assets');
		setPropertyFromGroup('opponentStrums', 2, 'texture', 'NOTE_assets');
		setPropertyFromGroup('opponentStrums', 3, 'texture', 'NOTE_assets');

		setProperty('thefrickinbg2.visible', false);
		setProperty('thefrickinbg2bg.visible', false);
    end
end





function onUpdate()
	setShaderFloat("ringmarch", "iTime", getSongPosition() / 1000)
	setShaderFloat("exescrolltext", "iTime", os.clock())
end
function onUpdatePost(elapsed)
end
function opponentNoteHit(i, d, t, s)
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
function goodNoteHit(id, dir, type, sustain) end
function onBeatHit() end
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