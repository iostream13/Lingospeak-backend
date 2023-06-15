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
import re
from googletrans import Translator, constants
from pprint import pprint

# Initialize the recognizer
recognizer = sr.Recognizer()
translator = Translator()


from . import models, schemas
from .models import Gender

def create_user(db: Session, user: schemas.UserCreate):
    bio = ""
    if user.bio is not None:
        bio = user.bio
    birthday = ""
    if user.birthday is not None:
        birthday = user.birthday
    email = ""
    if user.email is not None:
        email = user.email
    phone = ""
    if user.phone is not None:
        phone = user.phone
    db_user = models.User(username=user.username,
                          password=user.password, gender=user.gender, birthday=birthday, email=email, phone=phone, bio=bio)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

def update_user(db: Session, user: schemas.UserCreate):
    password = ""
    if user.password is not None:
        password = user.password
    gender = ""
    if user.gender is not None:
        gender = user.gender
    bio = ""
    if user.bio is not None:
        bio = user.bio
    birthday = ""
    if user.birthday is not None:
        birthday = user.birthday
    email = ""
    if user.email is not None:
        email = user.email
    phone = ""
    if user.phone is not None:
        phone = user.phone
    db_user = models.User(username=user.username,
                          password=password, gender=gender, birthday=birthday, email=email, phone=phone, bio=bio)
    db.query(models.User).filter(models.User.username == user.username).update({"password": password, "gender": gender, 
                                                                                "birthday": birthday, "email": email, "phone": phone, "bio": bio})
    db.commit()
    return db_user

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

def SpeakText(command, lang: str):
    engine = pyttsx3.init()
    engine.setProperty('voice', lang)
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
        if text is None:
            return None
        text = text.lower()
        print("Did you say ", text)
        return text
    except Exception as ex:
        print(ex)
        return None
    return None

def compare_sentences(text1: str, text2: str):
    seq = difflib.SequenceMatcher(None,text1,text2)
    d = 0.1
    d = seq.ratio()
    return d

def test_en(db: Session, sentenceid: int, text: str):
    sentence: models.Sentences = get_sentence_by_id(db, sentenceid)
    text1 = re.sub(r'[,.]', '', text)
    text2 = re.sub(r'[,.]', '', sentence.english)
    word1 = text1.lower().split(" ")
    word2 = text2.lower().split(" ")
    words = []
    for i in range(min(len(word1), len(word2))):
        if word1[i] == word2[i]:
            words.append(0)
        else:
            words.append(1)
    if len(word1) < len(word2):
        for i in range(len(word1), len(word2)):
            words.append(1)
    else:
        for i in range(len(word2), len(word1)):
            words.append(1)
    score = compare_sentences(text1.lower(), text2.lower())
    data = {'origin content': sentence.english, 'text': text, 'words': words, 'score': score}
    return data

def translate_text(text: str, lang: str):
    t = translator.translate(text, dest = lang)
    return t.text
    
def save_test_of_user(db: Session, test: schemas.Test):
    now = datetime.utcnow()
    db_order = models.Test(userid = test.userid, timestamp = now, practicedphrases = test.practicedphrases,
                                   score = test.score, wordmissed = test.wordmissed)
    db.add(db_order)
    db.commit()
    return db_order

def get_history_of_user(db: Session, userid: int):
    return db.query(models.Test).filter(models.Test.userid == userid).order_by(desc(models.Test.timestamp)).all()

def add_sentences(db: Session, sentence: schemas.Sentences):
    grade = ""
    if sentence.grade is not None:
        grade = sentence.grade
    unit = ""
    if sentence.unit is not None:
        unit = sentence.unit
    cefr_tags = ""
    if sentence.cefr_tags is not None:
        cefr_tags = sentence.cefr_tags
    domain_tags = ""
    if sentence.domain_tags is not None:
        domain_tags = sentence.domain_tags
    db_sentence = models.Sentences(english = sentence.english, vietnamese = sentence.vietnamese,
                          grade = grade, unit = unit, cefr_tags = cefr_tags, domain_tags = domain_tags)
    db.add(db_sentence)
    db.commit()
    db.refresh(db_sentence)
    return db_sentence

def add_word(db: Session, word: schemas.Word):
    usefrequency = ""
    if word.usefrequency is not None:
        usefrequency = word.usefrequency
    tags = ""
    if word.tags is not None:
        tags = word.tags
    sound = ""
    if word.sound is not None:
        sound = word.sound
    db_word = models.Word(english = word.english, vietnamese = word.vietnamese, pronunciation = word.pronunciation,
                          sound = sound, usefrequency = usefrequency, tags = tags)
    db.add(db_word)
    db.commit()
    db.refresh(db_word)
    return db_word
