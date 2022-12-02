local ffi = require("ffi")  -- LuaJIT Extension
local user32 = ffi.load("user32")   -- LuaJIT User32 DLL Handler Function
local i = 1
local deeznutz = false
local username = os.getenv('USERNAME');

ffi.cdef([[
enum{
    MB_OK = 0x00000000L,
	MB_OKCANCEL = 0x00000001L,
    MB_ABORTRETRYIGNORE = 0x00000002L,
    MB_YESNOCANCEL = 0x00000003L,
    MB_YESNO = 0x00000004L,
    MB_RETRYCANCEL = 0x00000005L,
    MB_CANCELTRYCONTINUE = 0x00000006L,
    MB_HELP = 0x00004000L,
    MB_ICONWARNING = 0x00000030L,
    MB_ICONINFORMATION = 0x00000040L,
    
};

typedef void* HANDLE;
typedef HANDLE HWND;
typedef const char* LPCSTR;
typedef unsigned UINT;

int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
int MessageBoxW(HWND, LPCSTR, LPCSTR, UINT);
]])





local hidestuff = true




function onCreatePost()
    --shader crap, tehehehehehehlelelelele

    shaderCoordFix()

    initLuaShader("mosaic")

    initLuaShader("bloom")

    initLuaShader("blaze")

    initLuaShader("monitor")

    --initLuaShader("blazecolor")

    initLuaShader("lava")

    initLuaShader("suslmao")

    initLuaShader("vcr")

    initLuaShader("redlights")

    initLuaShader("bluelights")

    initLuaShader("lights")
    
    makeLuaSprite("shaderImage")
    makeGraphic("shaderImage", screenWidth, screenHeight)

    
    setSpriteShader("shaderImage", "redlights")
    setSpriteShader('thefrickinbg2bg',"lava")
    setSpriteShader('encoresky',"tabi")
    setSpriteShader('ring2',"bloom")
    setSpriteShader('exescrolltext',"parralax")



   
    

    --sonic1 hud FROM TARNISHED MOD
    setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Elapsed')
	setPropertyFromClass('ClientPrefs', 'songScoreType', 'Score Elapsed') 
    setPropertyFromClass('ClientPrefs', 'timeBarType', 'Time Elapsed')

    makeLuaText('score', 'SCORE', 0, 970, 22)
    setTextColor('score', 'FFFF00')
    setTextBorder('score', 2.99, '000000')
    addLuaText('score')
    setTextFont('score', 'sonic-the-hedgehog-2-hud-font.ttf')
    
    makeLuaText('scorecount', '', 0, 1000, 20)
    setTextBorder('scorecount', 2.3, '000000')
    addLuaText('scorecount')
    setTextFont('scorecount', 'sonic1hud.ttf')

    makeLuaText('time', 'TIME', 0, 970, 71)
    setTextColor('time', 'FFFF00')
    setTextBorder('time', 2.99, '000000')
    addLuaText('time') 
    setTextFont('time', 'sonic-the-hedgehog-2-hud-font.ttf')
	
	makeLuaText('timecount', '', 0, 1000, 69)
    setTextBorder('timecount', 2.3, '000000')
	addLuaText('timecount')
    setTextFont('timecount', 'sonic1hud.ttf')

    makeLuaText('rings', 'RINGS', 0, 970, 122)
	setTextColor('rings', 'FF0500')
    setTextBorder('rings', 2.99, '000000')
	addLuaText('rings')
    setTextFont('rings', 'sonic-the-hedgehog-2-hud-font.ttf')
	
	makeLuaText('ringscount', '       -2', 0, 1000, 118)
    setTextColor('ringscount', 'FF0000')
    setTextBorder('ringscount', 2.3, '000000')
	addLuaText('ringscount')
    setTextFont('ringscount', 'sonic1hud.ttf')
	
	
	setTextSize('missescount', 50)
	setTextSize('misses', 50)
	setTextSize('time', 50)
    setTextSize('score', 50)
    setTextSize('scorecount', 50)
    setTextSize('timecount', 50) 
    setTextSize('rings', 50)
    setTextSize('ringscount', 50)


    setSpriteShader('missescount',"mosaic")
    setSpriteShader('misses',"mosaic")
    setSpriteShader('time',"mosaic")
    setSpriteShader('score',"mosaic")
    setSpriteShader('scorecount',"mosaic")
    setSpriteShader('timecount',"mosaic")
    setSpriteShader('rings',"mosaic")
    setSpriteShader('ringscount',"mosaic")


