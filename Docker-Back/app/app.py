from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Flask rodando dentro do Docker!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
