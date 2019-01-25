import requests
import random
from collections import defaultdict


API_ENDPOINT = "https://api.urbandictionary.com/v0/random"
NORMAL = "abcdefghijklmnopqrstuvwxyz"
ENCODE = "48(D3F9#!JK1MN0PQR5+UVWXY2"


def clean_words(word_list):
    for lst in word_list:
        word = lst['word']
        word = "".join(char.lower() for char in word if char.isalpha())
        yield word


def get_words(word_list, num_words):
    return "".join(random.sample(list(word_list), num_words))


def encode_characters(word):
    letters = defaultdict()
    for char in set(word):
        if random.random() < 0.4:
            letters[char] = char.replace(NORMAL[NORMAL.index(char)], ENCODE[NORMAL.index(char)])
        else:
            letters[char] = char
    return letters


def generate_password(word, encoded_letters):
    word = list(word)
    for i in range(len(word)):
        word[i] = encoded_letters[word[i]]
    return "".join(word)


if __name__ == "__main__":
    import pyperclip
    
    
    res = requests.get(API_ENDPOINT)
    json = res.json()['list']
    words = get_words(clean_words(json), 2)
    passphrase = generate_password(words, encode_characters(words))
    # print(passphrase)
    pyperclip.copy(passphrase)
