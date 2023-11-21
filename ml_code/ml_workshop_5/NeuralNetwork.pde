/**
 * Bush School CPJava Class Final Project
 * Project Details: https://chandrunarayan.github.io/cpjava/final_projects/
 * NeuralNetwork class with predict() and train() functions
 */
class NeuralNetwork {
  /** number of input nodes */
  int iNodes;
  /** number of hidden nodes */
  int hNodes;
  /** number of output nodes */
  int oNodes;
  /** learning rate */
  float lRate;
  /** weights matrix in between input and hidden layers */
  Matrix wIH;
  /** weights matrix in between hidden and output layers */
  Matrix wHO;

  /**
   * Constructor for the Neural Network Class.
   * Initialize properties
   */
  /** initialize nodes and lr */
  NeuralNetwork(int iNodes_, int hNodes_, int oNodes_, float lRate_) {
    iNodes = iNodes_;
    hNodes = hNodes_;
    oNodes = oNodes_;
    lRate = lRate_;
    
    boolean debug = false;

    // setup weights

    // initial input_hidden weights
    // created using a normal distribution of random numbers
    //wIH = MatrixUtil.mcrud(iNodes, hNodes);  // weights matrix in between input and hidden layers
    //MatrixUtil.mprint(debug, "printing initial input_hidden weights", wIH);

    // initial hidden_output weights
    // created using a normal distribution of random numbers
    //wHO = MatrixUtil.mcrud(hNodes, oNodes);  // weights matrix in between hidden and output layers
    //MatrixUtil.mprint(debug, "printing initial hidden_output weights", wHO);
    
    double[][] awIH = {{0.9, 0.3, 0.4},
      {0.2, 0.8, 0.2},
      {0.1, 0.5, 0.6}};
    wIH = new Matrix(awIH);  // weights matrix in between input and hidden layers
    MatrixUtil.mprint(debug, "printing initial input_hidden weights", wIH);
  
    // initial hidden_output weights
    // this will eventually be created using a normal distribution of random numbers
    double[][] awHO = {{0.3, 0.7, 0.5},
      {0.6, 0.5, 0.2},
      {0.8, 0.1, 0.9}};
    wHO = new Matrix(awHO);  // weights matrix in between hidden and output layers
    MatrixUtil.mprint(debug, "printing initial hidden_output weights", wHO);
    
}

  /**
   * predict() function implementing feed forward calculations.
   * @param inp: Matrix of input values to Neural Network
   * @return res: Matrix [] an array of matrices with calculated output values from the Neural Network
   */
  Matrix [] predict(Matrix inp) {
    boolean debug = false;
    // create Matrix array to store hidden_input, hidden_output, and final_output values
    Matrix [] res = new Matrix [3];

    // hidden layer calculations
    // hidden layer inputs: weighted sum
    Matrix hid_inp = wIH.times(inp);  // dot product to create the weighted sum
    MatrixUtil.mprint(debug, "printing hidden layer inputs: weighted sum", hid_inp);
    res[0] = hid_inp;  // store hidden weighted sum in in res in Matrix array
    
    // hidden layer outputs: sigmoid(weighted sum)
    // note: output of hidden layer is same as input of output layer
    Matrix hid_outp = Activator.sigmoid(hid_inp);  // sigmoid activation of the weighted sum
    MatrixUtil.mprint(debug, "printing hidden layer outputs: sigmoid(weighted sum)", hid_outp);
    res[1] = hid_outp; // store hidden sigmoid output in res Matrix array
    
    //output layer inputs: weighted sum
    //input to output layer is same as output from hidden layer
    Matrix out_inp = wHO.times(hid_outp);  // dot product to create the weighted sum
    MatrixUtil.mprint(debug, "printing output layer inputs: weighted sum", out_inp);
    
    // calculate sigmoid activation of the weighted sum of the output layer
    Matrix out = Activator.sigmoid(out_inp);
    MatrixUtil.mprint(debug, "printing output layer outputs : sigmoid(weighted sum)", out);
    res[2] = out;  // store hidden sigmoid output in res Matrix array
    
    return res;  // return the sigmoid activation of the weighted sum
  }

  /**
   * train() function for implementing backward propagation.
   * @param inp: Matrix of input values to train the Neural Network
   */
  void train(Matrix inp, Matrix tgt) {
    // Back Propagation
    // first feed forward!
    
    boolean debug = false;
    
    //System.out.println("***** Feed Forward Starts *******");
    
    MatrixUtil.mprint(debug, "printing inputs to neural network", inp);
    MatrixUtil.mprint(debug, "printing targets to neural network", tgt);
    
    Matrix [] out = this.predict(inp);
    
    MatrixUtil.mprint(debug, "printing hidden layer inputs: weighted sum", out[0]);
    MatrixUtil.mprint(debug, "printing hidden layer outputs: sigmoid(weighted sum)", out[1]);
    MatrixUtil.mprint(debug, "printing output layer inputs = hidden_layer outputs", out[1]);
    MatrixUtil.mprint(debug, "printing output layer outputs = final outputs", out[2]);
    
    Matrix output_error = tgt.minus(out[2]);
    MatrixUtil.mprint(debug, "printing output_error from neural network", output_error);

    Matrix hidden_error = wHO.transpose().times(output_error);
    MatrixUtil.mprint(debug, "printing hidden errors from neural network", hidden_error);    
    
    //System.out.println("***** Back Propagations Starts *******");
    
    Matrix unity = new Matrix(hidden_nodes,1,1.0);  // Create a column matrix of 1.0 to use in 1-sigmoid calculation
    
    // Update weights between hidden and output layers based on output error
    Matrix lhdot1 = output_error.arrayTimes(out[2].arrayTimes(unity.minus(out[2])));
    Matrix lhdot2 = out[1].transpose();
    wHO.plusEquals(lhdot1.times(lhdot2).times(lRate));
    MatrixUtil.mprint(debug, "printing updated weights between hidden and output layers", wHO);
    
    // Update weights between input and hidden layers based on calculated error
    Matrix lhdot3 = hidden_error.arrayTimes(out[1].arrayTimes(unity.minus(out[1])));
    Matrix lhdot4 = inp.transpose();
    wIH.plusEquals(lhdot3.times(lhdot4).times(lRate));
    MatrixUtil.mprint(debug, "printing updated weights between input and hidden layers", wIH);
  }
}
