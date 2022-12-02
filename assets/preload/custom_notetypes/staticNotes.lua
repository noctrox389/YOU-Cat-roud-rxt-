function onCreate()
    	makeAnimatedLuaSprite('missStatic', 'hitStatic', -20, 0)
    	addAnimationByPrefix('missStatic', 'missed', 'staticANIMATION', 24, false)
    	setGraphicSize('missStatic', 1366, 768) --getProperty('missStatic.width') * 4
    	setProperty('missStatic.alpha', 0.7)
    	setProperty('missStatic.visible', false)
    	addLuaSprite('missStatic', true)
    	setObjectCamera('missStatic', 'other')

	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'staticNotes' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'staticNotes');
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes',i,'texture') == 'staticNotes' then
				setPropertyFromGroup('unspawnNotes',i,'multAlpha',0.8)
				end
		end
	end
end

function onCreatePost()
end



function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'staticNotes' then
        	playSound('hitStatic1')
		objectPlayAnimation('missStatic', 'missed', true)
	end
end

function onStepHit()
	if curStep == 1 then
    		setProperty('missStatic.visible', true)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'staticNotes' then
		characterPlayAnim('dad', 'laugh', true);
		setProperty('dad.specialAnim', true);
	end
end

function onUpdatePost(elapsed)
end

function onUpdate(elapsed)
    if getProperty('missStatic.animation.curAnim.finished') and getProperty('missStatic.animation.curAnim.name') == 'missed' then
        setProperty('missStatic.alpha', 0)
    else
        setProperty('missStatic.alpha', 0.9)
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