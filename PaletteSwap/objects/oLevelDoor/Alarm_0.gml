/// @description Switch level
// You can write your code in this editor
switch(levelTo)
		{
			case "MainMenu":
				audio_stop_sound(msc_Level);
				SlideTransition(TRANS_MODE.GOTO, MainMenu);	
				break;
			case "rThanks":
				SlideTransition(TRANS_MODE.GOTO, rThanks);
				break;
			case "rPaletteTemple":
				SlideTransition(TRANS_MODE.GOTO, rPaletteTemple);	
				break;
			case "rAlexLevel":
				audio_stop_sound(msc_Level);
				SlideTransition(TRANS_MODE.GOTO, rAlexLevel);	
				break;
			case "rSecret":
				audio_stop_sound(msc_Hub);
				SlideTransition(TRANS_MODE.GOTO, rSecret);
				break;
			case "rCredits":
				audio_stop_sound(msc_Hub);
				SlideTransition(TRANS_MODE.GOTO, rCredits);
				break;
			case "rFactory":
				audio_stop_sound(msc_Hub);
				SlideTransition(TRANS_MODE.GOTO, rFactory);
				break;
			case "rHub":
				SlideTransition(TRANS_MODE.GOTO, rHub);
				break;
			case "rNewHub":
				SlideTransition(TRANS_MODE.GOTO, rNewHub);	
				break;
			case "rMomentumMotel":
				SlideTransition(TRANS_MODE.GOTO, rMomentumMotel);
				break;
			case "rSpeedrun3":
				audio_stop_sound(msc_Hub);
				SlideTransition(TRANS_MODE.GOTO, rSpeedrun3);
				break;
			case "rSpeedrun4":
				audio_stop_sound(msc_Hub);
				SlideTransition(TRANS_MODE.GOTO, rSpeedrun4);
				break;
			case "rSpeedrun5":
				audio_stop_sound(msc_Hub);
				SlideTransition(TRANS_MODE.GOTO, rSpeedrun5);
				break;
			case "rShack":
				SlideTransition(TRANS_MODE.GOTO, rShack);
				break;
		}