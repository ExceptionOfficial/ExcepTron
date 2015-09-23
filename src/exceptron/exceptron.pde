/****************************************************************************/
/*                                  Exception                               */
/*                                                                          */
/*          Projet ExcepTron : Création d'un snake multi-joueurs            */
/*     exceptron.pde                                        Processing 3    */
/****************************************************************************/

final int SCREEN_WIDTH = 1366;
final int SCREEN_HEIGHT = 768;          // Résolution HD
final int NB_PIXELS = SCREEN_WIDTH + SCREEN_HEIGHT;
final int FrameRate = 30;               // Frames par seconde

// Tailles
final int taille = 10;                  // Taille en px de la tête du snake

// Couleurs
final int rouge = color(255,0,0);  
final int vert  = color(0,255,0); 
final int bleu  = color(0,0,255);
final int noir  = color(0,0,0); 
final int blanc = color(255,255,255);

ArrayList<Player> joueurs;          // Array de joueurs
Carte map;                          // Carte

// Paramètres
int nbjoueurs;

void setup() {
  nbjoueurs = 4;                    // Nombre de joueurs
  
  size(1366, 768);                  // Résolution HD
  noStroke();                       // Pas de contours
  background(noir);                 // Fond noir
  frameRate(30);                    // 30 FPS
  smooth();                         // Anti-aliasing
  
  map = new Carte();
  joueurs = new ArrayList();            // Création des joueurs
  for(int i = 1 ; i <= nbjoueurs ; i++)
  {
    joueurs.add(new Player(i, "ds"));
  }
  for(int i = 1 ; i <= nbjoueurs ; i++)
  {
    joueurs.get(i-1).Afficher();
    joueurs.get(i-1).AfficherDirection();
  }
  
}

void draw() { //<>//
  Player p;                              // Variables temporaires
  
  for(int i = 1 ; i <= nbjoueurs ; i++)
  {
    p = joueurs.get(i - 1);              // Raccourci d'écriture
    if(! map.getCollisions().hasValue(p.ID))
    {
      p.Avancer();
      //p.VerifCollisions(map);
    }
    println("Joueur1 x : ", joueurs.get(0).getX(), ", Y : ", joueurs.get(0).getY());
    
  }
  map.update(joueurs);
      /* Appel au KeyManager ? ==> Classe KeyManager à créer */
}

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
 /*if((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
    int keyIndex;
  }*/
}