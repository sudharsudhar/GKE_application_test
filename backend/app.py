# backend/app.py
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/data')
def get_data():
    return jsonify({'data': 'Hello from the backend!'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
