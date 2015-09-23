public class Player {
    public int ID;                        // ID du joueur
    private PVector position;
    private PVector direction;            // Direction x, y
    private int vitesse;                  // Vitesse vecteur x, y 
    private color couleur;                // Couleur du joueur
    private int score;
    private String controle;              // ? droite ou gauche ?
  
    public Player(int i, String c) {
        this.ID = i;                      // ID choisi dans le setup
        
        // Placement de départ : aléatoire pour le moment
        this.position = new PVector(
            taille / 2 + random(SCREEN_WIDTH - taille/2),
            taille / 2 + random(SCREEN_HEIGHT - taille/2));
        
        // Direction de départ : 4 possibilités : haut, bas, droite, gauche
        this.direction = new PVector(random(2) - 1, random(2) - 1);                  // RAND A FAIRE CÔTE NEGATIF AUSSI !
        
        this.vitesse = 1;                  // Vitesse par défaut
        
        // Pareil, couleur aléatoire
        this.couleur = color(random(255), random(255), random(255));
        this.score = 0;                    // Score  = 0
        this.controle = c;                 // Contrôle envoyés par le setup
    }
    
    public float getX() {
      return this.position.x;
    }
    
    public float getY() {
      return this.position.y;
    }
    
    public int getColor() {
      return this.couleur;
    }
    
    public void Afficher() {
      noStroke();
      fill(this.getColor());
      ellipse(this.getX(), this.getY(), taille, taille);
    }
    
    public void AfficherDirection() {
      float x = this.position.x;
      float y = this.position.y;
      float x2 = x + this.direction.x * 3 * taille;
      float y2 = y + this.direction.y * 3 * taille;
      
      stroke(blanc);  strokeWeight(3);
      line(x, y, x2, y2);
      pushMatrix();
      translate(x2, y2);
      float a = atan2(x - x2, y2 - y);
      rotate(a);
      line(0, 0, -5, -5);
      line(0, 0, 5, -5);
      popMatrix();
    } 
    
    public void Avancer() {
      this.position.x += this.direction.x;
      this.position.y += this.direction.y;
    }
    
    public void changerDirection(boolean b)      // Vrai = droite, faux = gauche
    {
      if(b)
      {
        //direction.getAngle();
      }
      else
      {
        
      }
    }
    
    public void kill() {
      
    }
}