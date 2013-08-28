
/////////////////
//  VARIABLES  //
/////////////////

int numParticles = 250;

//Fewer particles for mobile, for better performance
if (window.innerWidth <= 480) {
  numParticles = 50;
}


float maxVelocity = 10;
Particle[] particles = new Particle[numParticles];
float newHueVal = random(0, 100);



/////////////
//  SETUP  //
/////////////

void setup() {

  size(window.innerWidth, window.innerHeight);

  frameRate(30);
  colorMode(HSB, 100);
  ellipseMode(CENTER);

  //Create particle objects
  for (int i = 0; i < numParticles; i++) {
    float x = width/2;
    float y = height/2;
    float d = 2;
    particles[i] = new Particle(x, y, d);
  }
}



////////////
//  DRAW  //
////////////

void draw() {
  background(100);
  
  float md = mouseX - pmouseX;
  
  if (mousePressed) {
    for(int i = 0; i < numParticles; i++) {
      particles[i].flagForNewHue();
    }
    newHueVal = random(0, 100);
  }

  for (int i = 0; i < numParticles; i++) {
    particles[i].update();
    particles[i].render();
  }
}



class Particle {

  //Values
  PVector l;  //Location
  PVector v;  //Velocity
  float d;  //Diameter
  float h;  //Hue
  float b;  //Brightness
  boolean newHueFlag;

  //Constructor
  Particle(float _x, float _y, float _d) {
    l = new PVector(_x, _y);
    v = new PVector(random(-maxVelocity, maxVelocity), random(-maxVelocity, maxVelocity));
    d = _d;
    h = 0;
    b = 0;
    newHueFlag = false;
  }

  //Methods
  void flagForNewHue() {
    newHueFlag = true;
  }
  
  void newHue() {
    d += 1.5;
    h = newHueVal;
    b = random(25, 75);
  }
  
  void update() {
    l.add(v);
    if ((l.x < 0) || (l.x > width) || (l.y < 0) || (l.y > height)) {
      l.set(mouseX, mouseY, 0);
      v.set(random(-maxVelocity, maxVelocity), random(-maxVelocity, maxVelocity), 0);
      if(newHueFlag) {
        this.newHue();
        newHueFlag = false;
      }
    }
  }

  void render() {
    noStroke();
    fill(h, 100, b);
    ellipse(l.x, l.y, d, d);
  }
}

window.onresize = function(event) {
  size(window.innerWidth, window.innerHeight-3);
}

