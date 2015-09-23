public class Carte {
    private IntList collisions;                    // Liste des joueurs ayant déjà eu une collision
    
    public Carte() {
        collisions = new IntList();                // Création d'une liste vide de joueurs en collision
        
        // Bordures
        noFill();                                  // Pas de remplissage
        stroke(rouge);                             // Couleur à choisir
        strokeWeight(taille);                      // Taille de bordure
        rect(0,0,SCREEN_WIDTH, SCREEN_HEIGHT);     // Mise en place bordure
    }
    
    public IntList getCollisions() {
      return this.collisions;
    }
    
    public void setCollisions(int ID) {
      this.collisions.append(ID);
    }
    
    // Méthode écrite en supposant que la vérification de collisions est faite auparavant
    public void update(ArrayList<Player> joueurs)  // Modifier la carte en fonction des déplacements
    {
      int pX; int pY; int pix;
      Player p;                                    // Variables temporaires
      int t = taille/2;                            // Raccourci d'écriture
      
      for(int k = 0 ; k < joueurs.size() ; k++)
      {
        p = joueurs.get(k);
        if(! this.collisions.hasValue(p.ID))       // Si le joueurs n'est pas hors jeu
        {
          noStroke();
          fill(p.getColor());
          ellipse(p.getX(), p.getY(), taille, taille);
        }      // Fin if
      }        // Fin boucle joueurs
    }
}