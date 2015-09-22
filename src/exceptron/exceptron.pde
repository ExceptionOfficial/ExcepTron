/****************************************************************************/
/*                                  Exception                               */
/*                                                                          */
/*          Projet ExcepTron : Création d'un snake multi-joueurs            */
/* exceptron.pde                                        Processing 3        */
/****************************************************************************/

final int SCREEN_WIDTH = 1366;
final int SCREEN_HEIGHT = 768;          // Résolution HD
final int FrameRate = 30;               // Frames par seconde

// Couleurs
final int rouge = color(255,0,0);  
final int vert  = color(0,255,0); 
final int bleu  = color(0,0,255);
final int noir  = color(0,0,0); 
final int blanc = color(255,255,255);

// Array de joueurs
ArrayList<Player> joueurs;

void setup() {
  size(1366, 768);                      // Résolution HD
  noStroke();                           // Pas de contours
  background(noir);                     // Fond noir
  frameRate(30);                        // 30 FPS
  smooth();                             // Anti-aliasing
  joueurs = new ArrayList();
}

void draw() {
      /* Appel au KeyManager ? ==> Classe KeyManager à créer */
}


/* pour la collision, utiliser les fonctions loadPixels et updatePixels,
qui permettent de charger la grille des pixels dans le tableau pixels
Utilisation :
    loadPixels();
    for i ....
      pixels[i] = pixels[i + 1];
    updatePixels();
*/

/* Tailles idéales :
      ellipse(x,y, 10, 10) pour la tête du snake
      strokeWeight(10) pour le corps
*/


void keyPressed() {
 /*if((key >= 'A' && key <= 'Z') || (key >= 'a' && key <= 'z')) {
    int keyIndex;
  }*/
}