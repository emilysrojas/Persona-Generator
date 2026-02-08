import os

from flask import Flask, jsonify, request
from flask_cors import CORS
import json
import re

from dotenv import load_dotenv
from langchain_ollama.llms import OllamaLLM

load_dotenv()

response=""

app=Flask(__name__)

CORS(app, resources={r"/*": {"origins": "*"}})




@app.route("/", methods=['GET', 'POST'])
def main():

    global response

    if(request.method=='POST'):
        product_data=request.data
        product_data=json.loads(product_data.decode('utf-8'))
        product_description=product_data['product_desc']
        print("received description: " + product_description)
        llm=OllamaLLM(model="llama3")
        response = llm(f'What type of person is more likely to buy {product_description}? Give 3 examples with a name, age, gender, and a 50-80 word description of the person buying the product and why they want to buy it. Return an array of personas in the following format: [{{"name": name1, "age": age1,  "description": description1}}, {{"name": name2, "age": age2,  "description": description2}}, {{"name": name3, "age": age3,  "description": description3}}], Return only valid JSON, no markdown formatting or text before or after the json.')
        response=response[response.index("["):]
        print(response)
        print(type(response))
        response=json.loads(response)
        # old=[{"name":"Emily", "description":"A baker blah blah blah blah blah blah blah"}, {"name":"Jennifer", "description":"she has a j*b blah blah blah blah blah blah blah"}, {"name":"Sam", "description":"A chef blah blah blah blah blah blah blah"}]

        print(str(type(response)))
        # print("old "+str(type(old)))

        return ""
    else:
        return jsonify(response)


if __name__ == "__main__":
    app.run(debug=True)
