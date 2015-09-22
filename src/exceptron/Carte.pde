public class Carte {
    public int ID;                        // ID du joueur
    private PVector position;
    private PVector direction;            // Direction x, y
    private int vitesse;                  // Vitesse vecteur x, y 
    private color couleur;                // Couleur du joueur
    private int score;
    private String controle;              // ? droite ou gauche ?
  
    public Carte() {
        
    }
    
    public afficher() {
      
    }
    
    public update(Player[] tab)          // Modifier la carte en fonction des déplacements
    {
        loadPixels();
        for(int i : tab)
        {
          
          
          
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