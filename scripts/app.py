import os

from flask import Flask, jsonify, request
from flask_cors import CORS
import json

from dotenv import load_dotenv
from langchain_ollama.llms import OllamaLLM

load_dotenv()
app=Flask(__name__)

CORS(app, resources={r"/*": {"origins": "*"}})


@app.route("/", methods=['GET', 'POST'])
def main():
    # if(request.method=='POST'):
    #     product_data=request.data
    #     product_date=json.loads(product_data)
    #     product_description=product_date['product']
    #     llm=OllamaLLM(model="llama3")
    #     response = llm(f"What type of person is more likely to buy {product_description}? Give me a name, age, gender, and a 50-80 word description of the person buying the product. Return in a json format, with no extra text.")
    #     return ""
    # else:
    response={"name":"Emily"}
    return jsonify(response)


if __name__ == "__main__":
    app.run(debug=True)
