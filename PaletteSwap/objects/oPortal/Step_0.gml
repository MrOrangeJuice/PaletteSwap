/// @description Swap Palette
if (visible){
switch (sprite_index) {
	case sPortalEffectSpawn:
		PaletteAnimationSwapSingle();
		break;
	default:
		PaletteAnimationSwap();
		break;
}
}
