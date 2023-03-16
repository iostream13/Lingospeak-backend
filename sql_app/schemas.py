from enum import Enum
from typing import List
from pydantic import BaseModel
from datetime import datetime, date

from .models import Gender

class UserCreate(BaseModel):
    userid: int
    username: str
    gender: Gender
    password: str
    birthday: date
    email: str 
    phone: str
    bio: str

    class Config:
        orm_mode = True       
        
class Sentences(BaseModel):
    sentenceid: int
    english: str 
    vietnamese: str 
    grade: int
    unit: int
    cefr_tags: str 
    domain_tags: str 
    
    class Config:
        orm_mode = True
    
class Word(BaseModel):
    wordid: int
    english: str 
    vietnamese: str 
    pronunciation: str 
    sound: str #???????
    usefrequency: str 
    tags: str 
    
    class Config:
        orm_mode = True
    
class Test(BaseModel):
    testid: int
    userid: int
    timestamp: datetime
    practicedphrases: str 
    score: float
    wordmissed: str 
    
    class Config:
        orm_mode = True
