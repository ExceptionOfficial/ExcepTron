public class Player {
    protected int id;                        // ID du joueur
    protected PVector position;
    protected PVector direction;            // Direction x : r(vitesse), y : theta
    protected color couleur;                // Couleur du joueur
    protected int score;
    protected String controle;              // ? droite ou gauche ?
    protected PImage tete;
    protected boolean m_alive;
    
    public static final int tailleTete = 10;
  
    public Player(int i, String c) {
        this.id = i;                      // ID choisi dans le setup
        
        // Placement de départ : aléatoire pour le moment
        this.position = new PVector(
            tailleTete / 2 + random(SCREEN_WIDTH/10, SCREEN_WIDTH - SCREEN_WIDTH/10),
            tailleTete / 2 + random(SCREEN_HEIGHT/10, SCREEN_HEIGHT - SCREEN_HEIGHT/10));
        
        // Direction de départ : 4 possibilités : haut, bas, droite, gauche
        this.direction = new PVector(3, random(-PI, PI));

        // Pareil, couleur aléatoire
        int tirageCouleur = (int) random(0,255);
        this.couleur = color(tirageCouleur, (255 - tirageCouleur) % 200, tirageCouleur*(tirageCouleur + 255) % 255);
        this.score = 0;                    // Score  = 0
        this.controle = c;                 // Contrôle envoyés par le setup
        this.m_alive = true;
        //this.tete = ;
    }
    
    public float getX() {
      return this.position.x;
    }
    
    public float getY() {
      return this.position.y;
    }
    
    public int getId() {
      return this.id;
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
      float x = direction.x*cos(direction.y);
      float y = direction.x*sin(direction.y);
      stroke(blanc);  strokeWeight(3);
      line(this.position.x, this.position.y, this.position.x+11*x, this.position.y+11*y);
    } 
    
    public void avancer() {
      this.position.x += this.direction.x*cos(this.direction.y);
      this.position.y += this.direction.x*sin(this.direction.y);
    }
    
    public void changerDirection(boolean b) {     // Vrai = droite, faux = gauche
      if(b) {
        direction.y -= QUARTER_PI /16;
      } else {
        direction.y += QUARTER_PI /16;
      }
    }
    
    public void kill() {
      m_alive = false;
    }
    
    public boolean isAlive() {
      return this.m_alive;
    }
}