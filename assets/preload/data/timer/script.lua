local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false

function onStartCountdown()

	makeAnimatedLuaSprite('rd1', 'rd1', 315, 152);
	setLuaSpriteScrollFactor('rd1', 0.9, 0.9);
	addLuaSprite('rd1', false);

	makeAnimatedLuaSprite('aj', 'aj', 215, 137);
	setLuaSpriteScrollFactor('aj', 0.9, 0.9);
	addLuaSprite('aj', false);

	makeAnimatedLuaSprite('pp', 'pp', 0, 175);
	setLuaSpriteScrollFactor('pp', 0.9, 0.9);
	addLuaSprite('pp', false);

	if not allowCountdown and isStoryMode and not startedFirstDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		startedFirstDialogue = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
	if not allowCountdown and isStoryMode and not startedEndDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogueEnd', 0.8);
		startedEndDialogue = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue', 'silence');
	elseif tag == 'startDialogueEnd' then
		startDialogue('dialogueEnd', 'silence');
		
		makeAnimatedLuaSprite('lyrabon', 'lyrabon', 750, 150);
		setLuaSpriteScrollFactor('lyrabon', 0.9, 0.9);
		addLuaSprite('lyrabon', false);
		
		makeAnimatedLuaSprite('derp', 'derp', 1250, 150);
		setLuaSpriteScrollFactor('derp', 0.9, 0.9);
		addLuaSprite('derp', false);
		
		makeAnimatedLuaSprite('rd1', 'rd1', 315, 152);
		setLuaSpriteScrollFactor('rd1', 0.9, 0.9);
		addLuaSprite('rd1', false);
		
		makeAnimatedLuaSprite('aj', 'aj', 215, 137);
		setLuaSpriteScrollFactor('aj', 0.9, 0.9);
		addLuaSprite('aj', false);
		
		makeAnimatedLuaSprite('pp', 'pp', 0, 175);
		setLuaSpriteScrollFactor('pp', 0.9, 0.9);
		addLuaSprite('pp', false);
		
	end
end

function onSongStart()
	luaSpriteAddAnimationByPrefix('lyrabon', 'lyrabon', 'lyrabon', 24, true);
	luaSpriteAddAnimationByPrefix('derp', 'derp', 'derp', 24, true);
	luaSpriteAddAnimationByPrefix('rd1', 'rd1', 'rd1', 24, true);
	luaSpriteAddAnimationByPrefix('aj', 'aj', 'aj', 24, true);
	luaSpriteAddAnimationByPrefix('pp', 'pp', 'pp', 24, true);
end

function opponentNoteHit()
	health = getProperty('health')
	if getProperty('health') > 0.05 then
		setProperty('health', health - 0.045);
	end
end