public class KeyManager {
  static final int NB_KEY_MAX = 1024;
  protected boolean keys[];
  
  public KeyManager() {
    keys = new boolean[NB_KEY_MAX];
    for(int i = 0 ; i < NB_KEY_MAX ; i++) {
      keys[i] = false;     
    }
  }
  
  public void update(int k, boolean b) {
    /************************************************
    *
    *  met a jour l'etat des touches : true -> enfonce
    *
    *************************************************/
    if(k < NB_KEY_MAX) {
      keys[k] = b;
    }
  }
  
  public boolean isPressed(int k) {
    /************************************************
    *
    *  retourne l'etat de la touche : true -> enfoncee
    *
    *************************************************/
    return keys[k];
  }
}