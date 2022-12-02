local maxMovePx = {3, 3}            -- max x and y movement values
local maxAngleMovePx = 3            -- max angle movement values

-- ICONS
local maxMovePxIcons = {3, 3}            -- max x and y movement values
local maxAngleMovePxIcons = 3            -- max angle movement values
local maxScaleMovePxIcons = {0.2, 0.2}   -- max scale movement values

--GENERAL
local shakeXY = true            -- shake in the X and Y axis?
local shakePlayer = true        -- shake the player's notes/icon
local shakeEnemy = true         -- shake the enemy's notes/icon
local shakeIcons = true         -- shake the icons
local updateEvery = 0.0001      -- time the shake takes to occur (in milliseconds)

--DO NOT MODIFY
local updateTime = 0
local iconXValues = {0, 0}
local defaultIconY = 0
local defaultNotePos = {};


function onCreate()
end

function onCreatePost()
end

function onSongStart()
    for i = 0,7 do 
        
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        direc = getPropertyFromGroup('strumLineNotes', i, 'direction')
 
        table.insert(defaultNotePos, {x,y,direc})
    end
end

function onUpdatePost(e)

    setProperty('thing.y',getProperty('scoreTxt.y'))
	noteCount = getProperty('notes.length');

	for i = 0, noteCount-1 do

		noteData = getPropertyFromGroup('notes', i, 'noteData')
		if getPropertyFromGroup('notes', i, 'isSustainNote') then
            if (getPropertyFromGroup('notes', i, 'mustPress')) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("playerStrums", noteData, 'direction') - 90)
            else
				
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("opponentStrums", noteData, 'direction') - 90)
            end	
		else
            if (noteData >= 4) then
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("playerStrums", noteData, 'angle'))
            else
                setPropertyFromGroup('notes', i, 'angle', getPropertyFromGroup("opponentStrums", noteData, 'angle'))
            end	
		end
	end

    if curStep >= 1305 and curStep < 1579 then
    defaultIconY = getProperty('healthBar.y') - 75
    local iconOffset = 26
    
    iconXValues[1] = getProperty('healthBar.x') + (getProperty('healthBar.width') * (remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01)) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - iconOffset -- enemy position
    iconXValues[2] = getProperty('healthBar.x') + (getProperty('healthBar.width') * (remapToRange(getProperty('healthBar.percent'), 0, 100, 100, 0) * 0.01)) - (150 * getProperty('iconP2.scale.x')) / 2 - (iconOffset * 2) -- player position

    updateTime = updateTime + e

    if updateTime > updateEvery then
        updateTime = 0
        for i=0, 3 do
            if shakeEnemy then
                shakeStrum(i, false)
            end
            if shakePlayer then
                shakeStrum(i, true)
            end
        end
        if shakeIcons then
            if shakeEnemy then
                shakeIcon(false)
            end
            if shakePlayer then
                shakeIcon(false)
            end
        end
    end
end
end

function onUpdate()

   
    if curStep >= 81 and curStep < 528 then
    songPos = getPropertyFromClass('Conductor', 'songPosition');
    gurg = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/60))
    currentBeat = (songPos / 1000) * (bpm / 70)
    currentBeat2 = (songPos / 1000) * (bpm / 120)
    if blas == true then
    setProperty('camHUD.y', -10 + 20 * math.sin((gurg *0.2) * math.pi), 0.2)
    setProperty('camHUD.x', -13 + 23 * math.sin((gurg *0.25) * math.pi), 0.5)
    end

for i = 0,7 do
    setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] - 10 * math.cos((currentBeat + i*0.25) * math.pi))
    setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] - 20 * math.cos((currentBeat + i*0.05) * math.pi))
setPropertyFromGroup('strumLineNotes', i, 'direction', defaultNotePos[i + 1][3] - 6 * math.cos((currentBeat2 + i*0.01) * math.pi))
end
end
if curStep >= 787 and curStep < 1304 then

    songPos = getPropertyFromClass('Conductor', 'songPosition');
    gurg = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/60))
    currentBeat = (songPos / 1000) * (bpm / 70)
    currentBeat2 = (songPos / 1000) * (bpm / 120)
    if blas == true then
    setProperty('camHUD.y', -10 + 20 * math.sin((gurg *0.2) * math.pi), 0.2)
    setProperty('camHUD.x', -13 + 23 * math.sin((gurg *0.25) * math.pi), 0.5)
    end

for i = 0,7 do
    setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] - 10 * math.cos((currentBeat + i*0.25) * math.pi))
    setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] - 20 * math.cos((currentBeat + i*0.05) * math.pi))
setPropertyFromGroup('strumLineNotes', i, 'direction', defaultNotePos[i + 1][3] - 6 * math.cos((currentBeat2 + i*0.01) * math.pi))
end
end




