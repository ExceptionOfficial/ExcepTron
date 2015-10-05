public class Carte {
    private PGraphics fond;                           // Image contenant les déplacements
    private ArrayList<PVector> oldpos;                // Liste des anciennes positions des joueurs
    private IntList collisions;                       // Liste des joueurs ayant déjà eu une collision
    protected PImage m_screen;
    protected int[][] map;
    
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
      for(int k = 0 ; k < joueurs.size() ; k++) {
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
      
      m_screen = get();  // initialisation de la map de comparaison
      map = new int[SCREEN_WIDTH][SCREEN_HEIGHT];
      for(int m = 0; m < SCREEN_WIDTH ; m++) {
        for(int n = 0; n < SCREEN_HEIGHT ; n++) {
          if(m<5 || m>=SCREEN_WIDTH-5 || n<5 || n>=SCREEN_HEIGHT-5){
            map[m][n] = -2;
          } else {
            map[m][n] = -1;
          }
        }
      }
    }
    
    public IntList getCollisions() {
      return this.collisions;
    }
    
    public void addCollision(int ID) {
      this.collisions.append(ID);
    }
    
    public void update(ArrayList<Player> joueurs) {    // Modifier la carte en fonction des déplacements
      PImage screen = get();
      Player p;                                        // Variables temporaires
      boolean collision;
      color black = 0;
      
      for(int k = 0 ; k < joueurs.size() ; k++) {
        int x = 0, y = 0;
        p = joueurs.get(k);
        collision = false;
        
        while(p.isAlive() && !collision && x < 10) {
          y = 0;
          while(!collision && y < 10) {
            if((x-5)*(x-5)+(y-5)*(y-5) <= (Player.tailleTete/2) * (Player.tailleTete/2)) {
              int indX = (int)p.getX()+x, indY = (int)p.getY()+y;
              if(indX < SCREEN_WIDTH && indX >= 0 && indY < SCREEN_HEIGHT && indY >= 0) {
                if(map[indX][indY] != -1 && map[indX][indY] != p.getId()) {
                  addCollision(p.getId());
                  collision = true;
                  println("Collision du joueur : ", p.getId());
                } else {
                  map[indX][indY] = p.getId();
                }
              }
            }
            y++;
          }
          x++;
        }
      }        // Fin boucle joueurs
      m_screen = screen;
    }
}