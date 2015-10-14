void BackgroundMenu()
{
  background(color(200,200,200));
  image(title, SCREEN_WIDTH/2-title.width/2, 0);
  noStroke();
  fill(noir);
  rect(SCREEN_WIDTH/2-title.width/2+10, title.height+10, title.width, (SCREEN_HEIGHT-title.height)/2-20);
  fill(darkred);
  rect(SCREEN_WIDTH/2-title.width/2, title.height, title.width, (SCREEN_HEIGHT-title.height)/2-20);
  fill(gris);
  rect(SCREEN_WIDTH/2-title.width/2, title.height, title.width, ((SCREEN_HEIGHT-title.height)/2-20)/6);
  fill(noir);
  textSize(((SCREEN_HEIGHT-title.height)/2-20)/16);
  text("NOUVELLE PARTIE", (SCREEN_WIDTH/2-title.width/2)*1.1, title.height+((SCREEN_HEIGHT-title.height)/2-20)/12);
  rect(SCREEN_WIDTH/2-title.width/2+10, SCREEN_HEIGHT-((SCREEN_HEIGHT-title.height)/2-20+20)+10, title.width, (SCREEN_HEIGHT-title.height)/2-20);
  fill(darkred);
  rect(SCREEN_WIDTH/2-title.width/2, SCREEN_HEIGHT-((SCREEN_HEIGHT-title.height)/2-20+20), title.width, (SCREEN_HEIGHT-title.height)/2-20);
  fill(gris);
  rect(SCREEN_WIDTH/2-title.width/2, SCREEN_HEIGHT-((SCREEN_HEIGHT-title.height)/2-20+20), title.width, ((SCREEN_HEIGHT-title.height)/2-20)/6);
  fill(noir);
  text("HIGH SCORES", (SCREEN_WIDTH/2-title.width/2)*1.1, (SCREEN_HEIGHT-((SCREEN_HEIGHT-title.height)/2-20+20)+((SCREEN_HEIGHT-title.height)/2-20)/12));
}

void CreationPlayers()
{
  for(int i = 1 ; i <= NB_JOUEURS_MAX ; i++)
  {
    if(ctrl.getValue("activateJ"+i) == 1.0)            // Bouton Toggle activé
    {
      joueurs.add(i, new Player(i, cmd_tab[i]));       // i est l'indice et l'ID du joueur
    }
  }
}