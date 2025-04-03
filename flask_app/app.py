from flask import Flask
import numpy as np

def compute_fibonacci(n):
    fib = [0, 1]
    for i in range(2, n):
        fib.append(fib[-1] + fib[-2])
    return fib[-1]

def matrix_multiplication(size):
    A = np.random.rand(size, size)
    B = np.random.rand(size, size)
    result = np.dot(A, B)
    return result[0][0]  # Returning a single value from the matrix

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello World from Yashraj"

@app.route('/compute')
def compute():
    fib_result = compute_fibonacci(10000)
    matrix_result = matrix_multiplication(100)
    
    return f"""
    Fibonacci(10,000) = {fib_result} <br>
    Matrix Multiplication (First Value) = {matrix_result}
    """

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
