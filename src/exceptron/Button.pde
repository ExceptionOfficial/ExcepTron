public class Button {
  protected int m_id;
  protected String m_value;
  protected PVector m_position;
  protected PVector m_size;
  protected color m_color;
  
  public Button() {
    m_size = new PVector(128, 64);
    m_position = new PVector(0, 0);
    m_value = "button";
    m_color = color(255, 111, 111);
  }

  public Button(String p_value, PVector p_position, PVector p_size, color p_color) {
    m_size = new PVector(p_size.x, p_size.y);
    m_position = new PVector(p_position.x, p_position.y);
    m_value = p_value;
    m_color = p_color;
  }
  
  public void draw() {
    noStroke();
    fill(color(50,50,50));
    rect(m_position.x+2, m_position.y+2, m_size.x, m_size.y);
    fill(m_color);
    rect(m_position.x, m_position.y, m_size.x, m_size.y);
    fill(color(0,0,0));
    textSize(m_size.y/2);
    textAlign(CENTER,CENTER);
    text(m_value, m_position.x+m_size.x/2, m_position.y+m_size.y/2);
  }
}