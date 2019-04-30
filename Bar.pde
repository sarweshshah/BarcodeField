final int marginX = 100;
final int marginY = 100;

class Bar {
  int height = 170;
  int weight;
  PVector[] pos;
  int dPoints = 6;
  float k;

  Bar(int x, int _str, float _k) {
    weight = _str;
    k = _k;
    pos = new PVector[height];
    for (int i = 0; i < height; i ++) {
      pos[i] = new PVector(x + marginX, i * dPoints + marginY);
      if (k < 1) {
        pos[i].y = marginY + (height-1) * dPoints - (i * dPoints);
      }
    }
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    for (int i = 1; i < height; i ++) {
      //mouse interaction
      pos[i].y += k;
      float d = PVector.dist(mouse, pos[i]);
      if (d < dMouse) {
        PVector tmpPV = mouse.get();       
        tmpPV.sub(pos[i]);
        tmpPV.normalize();
        tmpPV.mult(dMouse);
        tmpPV = PVector.sub(mouse, tmpPV);
        pos[i] = tmpPV.get();
      }
    }
    for (int i = 1; i < height; i ++) {
      PVector tmp = PVector.sub(pos[i-1], pos[i]);
      tmp.normalize();
      tmp.mult(dPoints);
      pos[i] = PVector.sub(pos[i-1], tmp);
    }
  }

  void display() {
    strokeWeight(weight);
    beginShape();
    for (int i = 0; i < height; i ++) {
      vertex(pos[i].x, pos[i].y);
    }
    endShape();
  }
}
