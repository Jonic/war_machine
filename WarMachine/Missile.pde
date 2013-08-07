/*
The missiles that rain from above... aka a line that gets longer over time.
Also keeps state for its stroke width (which can 'breathe' by expanding and contracting) and color 
*/

class Missile {

  private PVector origin, location, velocity;

  private color strokeColor;
  private float strokeThickness = 1;
  private boolean strokeIsExpanding = true; //used to animate the stroke's thickness
  private int breathRate = 1; //used to determine the rate of animated thickness

  Missile() {
    
    float randomX = random(0, RES_WIDTH); 
    origin = new PVector(randomX, 0.0);
    location = new PVector(randomX, 0.0);
    velocity = new PVector(random(-1, 1), random(0, 1));

    //Default color is black
    strokeColor = color(0);

    strokeThickness = random(1, 5); // start the thicknesses at different levels
    breathRate = int (random(1, 10));
  } 

  public void update(float delta) {
    //move the missile 
    //could check to see if it is onscreen but just updating it might be computationally cheaper even.. 
    location.add(velocity);
    
    //make the missile's stroke expand/contract for some animation.
    if (delta % breathRate == 0) {
          if (strokeIsExpanding) {
        if (strokeThickness < 4) {
          strokeThickness++;
        } 
        else {
          strokeIsExpanding = false;
          strokeThickness--;
        }
      } 
      else {
        if (strokeThickness > 2) {
          strokeThickness--;
        } 
        else {
          strokeIsExpanding = true;
        }
      }
    }
  }

  public void draw() {
    strokeWeight(strokeThickness);
    stroke(strokeColor);
    line(origin.x, origin.y, location.x, location.y);
    stroke(random(0, 255));
    point(location.x, location.y);
  }
  

  public float getX() {
    return location.x;
  }
  
  public float getY() {
    return location.y;
  }

  public void setColor(color strokeColor) {
    this.strokeColor = strokeColor;
  }
}

