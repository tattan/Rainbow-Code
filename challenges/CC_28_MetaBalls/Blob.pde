// Louis Morrison-Nelson
// mouse reactive sketch

class Blob {
    PVector pos;
    float r;
    PVector vel;
    color c;
    
    Blob(float x, float y) {
      pos = new PVector(x,y);
      vel = new PVector(random(1), random(1));
      vel.mult(random(5,9));
      r = 30;
    }
    
    void update() {
      pos.add(vel);

      // directional velocity changes
      float mouseDist = dist(pos.x, pos.y, mouseX, mouseY);
      if (mouseDist < 200) {
        // the color allows you to see which blobs you are affecting if you call the show function
        c = color(0,0,255);
        if (mouseX > pos.x && vel.x > 0) {
          vel.x *= -1;
        } else if (mouseX < pos.x && vel.x <0){
          vel.x *= -1;
        }
        if (mouseY > pos.y && vel.y > 0) {
          vel.y *= -1;
        } else if (mouseY < pos.y && vel.y < 0){
          vel.y *= -1;
        }
      } else {
        c = color(0,255,0);
      }
      // to keep the mouse from chasing the blobs off the screen
      if (pos.x > width) {
        vel.x *= -1;
        pos.x = width;
      }
      if (pos.x < 0) {
        vel.x *= -1;
        pos.x = 0;
      }
      if (pos.y > height) {
        vel.y *= -1;
        pos.y = height;
      }
      if (pos.y < 0) {
        vel.y *= -1;
        pos.y = 0;
      }
    }
    
    void show() {
     noFill();
     stroke(c);
     strokeWeight(4);
     ellipse(pos.x, pos.y, r*2, r*2);
    }
}
