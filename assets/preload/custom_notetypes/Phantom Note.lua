local healthDrop = 0;
local FUCKYOU = 0;

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Phantom Note' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PhantomNote');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);

				if getPropertyFromGroup('unspawnNotes',i,'texture') == 'PhantomNote' then
					setPropertyFromGroup('unspawnNotes',i,'multAlpha',0.5)
					end
			end
		end
	end
end

function onCreatePost()
end

function onUpdate()
    setProperty('health', getProperty('health') - healthDrop); 
end

function onUpdatePost()
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Phantom Note' then
		healthDrop = healthDrop + 0.00025;
		if healthDrop == 0.00025 then
			runTimer('BITCHLMAO', 0.1 , 1);
		else 
			FUCKYOU = 0;
		end
    end
end


function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'BITCHLMAO' then
		FUCKYOU = FUCKYOU + 1;
		if FUCKYOU >= 100 then
			healthDrop = 0;
		end
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Phantom Note' then
		characterPlayAnim('dad', 'idle', true);
		setProperty('dad.specialAnim', true);
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
function onUpdate(elapsed) end
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