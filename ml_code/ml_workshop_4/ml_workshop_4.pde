/**
 * Bush School CPJava Class Final Project
 * Project Details: https://chandrunarayan.github.io/cpjava/final_projects/
 * 1. Build a complete Java Neural Network from scratch
 * 2. Test the Neural Network using 2 scenarios
 *    a. Predict equation of line using a supplied set of points
 *    b. Classify hand written 28x28 pixel numerals from 0-9
 * Adapted for Bush School by Chandru Narayan
 * from "Make your own Neural Network" by Tariq Rashid
 */

// Import NIST Java Matrix Library
// https://math.nist.gov/javanumerics/jama/Jama-1.0.3.jarhttps://math.nist.gov/javanumerics/jama/Jama-1.0.3.jar
// https://math.nist.gov/javanumerics/jama/doc/ 
 
import Jama.*;  

// Globals
NeuralNetwork bushNN;
int input_nodes = 3;
int hidden_nodes = 3;
int output_nodes = 3;
float learning_rate = 0.1;

// Main
void setup() {
  // create my neural network
  bushNN = new NeuralNetwork(input_nodes, hidden_nodes, output_nodes, learning_rate);

// Create input data as a Column Matrix
// carefully note how the column matrix is initialized
// This will eventualy come from a file of input values
  double[][] ainp = {{0.9},
    {0.1},
    {0.8}};

  Matrix inp = new Matrix(ainp);  //column matrix of input values
  MatrixPrint.mprint("printing inputs to neural network", inp);  
  
  // Predict the output for a given set of inputs!
  // feedforward
  Matrix out = bushNN.predict(inp);
  
  MatrixPrint.mprint("printing final output from neural network", out);  

  // Train the neural network for a given set of training inputs for which answer is known!
  // backward propagation
  bushNN.train(inp);
}

void draw() {
}
