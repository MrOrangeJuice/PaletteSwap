/// @description Instantiating Buttons and other Text Variables

resume = 0;
exitGame = 0;
options = 0;

resume = instance_create_layer(225, 60, "Player", resumeButton);
options = instance_create_layer(125, 70, "Player", optionsButton);
exitGame = instance_create_layer(125, 105, "Player", quitButton);