from flask import Flask
app = Flask(__name__)

@app.route("/")
def printxyz():
    return 'Hello testingg'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("3002"), debug=True)
