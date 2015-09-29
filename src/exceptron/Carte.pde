public class Carte {
    private boolean matrix[][];                    // Liste des pixels occupés ou non
    private IntList collisions;                    // Liste des joueurs ayant déjà eu une collision
    
    public static final int bordures = 5;     // Bordures de 5px
    
    public Carte() {
      int i, j;                                    // Variables de boucles
      
      // Initialisation de la matrice de collisions
      matrix = new boolean[width][height];
      for(i = 0 ; i < width ; i++)
      {
        for(j = 0 ; j < height ; j++)
        {
          if(i <= bordures || i >= width - bordures || j <= bordures || j >= height - bordures)
            matrix[i][j] = true;
            
          else
            matrix[i][j] = false;
        }    // Fin for horizontal
      }      // Fin for vertical
      
      // Initialisation de la liste des joueurs en collision
      
      collisions = new IntList();                // Création d'une liste vide de joueurs en collision
        
      // Bordures
      noFill();                                  // Pas de remplissage
      stroke(rouge);                             // Couleur à choisir
      strokeWeight(10);                          // Taille de bordure
      rect(0,0,SCREEN_WIDTH, SCREEN_HEIGHT);     // Mise en place bordure
    }
    
    public IntList getCollisions() {
      return this.collisions;
    }
    
    public void setCollisions(int ID) {
      this.collisions.append(ID);
    }
    
    public void verifCollisions(Player p) {
      boolean b = true;
      int i, j;                                        // Variables de boucles
      int x = (int) p.getX();    int y = (int) p.getY();
      
      i = (int) x - p.tailleTete / 2 + 1;  
      while(i < x + p.tailleTete / 2 && b)
      {
        j = y - p.tailleTete / 2 + 1;
        while(j < y + p.tailleTete / 2 && b)
        {
          if(this.matrix[i][j]) {
            this.setCollisions(p.id);
            b = false;
          }        // Fin if
          j++;
        }          // Fin for vertical
        i++;
      }            // Fin for horizontal
    }
    
    // Méthode écrite en supposant que la vérification de collisions est faite auparavant
    public void update(ArrayList<Player> joueurs) {    // Modifier la carte en fonction des déplacements
      int i, j;
      int x; int y;  int pX; int pY; int pix;
      Player p;                                        // Variables temporaires
      
      for(int k = 0 ; k < joueurs.size() ; k++)
      {
        p = joueurs.get(k);
        x = (int) p.getX();    y = (int) p.getY();
        
        for( float O = 0 ; O < 2 * PI ; O = O + QUARTER_PI / 16)
        {
          i = (int) (x + p.tailleTete / 2 * cos(O));
          j = (int) (y + p.tailleTete / 2 * sin(O));
          
          if((i > 0) && (i < width) && (j < height) && (j > 0)) {
              this.matrix[i][j] = true;
          }    // Fin if
        }      // Fin for
        
        // Affichage des joueurs
        if(! this.collisions.hasValue(p.id)){            // Si le joueur n'est pas hors jeu
          noStroke();
          fill(p.getColor());
          ellipse(p.getX(), p.getY(), 10, 10);
        }      // Fin if
      }        // Fin boucle joueurs
    }
}