import base64
import email
import imp
from lib2to3.pgen2 import token
from random import random
from telnetlib import STATUS

from fastapi import Depends, FastAPI, Query, Body, status, Form, HTTPException, Request, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Optional, Set
from pydantic import BaseModel, Field
from fastapi.responses import JSONResponse, PlainTextResponse
from starlette.exceptions import HTTPException as StarletteHTTPException
from sqlalchemy.orm import Session
from pydub import AudioSegment
import speech_recognition as sr
import io
import pydub
import wave

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

@app.post("/usercreate/", response_model=schemas.UserCreate)
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

@app.post("/update_user/", status_code=status.HTTP_201_CREATED)
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

@app.post("/test/en/{sentenceid}")
async def test_en(sentenceid: int, base64_data: str, db: Session = Depends(get_db)):
    sentence = crud.get_sentence_by_id(db, sentenceid)
    if sentence is None:
        raise HTTPException(status_code=404, detail="sentence not found")
    # audio = AudioSegment.from_file(file.file, format=file.filename.split(".")[-1])
    # audio.export("temp.wav", format="wav")
    # recognizer = sr.Recognizer()
    # with sr.AudioFile("temp.wav") as source:
    #     audio_data = recognizer.record(source)
    #     text = recognizer.recognize_google(audio_data)
    base64_data = base64_data.replace("\n", "").replace(" ", "")
    
    # Kiểm tra số lượng ký tự dữ liệu
    num_chars = len(base64_data)
    remainder = num_chars % 4
    
    if remainder == 1:
        # Nếu số lượng ký tự dữ liệu là 1 lớn hơn bội số của 4, hãy thêm padding
        base64_data += "==="  # Thêm 3 ký tự padding
    elif remainder == 2:
        # Nếu số lượng ký tự dữ liệu là 2 lớn hơn bội số của 4, hãy thêm padding
        base64_data += "=="   # Thêm 2 ký tự padding
    elif remainder == 3:
        # Nếu số lượng ký tự dữ liệu là 3 lớn hơn bội số của 4, hãy thêm padding
        base64_data += "="    # Thêm 1 ký tự padding
    
    audio_data = base64.b64decode(base64_data)

    with wave.open("audio.wav", "wb") as wav_file:
        wav_file.setnchannels(1)  # Số kênh âm thanh (1 cho âm thanh đơn kênh, 2 cho âm thanh stereo)
        wav_file.setsampwidth(2)  # Kích thước mẫu âm thanh (2 byte cho âm thanh 16-bit)
        wav_file.setframerate(16000)  # Tần số mẫu âm thanh (16000 mẫu/giây cho giọng nói)
        wav_file.writeframes(audio_data)

    audio_file = "audio.wav"
    # Use the wav file with speech recognition
    r = sr.Recognizer()
    with sr.AudioFile(audio_file) as source:
        audio = r.record(source)
    try:
        text = r.recognize_google(audio)
        if text == "practice" or text == "finish" or text == "next" or text == "test" or text == "british" or text == "pines":
            return {'origin content': "", 'text': text, 'words': "", 'score': ""}
        return crud.test_en(db, sentenceid, text)
    except Exception as e:
        return {"error": str(e)}


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

