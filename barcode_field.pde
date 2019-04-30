//one bar down, one bar up

final int barcode_width = 1720;
final int mingap = 2;//min gap between bars
final int maxgap = 12;//max gap between bars

float dMouse = 25;

ArrayList<Bar> bars;

void setup() {
  //size(550, 450, P2D);
  fullScreen(P2D);

  strokeCap(SQUARE);
  stroke(0);
  noFill();

  initalize();
}

void initalize() {
  bars = new ArrayList<Bar>();
  boolean isGap = false;
  
  int i = 0;
  while (i < barcode_width) {
    float r = random(1);
    int l = 1;
    for (int j = 1; j < (maxgap - mingap); j++) {
      if (r > (1 / float(j))) {
        l = j;
        break;
      }
    }
    
    if (!isGap) {
      for (int j = 0; j < l; j++) {
        float k = bars.size() % 2 == 0 ? 1 : -1;
        k *= 5;
        bars.add(new Bar(i+j, 1, k));
      }
    }
    
    i += l;
    isGap = !isGap;
  }
}

void mousePressed() {
  initalize();
}

void draw() {
  background(220);
  for (Bar b : bars) {
    b.update();
    b.display();
  }
}
