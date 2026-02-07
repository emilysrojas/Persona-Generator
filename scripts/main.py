import os

from dotenv import load_dotenv
from langchain_ollama.llms import OllamaLLM

load_dotenv()


def main():
    llm=OllamaLLM(model="llama3")
    product=input("What product are you trying to sell? ")
    price=input("What is the price range of the product? ")
    response = llm(f"What type of person is more likely to buy a {product} in the price range of {price}? Give me a name, age, gender, and a 50-80 word description of the person buying the product. Return in a json format, with no extra text.")
    print(response)


if __name__ == "__main__":
    main()
