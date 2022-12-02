function onEvent(n,v1,v2)
	if n == "character disappear slash appear" then
		if v1 == 'dad' then
			setProperty('dad.visible',v2)
		elseif v1 == 'bf' then
			setProperty('boyfriend.visible',v2)	
		elseif v1 == 'gf' then
			setProperty('gf.visible',v2)	
		end
	end
end