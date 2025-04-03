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
    return np.dot(A, B)

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello World from [Your Name]"

@app.route('/compute')
def compute():
    fib_result = compute_fibonacci(10000)
    matrix_result = matrix_multiplication(100)
    return "Computation Complete"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