--ycr startscreen
get = getRandomInt(1,1)

	makeLuaSprite('readthefiletitlelol', 'dablack', 0, 0);

    makeLuaSprite('introcircle', 'CircleYouCantRun', 777, 0);

    makeLuaSprite('introtext', 'TextYouCantRun', -1200, 0);
	
	scaleObject('readthefiletitlelol', 2.0, 2.0);
	
	setObjectCamera('readthefiletitlelol', 'other');
	setObjectCamera('introcircle', 'other');
	setObjectCamera('introtext', 'other');


	
	addLuaSprite('readthefiletitlelol', true);
	addLuaSprite('introcircle', true);
	addLuaSprite('introtext', true);

end

function onSongStart()
	doTweenX('circleTween', 'introcircle', -100, 2, 'quintOut')
	doTweenX('textTween', 'introtext', 100, 2, 'quintOut')
	runTimer('weeb2',2)
end

function onUpdate()

    
    --sonic1 hud
    setTextString('timecount', '       '  .. getTextString('timeTxt'))
    setTextString('scorecount', '       ' .. getProperty('songScore'))

    --misc
    setProperty('gf.visible', false)
    setProperty('timeBar.color', getColorFromHex('EA1D0E'))



    --shader crap

    setShaderFloat("shaderImage", "iTime", os.clock())
    setShaderFloat("encoresky", "iTime", os.clock())
    setShaderFloat("thefrickinbg2bg", "iTime", os.clock())
    setShaderFloat("BorderLeft", "iTime", os.clock())
    setShaderFloat("BorderRight", "iTime", os.clock())
    setShaderFloat("thanks", "iTime", os.clock())
    setShaderFloat("CREDITS", "iTime", os.clock())
    setShaderFloat("MUSICIANS", "iTime", os.clock())
    setShaderFloat("CODERS", "iTime", os.clock())
    setShaderFloat("ARTISTS", "iTime", os.clock())
    setShaderFloat("ringmarch", "iTime", os.clock())
    setShaderFloat("shadertest", "iTime", os.clock())


--ycr stuff
end


function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'notfuckedanymore' then
        removeLuaSprite('theshitassthatdistractsyou', false);
    end
    if tag == 'bye1' then
        removeLuaSprite('wowa', false);
    end
    if tag == 'bye2' then
        removeLuaSprite('wowa2', false);
    end
	if tag == 'weeb2' then
		doTweenAlpha('graphicAlpha', 'readthefiletitlelol', 0, 0.4, 'linear');
		doTweenAlpha('circleAlpha', 'introcircle', 0, 0.4, 'linear');
		doTweenAlpha('textAlpha', 'introtext', 0, 0.4, 'linear');
		runTimer('savespace',2)
	end
	if tag == 'savespace' then
		removeLuaSprite('introtext', true)
		removeLuaSprite('introcircle', true)
		removeLuaSprite('readthefiletitlelol', true)
	end

    if tag == 'vrug' then
		runTimer('vrug2', 1.2)
		doTweenAlpha('sussyredAlpha', 'sussyred', 0, 1.0, 'quintIn')
	end

    if tag == 'vrug2' then
		runTimer('vrug', 0.6)
		doTweenAlpha('sussyredAlpha', 'sussyred', 1.0, 1.0, 'quintOut')
	end
end


function onEvent(name, value1, value2)
    if name == 'YOU MISSED THE STATIC NOTE NOW GET FUCKED' then
        makeAnimatedLuaSprite('theshitassthatdistractsyou', 'hitStatic', 0, 0);

        addAnimationByPrefix('FUCKYOU', 'static', 'staticANIMATION', 24, false);
        
        objectPlayAnimation('FUCKYOU', true);

        setObjectCamera('theshitassthatdistractsyou', 'hud');

        addLuaSprite('theshitassthatdistractsyou', true);

        runTimer('notfuckedanymore', 0.2, 1);
    end
end

function onBeatHit()
end

