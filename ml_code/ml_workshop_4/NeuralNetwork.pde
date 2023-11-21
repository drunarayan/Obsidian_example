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

    // setup weights
    
    // initial input_hidden weights
    // this will eventually be created using a normal distribution of random numbers
    double[][] awIH = {{0.9, 0.3, 0.4},
      {0.2, 0.8, 0.2},
      {0.1, 0.5, 0.6}};
    wIH = new Matrix(awIH);  // weights matrix in between input and hidden layers
    MatrixPrint.mprint("printing initial input_hidden weights", wIH);

    // initial hidden_output weights
    // this will eventually be created using a normal distribution of random numbers
    double[][] awHO = {{0.3, 0.7, 0.5},
      {0.6, 0.5, 0.2},
      {0.8, 0.1, 0.9}};
    wHO = new Matrix(awHO);  // weights matrix in between hidden and output layers
    MatrixPrint.mprint("printing initial hidden_output weights", wHO);

  }
  
  /**
   * predict() function implementing feed forward calculations.
   * @param inp: Matrix of input values to Neural Network
   * @return out: Matrix of calculated output values from the Neural Network
   */  
  Matrix predict(Matrix inp) {
    
    // hidden layer calculations
    // hidden layer inputs: weighted sum
    Matrix hid_inp = wIH.times(inp);  // dot product to create the weighted sum
    //MatrixPrint.mprint("printing hidden layer inputs: weighted sum", hid_inp);

    // hidden layer outputs: sigmoid(weighted sum)
    // note: output of hidden layer is same as input of output layer
    Matrix hid_outp = Activator.sigmoid(hid_inp);  // sigmoid activation of the weighted sum
    //MatrixPrint.mprint("printing hidden layer outputs: sigmoid(weighted sum)", hid_outp);

    //output layer calculations
    //output of hidden layer is same as input of output layer
    Matrix out_outp = wHO.times(hid_outp);  // dot product to create the weighted sum
    //MatrixPrint.mprint("printing output layer inputs: weighted sum", out_outp);

    // calculate sigmoid activation of the weighted sum of the output layer
    Matrix out = Activator.sigmoid(out_outp); 
    return out;  // return the sigmoid activation of the weighted sum
  }

  /**
   * train() function for implementing backward propagation.
   * @param inp: Matrix of input values to train the Neural Network
   */ 
  void train(Matrix inp) {
    // Reverse Propagation
    // first feed forward!
    Matrix out = this.predict(inp);
    //MatrixPrint.mprint("printing first output from neural network before back propagation", out);
  }
}