if curStep == 528 then
    resetStrums(true)
    noteTweenX('dadTween1', 0, -1000, 0.03, 'linear')
	noteTweenX('dadTween2', 1, -1000, 0.03, 'linear')
	noteTweenX('dadTween3', 2, -1000, 0.03, 'linear')
	noteTweenX('dadTween4', 3, -1000, 0.03, 'linear')

    noteTweenX('bfTween1', 4, 90, 0.04, 'linear')
    noteTweenX('bfTween2', 5, 205, 0.04, 'linear')
    noteTweenX('bfTween3', 6, 315, 0.04, 'linear')
    noteTweenX('bfTween4', 7, 425, 0.04, 'linear')
end

if curStep == 787 then


noteTweenX('bfTween12', 4, 730, 0.05, 'linear')
	noteTweenX('bfTween22', 5, 845, 0.05, 'linear')
	noteTweenX('bfTween32', 6, 955, 0.05, 'linear')
	noteTweenX('bfTween42', 7, 1065, 0.05, 'linear')

noteTweenX('dadTween12', 0, 90, 0.05, 'linear')
noteTweenX('dadTween22', 1, 205, 0.05, 'linear')
noteTweenX('dadTween32', 2, 315, 0.05, 'linear')
noteTweenX('dadTween42', 3, 425, 0.05, 'linear')
end


if curStep == 1304 then
    resetStrums(true)
    


end
end

function resetStrums()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
        setPropertyFromGroup('strumLineNotes', i, 'direction', defaultNotePos[i + 1][3])
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
    end
end 


function bumpArrowsY(time, amount, smallamount)
    for i = 0,7 do
        shit = 0;
        if i % 4 == 0 then
            shit = -amount
        end
        if i % 4 == 1 then
            shit = -smallamount
        end
        if i % 4 == 2 then
            shit = smallamount
        end
        if i % 4 == 3 then
            shit = amount
        end
        setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + shit)
        noteTweenY("movementYbump " .. i, i, getPropertyFromGroup('strumLineNotes', i, 'y') - shit, time, "linear")
    end
end

function bumpArrowsX(time, amount, smallamount)
    for i = 0,7 do
        shit = 0;
        if i % 4 == 0 then
            shit = -amount
        end
        if i % 4 == 1 then
            shit = -smallamount
        end
        if i % 4 == 2 then
            shit = smallamount
        end
        if i % 4 == 3 then
            shit = amount
        end
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + shit)
        noteTweenX("movementXbump " .. i, i, getPropertyFromGroup('strumLineNotes', i, 'x') - shit, time, "linear")
    end
end

function fadeStrums(alpha,time,movebf,movedad)
    if time <= 0 then
        if movebf == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
        end
        if movedad == true then
            for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
        end
    else
        if movebf == true then
            for i = 4,7 do 
                noteTweenAlpha("movementAlpha " .. i, i, alpha, time, "linear")
            end
        end
        if movedad == true then
            for i = 0,3 do 
                noteTweenAlpha("movementAlpha " .. i, i, alpha, time, "linear")
            end
        end
    end
end

function shakeStrum(strum, player)
    local ogV = {_G['defaultOpponentStrumX'..strum], _G['defaultOpponentStrumY'..strum]}
    if player then
        ogV = {_G['defaultPlayerStrumX'..strum], _G['defaultPlayerStrumY'..strum]}
    end
    local group = 'opponentStrums'
    if player then
        group = 'playerStrums'
    end

    setPropertyFromGroup(group, strum, 'x', ogV[1] + getRandomInt(-maxMovePx[1], maxMovePx[1]))
    setPropertyFromGroup(group, strum, 'y', ogV[2] + getRandomInt(-maxMovePx[2], maxMovePx[2]))
    setPropertyFromGroup(group, strum, 'angle', 1 + getRandomInt(-maxAngleMovePx, maxAngleMovePx))
end

function shakeIcon(player)
    local icon = 2
    if player then icon = 1 end

    setProperty('iconP'..icon..'.x', iconXValues[icon] + getRandomInt(-maxMovePxIcons[1], maxMovePxIcons[1]))
    setProperty('iconP'..icon..'.y', defaultIconY + getRandomInt(-maxMovePxIcons[2], maxMovePxIcons[2]))
    setProperty('iconP'..icon..'.angle', 0 + getRandomInt(-maxAngleMovePxIcons, maxAngleMovePxIcons))
    setProperty('iconP'..icon..'.scale.x', 1 + getRandomFloat(-maxScaleMovePxIcons[1], maxScaleMovePxIcons[1]))
    setProperty('iconP'..icon..'.scale.y', 1 + getRandomFloat(-maxScaleMovePxIcons[2], maxScaleMovePxIcons[2]))
end

function remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

function onBeatHit()
end
function onStepHit()
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































 