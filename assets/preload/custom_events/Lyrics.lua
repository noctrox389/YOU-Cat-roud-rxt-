function onEvent(name, value1, value2)
    local var string = (value1)
    local var color = (value2)
    if name == "Lyrics" then

        makeLuaText('captions', 'Lyrics go here', 1000, 150, 620)
        setProperty('captions.antialiasing', true)
        setTextString('captions',  '' .. string)
        setTextFont('captions', 'redo.ttf')
        setTextColor('FF0004', FF0004)
        setTextSize('captions', 35);
        addLuaText('captions')
	setObjectCamera('captions', 'other');
        setTextAlignment('captions', 'center')
        --removeLuaText('captions', true)
        
    end
end

