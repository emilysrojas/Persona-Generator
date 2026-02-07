import os

from dotenv import load_dotenv
from langchain_ollama.llms import OllamaLLM

load_dotenv()


def main():
    llm=OllamaLLM(model="llama3")
    response = llm("What type of person is more likely to buy a red laptop? Give me an age, gender, and a reason why.")
    print(response)


if __name__ == "__main__":
    main()
