import imp
from lib2to3.pgen2.token import OP
from statistics import mode
from time import time
from sqlalchemy import Interval, and_, asc, false, or_, not_, desc, asc, func, true
from sqlalchemy.orm import Session
from datetime import datetime, timedelta
from pathlib import Path
import sys
import math
import json
import random
import speech_recognition as sr
import pyttsx3
import difflib
from googletrans import Translator, constants
from pprint import pprint

# Initialize the recognizer
recognizer = sr.Recognizer()
translator = Translator()


from . import models, schemas
from .models import Gender


def get_user_by_name(db: Session, user_name: str):
    return db.query(models.User).filter(models.User.username == user_name).first()

def get_list_sentences_by_cefr_tags(db: Session, cefr_tags: str):
    return db.query(models.Sentences).filter(models.Sentences.cefr_tags == cefr_tags).all()

def get_list_sentences_by_domain_tags(db: Session, domain_tags: str):
    return db.query(models.Sentences).filter(models.Sentences.domain_tags == domain_tags).all()

def get_list_sentences_by_cefr_and_domain_tags(db: Session, cefr_tags: str, domain_tags: str):
    return db.query(models.Sentences).filter(and_(
        models.Sentences.cefr_tags == cefr_tags, models.Sentences.domain_tags == domain_tags)).all()

def get_sentence_by_id(db: Session, sentenceid: int):
    return db.query(models.Sentences).filter(models.Sentences.sentenceid == sentenceid).first()

def get_word_by_english(db: Session, english: str):
    return db.query(models.Word).filter(models.Word.english == english).all()

def get_word_by_vietnamese(db: Session, vietnamese: str):
    return db.query(models.Word).filter(models.Word.vietnamese == vietnamese).all()

def get_min_id_of_sentences(db: Session):
    #-------------------------------------
    return

def get_max_id_of_sentences(db: Session):
    #-------------------------------------
    return

def SpeakText(command):
	# Initialize the engine
	engine = pyttsx3.init()
	engine.say(command)
	engine.runAndWait()

def speech_to_en():
    with sr.Microphone() as source:
        recognizer.adjust_for_ambient_noise(source, duration=1)
        # Recording for 6 seconds
        print("recording")
        recorded_audio = recognizer.listen(source, timeout=6)
        print("Done recording")
    try:
        #Recognizing the text
        text = recognizer.recognize_google (
                recorded_audio, 
                language="en-US"
            )
        text = text.lower()
        print("Did you say ", text)
        return text
    except Exception as ex:
        print(ex)
        return None
    return None

def speech_to_vi():
    with sr.Microphone() as source:
        recognizer.adjust_for_ambient_noise(source, duration=1)
        # Recording for 6 seconds
        print("recording")
        recorded_audio = recognizer.listen(source, timeout=6)
        print("Done recording")
    try:
        #Recognizing the text
        text = recognizer.recognize_google (
                recorded_audio, 
                language="vi-VN"
            )
        text = text.lower()
        print("Did you say ", text)
        return text
    except Exception as ex:
        print(ex)
        return None
    return None

def compare_sentences(text1: str, text2: str):
    seq = difflib.SequenceMatcher(None,text1,text2)
    d = seq.ratio()
    return d

def test_en_to_vi(db: Session, sentenceid: int):
    sentence: models.Sentences = get_sentence_by_id(db, sentenceid)
    text = speech_to_vi()
    return compare_sentences(text.lower(), sentence.vietnamese.lower())

def test_vi_to_en(db: Session, sentenceid: int):
    sentence: models.Sentences = get_sentence_by_id(db, sentenceid)
    text = speech_to_en()
    return compare_sentences(text.lower(), sentence.english.lower())

def translate_text(text: str, lang: str):
    t = translator.translate(text, dest = lang)
    return t.text
    
    
        