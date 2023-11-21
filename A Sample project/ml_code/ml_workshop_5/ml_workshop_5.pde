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
float learning_rate = 0.3;
int nIter = 1000;  // number of iterations corresponding to number of input data for training

boolean debug = false;

// Main
void setup() {
  // create my neural network
  bushNN = new NeuralNetwork(input_nodes, hidden_nodes, output_nodes, learning_rate);
  
  MatrixUtil.mprint(true, "printing initial input_hidden weights", bushNN.wIH);
  MatrixUtil.mprint(true, "printing initial hidden_output weights", bushNN.wHO);

  // Create input data as a Column Matrix
  // carefully note how the column matrix is initialized
  // This will eventualy come from a file of input values
  double[][] ainp = {{0.9},
    {0.1},
    {0.8}};

  Matrix inp = new Matrix(ainp);  //column matrix of input values
  MatrixUtil.mprint(true, "printing inputs to neural network", inp);
  // double min_inp = MatrixUtil.mmin(inp);
  // double max_inp = MatrixUtil.mmax(inp);
  // System.out.println(String.format("min value in input is: %.3f", min_inp));
  // System.out.println(String.format("max value in input is: %.3f", max_inp));
  // double mag_inp = inp.normF();
  // System.out.println(String.format("magnitude of input matrix: %.3f", mag_inp));
  // inp.timesEquals(1/mag_inp);
  // MatrixUtil.mprint(debug, "printing normalized inputs to neural network", inp);

  // Create target data as a Column Matrix
  // carefully note how the column matrix is initialized
  // This will eventualy come from a file of input values
  double[][] atgt = {{0.1},
    {0.8},
    {0.9}};

  Matrix tgt = new Matrix(atgt);  //column matrix of input values
  MatrixUtil.mprint(true, "printing targets for neural network", tgt);
  // double min_tgt = MatrixUtil.mmin(tgt);
  // /double max_tgt = MatrixUtil.mmax(tgt);
  // System.out.println(String.format("min value in target is: %.3f", min_tgt));
  // System.out.println(String.format("max value in target is: %.3f", max_tgt));
  // double mag_tgt = tgt.normF();
  // System.out.println(String.format("magnitude of target matrix: %.3f", mag_tgt));
  // tgt.timesEquals(1/mag_tgt);
  // MatrixUtil.mprint(debug, "printing normalized targets for neural network", tgt);

  // Predict the output for a given set of inputs!
  // feedforward
  //store results in
  Matrix [] out = bushNN.predict(inp);

  MatrixUtil.mprint(true, "printing initial output from neural network", out[2]);
  Matrix output_error = tgt.minus(out[2]);
  MatrixUtil.mprint(true, "printing initial output_error from neural network", output_error);

  for (int i = 0; i < nIter; i++) {
    // Train the neural network for a given set of training inputs for which answer is known!
    // This is accomplished through backward propagation
    bushNN.train(inp, tgt);
    out = bushNN.predict(inp);
    String myStr = String.format("printing iteration %d output from neural network after adjusting weights", i+1);
    MatrixUtil.mprint(debug, myStr, out[2]);
  }
  
  MatrixUtil.mprint(true, "printing final adjusted input_hidden weights", bushNN.wIH);
  MatrixUtil.mprint(true, "printing final adjusted hidden_output weights", bushNN.wHO);
  
  MatrixUtil.mprint(true, "printing final output from neural network", out[2]);
  output_error = tgt.minus(out[2]);
  String myStr = String.format("printing final output_error from neural network after %d iterations", nIter);
  MatrixUtil.mprint(true, myStr, output_error);
}

void draw() {
}
