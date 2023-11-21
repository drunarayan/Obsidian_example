class Perceptron {
  float [] weights;

  Perceptron(int n) {
    weights = new float [n];
    for (int i = 0; i < weights.length; i++ ) {
      weights[i] = (float) (Math.random()*3) -1;
    }
  }

  int feedforward(float [] inputs) {
    int sum = 1, result;
    for (int i = 0; i < inputs.length; i++) {
      sum += inputs[i]*weights[i];
    }
    result = activate(sum);
    return result;
  }

  int activate(float sum) {
    return sum < 0.0 ? -1:1;
  }
}
