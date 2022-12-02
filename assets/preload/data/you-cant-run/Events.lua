--Recreation Made by JogadorIce--
--Please Dont Forgot about my Credits for making this script for you--

-- OG Inspiration of This Script is of: --
-- Friday Night Funkin' VS Sonic.exe 2.5/3.0 Cancelled Build --
-- That Have a Credits Box on Start of Song --

-- Will Have some "-- Text --" On Script to Help You for Change --

-- For this Script Work, you need put that Credits.lua File on Data / Your Song --
-- (Dont change Name Of File!) --

-- Thank you For Read This, Enjoy! :) --

function onCreate()

    -- Main Work Tags --

	makeLuaSprite('Main', 'CREDITTEXT', 350, -1300)
	makeGraphic('Main', 570, 1300, '0B0A0A')
	setObjectCamera('Main', 'other')
	setProperty('Main.alpha', 0.9)
	addLuaSprite('Main', true)
	
	makeLuaSprite('BorderLeft', 'OUTLINE', 350, -1300)
	makeGraphic('BorderLeft', 7, 1300, '700D11')
	setObjectCamera('BorderLeft', 'other')
	setProperty('BorderLeft.alpha', 0.8)
	addLuaSprite('BorderLeft', true)
	
	makeLuaSprite('BorderRight', 'OUTLINE', 920, -1300)
	makeGraphic('BorderRight', 7, 1300, '700D11')
	setObjectCamera('BorderRight', 'other')
	setProperty('BorderRight.alpha', 0.8)
	addLuaSprite('BorderRight', true)

	makeLuaText('CREDITS', 'CREDITS', 1000, 132, -1000) -- Title Credits Box (Dont need Change) --
	setTextAlignment('CREDITS', 'center')
	setTextSize('CREDITS', 50)
	setTextColor('CREDITS','FF000A')
	setObjectCamera('CREDITS', 'other')
	addLuaText('CREDITS')

	makeLuaText('MUSICIANS', 'MUSICIANS', 1000, 132, -1000) -- Composer Tag --
	setTextAlignment('MUSICIANS', 'center')
	setTextSize('MUSICIANS', 35)
	setTextColor('MUSICIANS','FF000A')
	setObjectCamera('MUSICIANS', 'other')
	addLuaText('MUSICIANS')
	
	makeLuaText('CODERS', 'Special Thanks', 1000, 132, -1000) -- Coder Tag --
	setTextAlignment('CODERS', 'center')
	setTextSize('CODERS', 35)
	setTextColor('CODERS','FF000A')
	setObjectCamera('CODERS', 'other')
	addLuaText('CODERS')

	makeLuaText('ARTISTS', 'ARTISTS', 1000, 132, -1000) -- Artist Tag --
	setTextAlignment('ARTISTS', 'center')
	setTextSize('ARTISTS', 35)
	setTextColor('ARTISTS','FF000A')
	setObjectCamera('ARTISTS', 'other')
	addLuaText('ARTISTS')
	
	makeLuaText('ARTISTS2', 'ARTISTS', 1000, 132, -1000) -- Charter Tag --
	setTextAlignment('ARTISTS2', 'center')
	setTextSize('ARTISTS2', 35)
	setTextColor('ARTISTS2','FF000A')
	setObjectCamera('ARTISTS2', 'other')
	addLuaText('ARTISTS2')

	makeLuaText('thanks', 'THANK YOU ALL FOR 90k SUBS!!! - TIX', 1000, 132, -1000) -- Charter Tag --
	setTextAlignment('thanks', 'center')
	setTextSize('thanks', 26)
	setTextColor('thanks','FF000A')
	setObjectCamera('thanks', 'other')
	addLuaText('thanks')

	makeLuaText('turtle', 'CHARTER', 1000, 132, -1000)
	setTextSize('turtle', 35)
	setTextColor('turtle','FF000A')
	setObjectCamera('turtle', 'other')
	addLuaText('turtle')





	-- Insert Name of People that Working on Your Mode Here --

	makeLuaText('MUSICIAN1', 'Saster, Marstarbro, SimplyCrispy, KGBepis', 1000, 132, -1000) --Team Member Helping Name Here--
	setTextAlignment('MUSICIAN1', 'center')
	setTextSize('MUSICIAN1', 22)
	setObjectCamera('MUSICIAN1', 'other')
	addLuaText('MUSICIAN1') 

	makeLuaText('CODER1', 'Sonic Style, ZdzichuOfficial', 1000, 132, -1000) --Team Member Helping Name Here--
	setTextAlignment('CODER1', 'center')
	setTextSize('CODER1', 17)
	setObjectCamera('CODER1', 'other')
	addLuaText('CODER1')
	
	makeLuaText('ARTIST1', 'Dasher123, Comgaming_nz, Biagotmilkandjelly, Ghostbun', 1000, 132, -1000) --Team Member Helping Name Here--
	setTextAlignment('ARTIST1', 'center')
	setTextSize('ARTIST1', 17)
	setObjectCamera('ARTIST1', 'other')
	addLuaText('ARTIST1')


	makeLuaText('turtle1', 'therealturtle0216', 1000, 132, -1000) --Team Member Helping Name Here--
	setTextAlignment('turtle1', 'center')
	setTextSize('turtle1', 17)
	setObjectCamera('turtle1', 'other')
	addLuaText('turtle1')


	makeLuaSprite('credity', 'psych', 1950, 600)
	scaleObject('credity', 0.28, 0.28);
	setObjectCamera('credity', 'other')
	addLuaSprite('credity', false);




	setSpriteShader("BorderLeft", "suslmao")
	
	setSpriteShader("credity", "suslmao")
	setSpriteShader("BorderRight", "suslmao")
	setSpriteShader("thanks", "suslmao")
	setSpriteShader("turtle", "suslmao")

	setSpriteShader("CREDITS", "suslmao")
	setSpriteShader("MUSICIANS", "suslmao")
	setSpriteShader("CODERS", "suslmao")
	setSpriteShader("ARTISTS", "suslmao")
	setSpriteShader("MUSICIAN1", "suslmao")
	setSpriteShader("CODER1", "suslmao")
	setSpriteShader("ARTIST1", "suslmao")


	



	

	
	
	


