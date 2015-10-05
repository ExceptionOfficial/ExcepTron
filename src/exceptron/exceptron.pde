/****************************************************************************/ //<>//
/*                                  Exception                               */
/*                                                                          */
/*          Projet ExcepTron : Création d'un snake multi-joueurs            */
/*                                                                          */
/*     exceptron.pde                                       Processing 3.0   */
/****************************************************************************/

final int SCREEN_WIDTH = 1366;
final int SCREEN_HEIGHT = 768;          // Résolution HD
final int NB_PIXELS = SCREEN_WIDTH + SCREEN_HEIGHT;
final int FRAMERATE = 30;               // Frames par seconde

// Couleurs
final int rouge = color(255,0,0);  
final int vert  = color(0,255,0); 
final int bleu  = color(0,0,255);
final int noir  = color(0,0,0); 
final int blanc = color(255,255,255);

ArrayList<Player> joueurs;          // Array de joueurs
Carte map;                          // Carte
KeyManager km;                      // Gestionnaire de clavier

// Paramètres
int nbjoueurs;

void setup() {
  nbjoueurs = 4;                        // Nombre de joueurs
  
  size(1366, 768);                      // Résolution HD
  noStroke();                           // Pas de contours
  background(noir);                     // Fond noir
  frameRate(FRAMERATE);                 // 30 FPS
  smooth();                             // Anti-aliasing
  
  joueurs = new ArrayList();            // Création des joueurs
  km = new KeyManager();
  
  /* ajout des joueurs */
  joueurs.add(new Player(0, "qs"));
  joueurs.add(new Player(1, "df"));
  joueurs.add(new Player(2, "45"));
  joueurs.add(new Player(3, "op"));
  
  map = new Carte(joueurs);
  
  for(int i = 0 ; i < joueurs.size() ; i++) {
    joueurs.get(i).afficher();/*
    joueurs.get(i).afficherDirection();*/
  }
  
}

void draw() { //<>//
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
}

/* Actions :
  
  1 - Avancer
  2 - Vérifier
  3 - Remplacer jaune par blanc (implique de stocker les anciennes positions)
  4 - Placer le nouveau jaune


/* Tailles idéales :
      ellipse(x,y, 10, 10) pour la tête du snake
      strokeWeight(10) pour le corps
*/

/*
   Dans le gestionnaire de collision penser à ajouter les murs : ne pas pouvoir passer un mur et du fait de la taille
   de 10, ne pas pouvoir approcher la tête du snake à moins de 5px du mur.
   Pour rappel dans CurveFever, toucher le mur = mort
*/

/* A ajouter :
      A l'apparition du joueur, faire apparaître une flèche pour que celui-ci sache dans quelle direction il va se lancer.
*/

void keyPressed() {
  km.update(key, true);
}

void keyReleased() {
  km.update(key, false);
}