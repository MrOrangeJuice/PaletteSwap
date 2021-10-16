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
		}