end

function onStepHit()
	
	-- Position of Texts and The Box and Animations --
	-- (Dont Need Change anything of This) --

	if curStep == 32 then -- Time of Credits Box Come --
	
	doTweenY('UNDERLAY1', 'Main', 0, 0.5, 'linear')
	doTweenY('UNDERLAY2', 'BorderLeft', 0, 0.5, 'linear')
	doTweenY('UNDERLAY3', 'BorderRight', 0, 0.5, 'linear')

	doTweenY('CREDSTEXT', 'CREDITS', 60, 0.3, 'linear')

	doTweenY('CODETEXT', 'CODERS', 500, 0.3, 'linear')
	doTweenY('CODER1', 'CODER1', 540, 0.3, 'linear')
	doTweenY('CODER2', 'CODER2', 210, 0.3, 'linear')
	doTweenY('CODER3', 'CODER3', 240, 0.3, 'linear')
	doTweenY('CODER4', 'CODER3', 240, 0.3, 'linear')

	doTweenY('ARTTEXT', 'ARTISTS', 280, 0.3, 'linear')
	doTweenY('ARTIST1', 'ARTIST1', 320, 0.3, 'linear')

	doTweenY('MUSICTEXT', 'MUSICIANS', 160, 0.3, 'linear')
	doTweenY('MUSICIAN1', 'MUSICIAN1', 200, 0.3, 'linear')

	doTweenY('CHARTEXT', 'turtle', 390, 0.3, 'linear')
	doTweenY('CHARTER1', 'turtle1', 430, 0.3, 'linear')



	doTweenY('thanks', 'thanks', 620, 0.3, 'linear')
	doTweenX('ssfeww', 'credity', 950, 0.3, 'linear')

	runTimer('Gone', 5, 3) -- Leaving Box --
end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'Gone' then

	
	doTweenY('UNDERLAY1EXIT', 'Main', -1300, 0.2, 'linear')
	doTweenY('UNDERLAY2EXIT', 'BorderLeft', -1300, 0.2, 'linear')
	doTweenY('UNDERLAY3EXIT', 'BorderRight', -1300, 0.2, 'linear')

	doTweenY('CREDSTEXTEXIT', 'CREDITS', -1000, 0.3, 'linear')

	doTweenY('CODETEXTEXIT', 'CODERS', -1000, 0.3, 'linear')
	doTweenY('CODER1EXIT', 'CODER1', -1000, 0.3, 'linear')
	doTweenY('CODER2EXIT', 'CODER2', -1000, 0.3, 'linear')
	doTweenY('CODER3EXIT', 'CODER3', -1000, 0.3, 'linear')

	doTweenY('ARTTEXTEXIT', 'ARTISTS', -1000, 0.3, 'linear')
	doTweenY('ARTIST1EXIT', 'ARTIST1', -1000, 0.3, 'linear')

	doTweenY('MUSICTEXTEXIT', 'MUSICIANS', -1000, 0.3, 'linear')
	doTweenY('MUSICIAN1EXIT', 'MUSICIAN1', -1000, 0.3, 'linear')
	doTweenY('MUSICIAN2EXIT', 'MUSICIAN2', -1000, 0.3, 'linear')

	doTweenY('CHARTEXTEXIT', 'turtle', -1000, 0.3, 'linear')
	doTweenY('CHARTER1EXIT', 'turtle1', -1000, 0.3, 'linear')

	doTweenY('thanks', 'thanks', -1000, 0.3, 'linear')
	doTweenX('thwfeqanks', 'credity', -1800, 0.6, 'linear')


	removeLuaSprite('BorderLeft',true)
	removeLuaSprite('BorderRight',true)
	removeLuaSprite('psych',true)

	removeLuaSprite('Main',true)
	removeLuaSprite('CREDITS',true)

end
end