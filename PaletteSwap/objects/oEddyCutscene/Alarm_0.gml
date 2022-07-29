/// @description create end cutscene
// You can write your code in this editor
endCutscene = instance_create_layer(oPlayer.x,oPlayer.y,"FX",oEddyCutsceneEnd);
endCutscene.visible = false;
instance_destroy();