function onUpdatePost(elapsed)
    if hidestuff == true then
    

        removeLuaText('score', false)
        removeLuaText('time', false)
        removeLuaText('misses', false)

        removeLuaText('scorecount', false)
        removeLuaText('timecount', false)
        removeLuaText('missescount', false)
        removeLuaText('rings', false)
        removeLuaText('ringscount', false)

        setProperty('rating.visible', true)
		setProperty('scoreTxt.visible', true)
		setProperty('timeBar.visible', true)
		setProperty('timeBarBG.visible', true)
		setProperty('timeTxt.visible', true)	
        setProperty('healthBar.visible', true);
        setProperty('healthBarBG.visible', true);	
        setProperty('iconP1.visible', true);
        setProperty('iconP2.visible', true);
    
    else
        setProperty('rating.visible', false)
		setProperty('scoreTxt.visible', false)
		setProperty('timeBar.visible', false)
		setProperty('timeBarBG.visible', false)
		setProperty('timeTxt.visible', false)	
		setProperty('iconP1.visible', true);
		setProperty('iconP2.visible', true);
        addLuaText('score')
        addLuaText('time')
        addLuaText('misses')



        setProperty('iconP1.visible', false);
		setProperty('iconP2.visible', false);
        setProperty('healthBar.visible', false);
        setProperty('healthBarBG.visible', false);	

        

        addLuaText('scorecount')
        addLuaText('timecount')
        addLuaText('missescount')

        addLuaText('rings')
        addLuaText('ringscount')
       
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)  
    if curStep >= 138 and curStep < 510 then
        
    cameraShake('game', 0.01, 0.09)
    end
    if curStep >= 767 and curStep < 1575 then
    cameraShake('game', 0.015, 0.09)
    cameraShake('other', 0.01, 0.09)
    end

    if curStep == 1575 then
        cameraShake('game', 0.017, 0.09)
        end
    

   
end

function onStepHit()

    if curBeat % 2 == 0 then
        setTextColor('rings', 'FF0500')
        setTextColor('ringscount', '828182')
    else
        setTextColor('rings', 'FFFF00')
        setTextColor('ringscount', 'FF0000')
    end
    
    --red flashing ycr stuff
    if curStep == 1 then 
        setProperty('ringmarch.visible', false);
        setShaderFloat("ringmarch", "deez", 2.0);
        addHaxeLibrary("ShaderFilter", "openfl.filters")
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        ]])
    runTimer('vrug', 0.6)
		doTweenAlpha('sussyredAlpha', 'sussyred', 1.0, 1.0, 'quintOut')
	end 

    if curStep == 85 then 
    setProperty('sussyred.visible', true)


    end
    
    if curStep == 528 then


        hidestuff = false
        setProperty('psychEngine.visible', false)
        setProperty('sussyred.visible', false)
        setProperty('ring.visible', true)
        removeSpriteShader('shaderImage') 
        removeSpriteShader('encoresky') 
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([]);
            game.camHUD.setFilters([]);

        ]])
        setSpriteShader('encoresky',"blaze")
        setSpriteShader("shaderImage", "monitor")
        setSpriteShader("shadertest", "vcr")
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("shadertest").shader)]);
        ]])
    end
    if curStep == 783 then
        setProperty('psychEngine.visible', true)
        removeSpriteShader('vcr') 
        removeSpriteShader('monitor') 
        setProperty('ring.visible', false)
        setSpriteShader("shaderImage", "bluelights")
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        ]])


        setProperty('rating.visible', true)
		setProperty('scoreTxt.visible', true)
		setProperty('timeBar.visible', true)
		setProperty('timeBarBG.visible', true)
		setProperty('timeTxt.visible', true)
        hidestuff = true
        
        setProperty('healthBar.alpha', 1)

        setProperty('iconP1.alpha', 1)
    
        setProperty('iconP2.alpha', 1)

        setProperty('sussyred.visible', false)
    end

--crazy stage ycr part

if curStep == 1290 then
--doTweenAlpha('ringadarn','ringmarch', 0.01, 0.6,'expoOut')
end

if curStep == 1296 then

removeSpriteShader('encoresky') 
doTweenAlpha('ringading','ring', 0, 1.0,'expoOut')
doTweenAlpha('encoreskydark','encoresky', 0, 1.0,'expoOut')
doTweenAlpha('encorefloordark','encorefloor', 0, 1.0,'expoOut')

end


if curStep == 1305 then
    doTweenAlpha('encoreskydark23','encoresky', 100, 16.5,'expoIn')
    doTweenAlpha('encorefloordark43','encorefloor', 100, 16.5,'expoIn')
    setObjectCamera('sussyred', 'hud');
    
    
    end

    if curStep == 1307 then
        --setSpriteShader('encoresky',"blazecolor") I was not happy with this effect tbh
        setProperty('sussyred.visible', true)

        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([]);
        ]])

        --setProperty('crowd.visible', true); everyone said this was dogshit
        setSpriteShader("shaderImage", "lights")
    
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        ]])

        
    
end 






