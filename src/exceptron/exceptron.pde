/****************************************************************************/ //<>//
/*                                  Exception                               */
/*                                                                          */
/*          Projet ExcepTron : Création d'un snake multi-joueurs            */
/*                                                                          */
/*     exceptron.pde                                       Processing 3.0   */
/****************************************************************************/

import processing.net.*;
import controlP5.*;

// Constantes
final int SCREEN_WIDTH = 1000;
final int SCREEN_HEIGHT = 800;
final int NB_PIXELS = SCREEN_WIDTH + SCREEN_HEIGHT;
final int FRAMERATE = 30;
final int NB_JOUEURS_MAX = 6;

// Couleurs
final int rouge = color(255,0,0);  
final int vert  = color(0,255,0); 
final int bleu  = color(0,0,255);
final int noir  = color(0,0,0); 
final int blanc = color(255,255,255);
final int gris = color(111,111,111);
final int darkred = color(171, 30, 30);

// Déclarations
ArrayList<Player> joueurs;
Carte map;
KeyManager km;
PImage logo, title;
ControlP5 ctrl;

// Paramètres
int nbjoueurs;
int step, intro;

void setup() {
  nbjoueurs = 4;                    // Nombre de joueurs                      A SUPPRIMER (quand le menu sera op)
  step = 0;                         // Etape du programme
  intro = 30*4;                     // Durée de l'intro : 4sec
  
  size(1000, 800);                  
  noStroke();                       // Pas de contours
  background(blanc);                // Fond noir
  frameRate(FRAMERATE);             // 30 FPS
  smooth();                         // Anti-aliasing
  
  logo = loadImage("exception.png");
  title = loadImage("exceptron.png");
  title.resize(600,200);
  joueurs = new ArrayList();            // Création des joueurs
  km = new KeyManager();
  
  /* ajout des joueurs */
  joueurs.add(new Player(0, "qs"));
  joueurs.add(new Player(1, "df"));
  joueurs.add(new Player(2, "qs"));
  joueurs.add(new Player(3, "op"));
  
  // Définition des contrôles
  ctrl = new ControlP5(this);
  // Bouton de début de partie
  ctrl.addButton("startGame")
      .setPosition(175,275)
      .setLabel("Start the party!")
      .setVisible(false)
      .updateSize();
  
  // Boutons pour ajouter des joueurs
  for(int i = 1 ; i <= NB_JOUEURS_MAX ; ++i) {
    ctrl.addToggle("activateJ"+i)
      .setPosition(SCREEN_WIDTH/2-title.width/2+SCREEN_WIDTH/32, title.height + SCREEN_HEIGHT/24 + i * SCREEN_HEIGHT/22)
      .setLabel("Joueur " + i + " ON/OFF")
      //.setVisible(false)
      .setSize(SCREEN_WIDTH/32,SCREEN_HEIGHT/32);
  }
}

void draw() { //<>//
  // Introduction / Crédits
  if(0==step) {
    image(logo, (SCREEN_WIDTH/2)-(logo.width/2), (SCREEN_HEIGHT/2)-(logo.height/2));
    if(intro--==0) {
      step = 1;     // Passage au menu       
      ((Controller)(ctrl.get("startGame"))).setVisible(true);
    }
  }
  // Menu
  else if(1==step) {
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
  // Game
  else if(2==step) {
        Player p;                              // Variables temporaires
        
        // controle + affichage
        for(int i = 0 ; i < joueurs.size() ; i++) {
          p = joueurs.get(i);              // Raccourci d'écriture
          
          if(km.isPressed(p.getControl().charAt(0))) {  // si la touche gauche est pressee
            p.changerDirection(true);
          } else if(km.isPressed(p.getControl().charAt(1))) {  // si la touche droite est pressee
            p.changerDirection(false);
          }                                    // Fin if
          
          if(p.isAlive()) {
            p.avancer();
            p.afficher();
          }
        }
        
        // verification des collisions
        map.update(joueurs);
        
        // mise a jour des etats
        for(int i = 0 ; i < joueurs.size() ; i++) {
          if(map.getCollisions().hasValue(joueurs.get(i).id)) {
            joueurs.get(i).kill();
          }
        }
  } else if(3==step) {      // fin du jeu
    exit();
  }
}


/* A ajouter :
      A l'apparition du joueur, faire apparaître une flèche pour que celui-ci sache dans quelle direction il va se lancer.
*/

public void startGame(int theValue) {
  step = 2;
  background(noir);
  map = new Carte(joueurs);
  ((Controller)(ctrl.get("startGame"))).setVisible(false);
}

void keyPressed() {
  km.update(key, true);
}

void keyReleased() {
  km.update(key, false);
}