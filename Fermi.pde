/**
 * Random points. 
 * 
 * This sketch draws ellipses with x and y locations tied to various distribution of random numbers.
 */

void setup() {
  size(1000, 1000);
  background(0); // Black background.
}

void keyPressed() {
  switch(key) {
  case 'p': 
    saveFrame("####.png");
  }
}

/* minimumX is minimum value, 
 alpha is the pareto index (bigger alpha = average X closer to minX)
 proba is the probability wanted from the sample
 */
float paretoIze(float proba, float minimumX, float alpha) {
  proba = constrain(proba, 0, 1);
  minimumX = max(minimumX, 1);
  return minimumX / (pow(proba, 1 / alpha));
}

void draw() {
  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float valx = randomGaussian();
  float valy = randomGaussian();

  float sd = 100;                   // Define a standard deviation
  float meanX = width/2;            // Define a mean value (middle of the screen along the x-axis)
  float meanY = height/2;           // Define a mean value for Y.
  float x = ( valx * sd ) + meanX;  // Scale the gaussian random number by standard deviation and mean
  float y = ( valy * sd ) + meanY;  // Same thing for y 

  // Drawing parameters: No stroke, white filling.
  noStroke();
  fill(255);

  //Alternative : float r = constrain(paretoIze(random(1), 1.5, 2), 0, 200);
  float r = abs(randomGaussian()) * 7; // Fix the distribution of the radius of ellipses.
  ellipse(x, y, r, r);   // Draw an ellipse at our "normal" random location.
}

