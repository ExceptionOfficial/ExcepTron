public class Carte {
    private PGraphics fond;                           // Image contenant les déplacements
    private ArrayList<PVector> oldpos;                // Liste des anciennes positions des joueurs
    private IntList collisions;                       // Liste des joueurs ayant déjà eu une collision
    
    public static final int bordures = 5;             // Bordures de 5px
    
    public Carte(ArrayList<Player> joueurs) {
      int i, j;                                       // Variables de boucles
      Player p;
      
      // Initialisation du fond
      fond = createGraphics(width, height);           // On crée l'image qui contient les tracés
      fond.beginDraw();                               // Debut dessin sur fond
      fond.background(noir);                          // Mise en place d'un fond noir
      
      // Initialisation des bordures
      fond.noFill();                                  // Pas de remplissage
      fond.stroke(blanc);                             // Couleur à choisir
      fond.strokeWeight(10);                          // Taille de bordure
      fond.rect(0,0,SCREEN_WIDTH, SCREEN_HEIGHT);     // Mise en place bordure
      
      // Initialisation des positions
      this.oldpos = new ArrayList<PVector>();
      for(int k = 0 ; k < joueurs.size() ; k++)
      {
        p = joueurs.get(k);
        this.oldpos.add(new PVector(p.getX(), p.getY()));
        fond.fill(rouge);
        fond.ellipse(p.getX(), p.getY(), p.tailleTete, p.tailleTete);
      }
      
      fond.endDraw();
      
      collisions = new IntList();                     // Création d'une liste vide de joueurs qui ont perdu
        
      // Dessin des bordures
      noFill();                                       // Pas de remplissage
      stroke(rouge);                                  // Couleur à choisir
      strokeWeight(10);                               // Taille de bordure
      rect(0,0,SCREEN_WIDTH, SCREEN_HEIGHT);          // Mise en place bordure
    }
    
    public IntList getCollisions() {
      return this.collisions;
    }
    
    public void setCollisions(int ID) {
      this.collisions.append(ID);
    }
    
    public void verifCollisions(Player p) {
      int r;                                           // Rayon
      float O;                                         // Theta : angle
      boolean b = true;                                // Collisions or not ?
      int i, j;                                        // Variables pixels
      
      int x = (int) p.getX();    int y = (int) p.getY();
      
      fond.loadPixels();
      
      r = 0;
      while(r <= p.tailleTete / 2 && b)
      {
        O = 0;
        while(O < 2 * PI && b)
        {
          i = (int) (x + r * cos(O));
          j = (int) (y + r * sin(O));
          if((i > 0) && (i < width) && (j < height) && (j > 0)) {
              println("i : " + i + "j : " + j);
              /*if(pixels[j * width + i] == blanc)
              {
                this.setCollisions(p.id);
                b = false;
              } */ // Fin if condition couleur
          }      // Fin if condition in_screen
          O = O + QUARTER_PI / 16;
        }
        r++;
      }
    }
    
    public void update(ArrayList<Player> joueurs) {    // Modifier la carte en fonction des déplacements
      
      int x; int y;  int pX; int pY; int pix;
      Player p;                                        // Variables temporaires
      
      
      
      for(int k = 0 ; k < joueurs.size() ; k++)
      {
        p = joueurs.get(k);
        x = (int) p.getX();    y = (int) p.getY();
        
        // Passage de l'ex rouge en blanc
        fond.beginDraw();
        fond.fill(blanc);
        fond.ellipse(this.oldpos.get(k).x, this.oldpos.get(k).y, p.tailleTete, p.tailleTete);
        
        // Mise en place du rouge sur les nouvelles positions
        fond.fill(rouge);
        fond.ellipse(x,y, p.tailleTete, p.tailleTete);
        
        // Mise à jour des nouvelles "anciennes" positions
        this.oldpos.get(k).x = x;
        this.oldpos.get(k).y = y;
        
        fond.endDraw();
      }        // Fin boucle joueurs
    }
}