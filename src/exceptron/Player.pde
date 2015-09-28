public class Player {
    public int id;                        // ID du joueur
    private PVector position;
    private PVector direction;            // Direction x : r(vitesse), y : theta
    private color couleur;                // Couleur du joueur
    private int score;
    private String controle;              // Commandes
    private PImage tete;
    
    public static final int tailleTete = 10;
  
    public Player(int i, String c) {
        this.id = i;                      // ID choisi dans le setup
        
        // Placement de départ : aléatoire pour le moment avec marge de 10%
        this.position = new PVector(
            10 * SCREEN_WIDTH / 100 + random(SCREEN_WIDTH - 20 * SCREEN_WIDTH / 100),
            10 * SCREEN_HEIGHT / 100 + random(SCREEN_HEIGHT - 20 * SCREEN_HEIGHT / 100));
        
        // Direction de départ : 4 possibilités : haut, bas, droite, gauche
        this.direction = new PVector(3, random(-PI, PI));

        // Pareil, couleur aléatoire
        colorMode(HSB, 360, 100, 100);     // Passage en HSV
        int tirageCouleur = (int) random(0 , 360);
        this.couleur = color(tirageCouleur, 100, 100);
        this.score = 0;                    // Score  = 0
        this.controle = c;                 // Contrôle envoyés par le setup
        colorMode(RGB);                    // Retour en RGB
    }
    
    public float getX() {
      return this.position.x;
    }
    
    public float getY() {
      return this.position.y;
    }
    
    public String getControl() {
      return this.controle;
    }
    
    public void setControl(String c) {
      this.controle = c;
    }
    
    public color getColor() {
      return this.couleur;
    }
    
    public void afficher() {
      noStroke();
      fill(this.getColor());
      ellipse(this.getX(), this.getY(), tailleTete, tailleTete);    /* mauvais NE PAS REGENERER A CHAQUE FOIS l'ellipse */
    }
    
    public void afficherDirection() {
      float x = direction.x * cos(direction.y);
      float y = direction.x * sin(direction.y);
      stroke(blanc);  strokeWeight(3);
      line(this.position.x, this.position.y, this.position.x+11*x, this.position.y+11*y);
      float x2 = this.position.x+11*x; float y2 = this.position.y+11*y;
      pushMatrix();
      translate(x2, y2);
      float a = atan2(this.position.x - x2, y2 - this.position.y);
      rotate(a);
      line(0, 0, -15, -15);
      line(0, 0, 15, -15);
      popMatrix();
      
    } 
    
    public void avancer() {
      this.position.x += this.direction.x*cos(this.direction.y);
      this.position.y += this.direction.x*sin(this.direction.y);
    }
    
    public void changerDirection(boolean b) {     // Vrai = droite, faux = gauche
      if(b) {
        direction.y -= QUARTER_PI /8;
      } else {
        direction.y += QUARTER_PI /8;
      }
    }
    
    public void kill() {
      
    }
}