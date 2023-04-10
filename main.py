import email
import imp
from lib2to3.pgen2 import token
from random import random
from telnetlib import STATUS
from typing import List

from fastapi import Depends, FastAPI, Query, Body, status, Form, HTTPException, Request
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Optional, Set
from pydantic import BaseModel, Field
from fastapi.responses import JSONResponse, PlainTextResponse
from starlette.exceptions import HTTPException as StarletteHTTPException
from sqlalchemy.orm import Session
from typing import Annotated
from pydub import AudioSegment
import speech_recognition as sr

from sql_app import crud, models, schemas
from sql_app.database import SessionLocal, engine 
from sql_app.models import Gender

import speech_recognition as sr
import pyttsx3

# Initialize the recognizer
r = sr.Recognizer()

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=['*'],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
        
@app.get("/")
def show():
    return "hello"

@app.get("/usercreate/", response_model=schemas.UserCreate)
def create_user(user: schemas.UserCreate, db: Session = Depends(get_db)):
    db_user = crud.get_user_by_name(db, user_name=user.username)
    if db_user:
        raise HTTPException(status_code=400, detail="username already registered")
    return crud.create_user(db, user)

@app.get("/user/{user_name}")
def read_user(user_name: str, db: Session = Depends(get_db)):
    user = crud.get_user_by_name(db, user_name)
    if user is None:
        raise HTTPException(status_code=404, detail="user not found")
    return user

@app.get("/update_user/", status_code=status.HTTP_201_CREATED)
def update(user: schemas.UserCreate, db: Session = Depends(get_db)):
    if crud.get_user_by_name(db, user.username) is None:
        raise HTTPException(status_code=404, detail="user not found")
        return None
    user_update = crud.update_user(db, user)
    return user_update

@app.get("/sentence/{sentenceid}")
def sentence_by_id(sentenceid: int, db: Session = Depends(get_db)):
    sentence = crud.get_sentence_by_id(db, sentenceid)
    if sentence is None:
        raise HTTPException(status_code=404, detail="sentence not found")
    return sentence

@app.get("/sentences/cefr_tags/")
def sentences_by_cefr_tags(cefr_tags: str, db: Session = Depends(get_db)):
    sentences = crud.get_list_sentences_by_cefr_tags(db, cefr_tags)
    if sentences is None:
        raise HTTPException(status_code=404, detail="cefr tags not found")
    return sentences

@app.get("/sentences/domain_tags/")
def sentences_by_domain_tags(domain_tags: str, db: Session = Depends(get_db)):
    sentences = crud.get_list_sentences_by_domain_tags(db, domain_tags)
    if sentences is None:
        raise HTTPException(status_code=404, detail="domain tags not found")
    return sentences

@app.get("/sentences/tags/")
def sentences_by_cefr_and_domain_tags(cefr_tags: str, domain_tags: str, db: Session = Depends(get_db)):
    sentences = crud.get_list_sentences_by_cefr_and_domain_tags(db, cefr_tags, domain_tags)
    if sentences is None:
        raise HTTPException(status_code=404, detail="tags not found")
    return sentences

@app.get("/word/en/")
def word_by_en(english: str, db: Session = Depends(get_db)):
    word = crud.get_word_by_english(db, english)
    if word is None:
        raise HTTPException(status_code=404, detail="word not found")
    return word

@app.get("/word/vi/")
def word_by_vi(vietnamese: str, db: Session = Depends(get_db)):
    word = crud.get_word_by_vietnamese(db, vietnamese)
    if word is None:
        raise HTTPException(status_code=404, detail="word not found")
    return word

@app.get("/say/")
def say_sth():
    text = crud.speech_to_en()
    if text is None:
        raise HTTPException(status_code=404, detail="voice is Null")
    return text

@app.get("/test/en/{sentenceid}")
def test_en(sentenceid: int, db: Session = Depends(get_db)):
    sentence = crud.get_sentence_by_id(db, sentenceid)
    if sentence is None:
        raise HTTPException(status_code=404, detail="sentence not found")
    text = crud.speech_to_en()
    if text is None:
        raise HTTPException(status_code=404, detail="voice is Null")
    return crud.test_en(db, sentenceid, text)

@app.get("/speak/")
def speak(text: str, lang: str):
    crud.SpeakText(text, lang)
    return "ok"

@app.get("/translate/")
def trans(text: str, lang: str):
    return crud.translate_text(text, lang)

@app.get("/save_test/")
def save_test(test: schemas.Test, db: Session = Depends(get_db)):
    return crud.save_test_of_user(db, test)

@app.get("/history/{userid}")
def save_test(userid: int, db: Session = Depends(get_db)):
    return crud.get_history_of_user(db, userid)

@app.get("/sentencecreate/", response_model=schemas.Sentences)
def create_sentence(sentence: schemas.Sentences, db: Session = Depends(get_db)):
    return crud.add_sentences(db, sentence)

@app.get("/wordcreate/", response_model=schemas.Word)
def create_word(word: schemas.Word, db: Session = Depends(get_db)):
    return crud.add_word(db, word)

# @app.post("/file/")
# async def convert_audio_to_text(file: UploadFile):
#     audio = AudioSegment.from_file(file.file, format=file.filename.split(".")[-1])
#     audio.export("temp.wav", format="wav")
#     recognizer = sr.Recognizer()
#     with sr.AudioFile("temp.wav") as source:
#         audio_data = recognizer.record(source)
#         text = recognizer.recognize_google(audio_data)
#     return {"text": text}
