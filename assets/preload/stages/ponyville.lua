function onCreate()
	-- background shit
	makeLuaSprite('ponyville', 'ponyville', 0, -275);
	setLuaSpriteScrollFactor('ponyville', 0.9, 0.9);
	
	makeAnimatedLuaSprite('lyrabon', 'lyrabon', 750, 150);
	setLuaSpriteScrollFactor('lyrabon', 0.9, 0.9);
	
	makeAnimatedLuaSprite('derp', 'derp', 1250, 175);
	setLuaSpriteScrollFactor('derp', 0.9, 0.9);
	
	addLuaSprite('ponyville', false);
	addLuaSprite('derp', false);
	addLuaSprite('lyrabon', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end