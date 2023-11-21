/**
 * Bush School CPJava Class Final Project
 * Project Details: https://chandrunarayan.github.io/cpjava/final_projects/
 * static MatrixUtil class with static mprint() dnd mcrud() functions
 * used for creating matrices of random number weights and printing etc.
 */
static class MatrixUtil {

  /**
   * mprint function for debugging.
   * @param title: description of print outs following
   * @param in: input Matrix to print
   */
  static void mprint(boolean debug, String title, Matrix in) {
    if (debug) {
      System.out.println(String.format("%s:", title));
      // caling the Matrix print function
      in.print(3, 3);  // print 3 digits of precision for rows and cols
    }
  }

  /**
   * mcrud function for creating a random uniform distribution weights matrix.
   * @param rows: number of rows
   * @param cols: number of cols
   * @return out: return created matrix
   */
  static Matrix mcrud(int rows, int cols) {
    // caling the Matrix random() to create a matrix of weights
    Matrix out = Matrix.random(rows, cols);
    return out;
  }
  /**
   * mmin function for finding min value in a matrix of values.
   * @param m: Matrix in which to find min
   * @return out: return max value
   */
  static double mmin(Matrix m) {
    double[][] a = m.getArray();
    double min = a[0][0];
    int rows = a.length;
    int cols = a[0].length;
    for (int r = 0; r<rows; r++) {
      for (int c = 0; c<cols; c++) {
        min = a[r][c]<min ? a[r][c] : min;
      }
    }
    return min;
  }
  /**
   * mmax function for finding max value in a matrix of values.
   * @param m: Matrix in which to find max
   * @return out: return max value
   */
  static double mmax(Matrix m) {
    double[][] a = m.getArray();
    double max = a[0][0];
    int rows = a.length;
    int cols = a[0].length;
    for (int r = 0; r<rows; r++) {
      for (int c = 0; c<cols; c++) {
        max = a[r][c]>max ? a[r][c] : max;
      }
    }
    return max;
  }
}
