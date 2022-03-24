local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false

function onStartCountdown()

	makeAnimatedLuaSprite('ts1', 'ts1', 0, 175);
	setLuaSpriteScrollFactor('ts1', 0.9, 0.9);
	addLuaSprite('ts1', false);

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
		
		makeAnimatedLuaSprite('ts1', 'ts1', 0, 175);
		setLuaSpriteScrollFactor('ts1', 0.9, 0.9);
		addLuaSprite('ts1', false);
		
	end
end

function onSongStart()
	luaSpriteAddAnimationByPrefix('lyrabon', 'lyrabon', 'lyrabon', 24, true);
	luaSpriteAddAnimationByPrefix('derp', 'derp', 'derp', 24, true);
	luaSpriteAddAnimationByPrefix('ts1', 'ts1', 'ts1', 24, true);
end

function opponentNoteHit()
	health = getProperty('health')
	if getProperty('health') > 0.05 then
		setProperty('health', health - 0.015);
	end
end