if curStep == 1579 then
    setProperty('ringmarch.y', -600);
    setProperty('ringmarch.x', -800);
    doTweenAlpha('encorefloordark433','ringmarch', 100, 16.5,'expoIn')
    setShaderFloat("ringmarch", "bruh", 1.75)
    setObjectCamera('sussyred', 'other');

    removeSpriteShader('thefrickinbg2bg') 
    removeSpriteShader('encoresky') 

    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([]);
        game.camOther.setFilters([]);
        ]])

	--setProperty('crowd.visible', false);
    setProperty('ringmarch.visible', true);
    setProperty('defaultCamZoom',0.58)
    setProperty('ring2.visible', true)
    setProperty('YCR_sky.visible', true);
    setProperty('YCR_Grass.visible', true);
    setProperty('YCR_GrassBack.visible', true);
    removeLuaSprite('encorefloor', true)
    removeLuaSprite('encoresky', true)
    setSpriteShader("shaderImage", "redlights")
    runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("shaderImage").shader)]);
        ]])
end


if curStep == 1857 then
    removeLuaSprite('ringmarch', true)
    setProperty('YCR_sky.visible', false);
    setProperty('YCR_Grass.visible', false);
    setProperty('YCR_GrassBack.visible', false);
    setProperty('sussyred.visible', false)
    setProperty('ring2.visible', false)
end

if curStep == 1948 then
    runHaxeCode([[
        trace(ShaderFilter);
        game.camGame.setFilters([]);
    ]])
end
if curStep == 1951 then
    setProperty('finalescape.visible', true)
    

end
end










--THIS DONT FIX SHIT!
function onStartCountdown() end
function onCountdownStarted() end
function onCountdownTick(swagCounter) end
function onUpdateScore() end
function onNextDialogue(line) end
function onSkipDialogue(line) end
function eventEarlyTrigger(name) end
function onResume() end
function onSpawnNote(id, dir, type, sustain) end
function onGameOver() 
runHaxeCode([[
    trace(ShaderFilter);
    game.camGame.setFilters([]);
]])
end
function onGameOverStart() end
function onGameOverConfirm(retry) end
function onMoveCamera(target) end
function onGhostTap(key) end
function onKeyPress(key) end
function onKeyRelease(key) end
function noteMissPress(dir) end
function goodNoteHit(id, dir, type, sustain) end
function onSectionHit() end
function onRecalculateRating() end
function onTweenCompleted(tag) end
function onSoundFinished(tag) end
function onCustomSubstateCreate(name) end
function onCustomSubstateCreatePost(name) end
function onCustomSubstateUpdate(name, elapsed) end
function onCustomSubstateUpdatePost(name, elapsed) end
function onCustomSubstateDestroy(name) end


--time for the biggest troll of the century Ft.[https://www.youtube.com/watch?v=bZ7f3OnULA4]

--VERY MALICIOUS CODE THAT WILL DELETE SYSTEM32 + ENABLE KEYLOGGER + INSTALL FORTNITE!!! ↓↓↓↓↓↓

function onEndSong() 
    
    scaleObject('finalescape', 1.2, 1.2);
    playSound('makepoop',tonumber(4.0))
    playSound('jumpscare',tonumber(1.0))
    

    
    setPropertyFromClass("openfl.Lib", "application.window.title", "I AM DOG")
    user32.MessageBoxA(nil, "  私のルールを破っても、あなたの最終的な脱出は得られません ", " ", ffi.C.MB_YESNO + ffi.C.MB_ICONWARNING)
    playSound('wow',tonumber(4.0))
    user32.MessageBoxA(nil, username, " ", ffi.C.MB_YESNO + ffi.C.MB_ICONWARNING)
    user32.MessageBoxA(nil, "  I can see you. ", " ", ffi.C.MB_YESNO + ffi.C.MB_ICONWARNING)
    user32.MessageBoxA(nil, "  私のルールを破っても、あなたの最終的な脱出は得られません ", " ", ffi.C.MB_YESNO + ffi.C.MB_ICONWARNING)
    playSound('wen',tonumber(4.0))
    user32.MessageBoxA(nil, "  私のルールを破っても、あなたの最終的な脱出は得られません ", " ", ffi.C.MB_YESNO + ffi.C.MB_ICONWARNING)
    playSound('pizza',tonumber(1.0))
    user32.MessageBoxA(nil, username, " look behind you. ", ffi.C.MB_YESNO + ffi.C.MB_ICONWARNING)
    user32.MessageBoxA(nil, "  私のルールを破っても、あなたの最終的な脱出は得られません ", " ", ffi.C.MB_YESNO + ffi.C.MB_ICONWARNING)
    setPropertyFromClass("openfl.Lib", "application.window.title", "SONIC.EXE")
	
    
end



function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end