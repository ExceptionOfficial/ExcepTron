import controlP5.*;

public class Menu {
  protected ControlP5 m_ctrl;
  protected PImage m_title;
  
  public Menu(exceptron e) {
    // Initialisation des variables du menu
    m_title = loadImage("exceptron.png");
    m_title.resize(600,200);
    
    // Définition des contrôles
    m_ctrl = new ControlP5(e);
    
    // Bouton de début de partie
    m_ctrl.addButton("startGame")
      .setPosition(SCREEN_WIDTH * 10/100, m_title.height + (SCREEN_HEIGHT - m_title.height) * 80 / 100 + 30)
      .setSize(SCREEN_WIDTH * 35 / 100, SCREEN_HEIGHT/20)
      .setLabel("Start the party!")
      .setVisible(false);
      
  
    // Boutons pour ajouter des joueurs
    for(int i = 1 ; i <= NB_JOUEURS_MAX ; ++i) {
      m_ctrl.addToggle("activateJ"+i)
        .setPosition(SCREEN_WIDTH * 10/100 + 30, m_title.height +(SCREEN_HEIGHT - m_title.height) * 12 / 100 + i * 50)
        .setSize(40,40)
        .setLabelVisible(false)
        .setVisible(false);
    }
        
    // Formulaires pour les noms
    noStroke();      fill(blanc);
    for(int i = 1 ; i <= NB_JOUEURS_MAX ; ++i) {
      m_ctrl.addTextfield("inputJ" + i)
       .setPosition(SCREEN_WIDTH * 20/100, m_title.height +(SCREEN_HEIGHT - m_title.height) * 12 / 100 + i * 50)
       .setSize(200,40)
       .setLabelVisible(false)
//       .setFont(font)
//       .setFocus(true)
       .setColorBackground(blanc)
       .setColor(noir)
       //.setVisible(false)
     ;
    }
  }
  
  public void display() {
    background(color(200,200,200));                        // Fond de l'écran
    image(m_title, SCREEN_WIDTH/2-m_title.width/2, 0);     // Logo
    
    this.container(SCREEN_WIDTH * 10/100, m_title.height, SCREEN_WIDTH * 35 / 100, (SCREEN_HEIGHT - m_title.height) * 80 / 100, "NOUVELLE PARTIE");
    this.container(SCREEN_WIDTH * 55/100, m_title.height, SCREEN_WIDTH * 35 / 100, (SCREEN_HEIGHT - m_title.height) * 80 / 100, "HIGH SCORES");
    
    ((Controller)(m_ctrl.get("startGame"))).setVisible(true);
    // Ombre du bouton
    fill(noir);
    rect(SCREEN_WIDTH * 10/100 + 10, m_title.height + (SCREEN_HEIGHT - m_title.height) * 80 / 100 + 40, SCREEN_WIDTH * 35 / 100, SCREEN_HEIGHT/20);
      for(int i = 1 ; i <= NB_JOUEURS_MAX ; ++i) {
        ((Controller)(m_ctrl.get("activateJ"+i))).setVisible(true);
      }
    
  }

  private void container(int p_X, int p_Y, int w, int h, String t) {
    noStroke();
    fill(noir);
    rect(p_X + 10, p_Y + 10, w, h);      // Ombre
    fill(darkred);
    rect(p_X, p_Y, w, h);                // Fond
    fill(gris);
    rect(p_X, p_Y, w, h/6);              // En-tête
    fill(noir);
    textSize(h/16);
    text(t, p_X + 30, p_Y + h / 12);     // Texte
  }

  public void launch() {
    background(noir);                  // Réinitialisation du background
    
    // Disparition des boutons
    ((Controller)(m_ctrl.get("startGame"))).setVisible(false);
    for(int i = 1 ; i <= NB_JOUEURS_MAX ; ++i) {
      ((Controller)(m_ctrl.get("activateJ"+i))).setVisible(false);
    }
    
    // Création des joueurs
    for(int i = 0 ; i < NB_JOUEURS_MAX ; i++) {
      if(((Toggle)m_ctrl.get("activateJ"+((int)i+1))).getState()) {      // Bouton Toggle activé
        joueurs.add(new Player(i, cmd_tab[i]));                          // i est l'indice et l'ID du joueur
      }
    }
  }
}

/*
cp5.addTextfield("input")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
     
      text(cp5.get(Textfield.class,"input").getText(), 360,130);
      
*/
  