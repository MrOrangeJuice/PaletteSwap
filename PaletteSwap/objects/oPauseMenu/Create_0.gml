/// @description Instantiating Buttons and other Text Variables

resume = instance_create_layer(0, 0, "Player", resumeBut);
exitGame = instance_create_layer(0, 50, "Player", exitGameBut);
options = instance_create_layer(0, 100, "Player", optionsButton);

// Switch which UI object is active based-on what state the game is in.
if (global.paused == true)
{
	resume.visible = true;
	exitGame.visible = true;
	options.visible = true;
}
else 
{
	resume.visible = false;
	exitGame.visible = false;
	options.visible = false;
}