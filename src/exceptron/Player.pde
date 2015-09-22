public class Player {
    public int ID;                        // ID du joueur
    private PVector position;
    private PVector direction;            // Direction x, y
    private int vitesse;                  // Vitesse vecteur x, y 
    private color couleur;                // Couleur du joueur
    private int score;
    private String controle;              // ? droite ou gauche ?
  
    public Player() {
        
    }
    
    public getX() {
      return this.position.x();
    }
    
    public getY() {
      return this.position.y();
    }
    
    public void Avancer() {
      this.position.x += this.direction.x;
      this.position.y += this.direction.y;
    }
    
    public void changerDirection(boolean b)
    {
      
    }
    
    public void Afficher() {
      stroke(couleur);
      
      
    }
    
    public void kill() {
      
    }
}