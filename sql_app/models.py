from datetime import date
from operator import index
from sqlalchemy import Boolean, Column, Float, ForeignKey, Integer, String, column, true, Enum, DateTime, Date
from sqlalchemy.orm import relationship
import enum

from .database import Base

class Gender(str, enum.Enum):
    MALE = "MALE"
    FEMALE = "FEMALE"
    
class User(Base):
    __tablename__ = "user"
    
    userid = Column(Integer, primary_key = True, index = True)
    username = Column(String(50))
    password = Column(String(100))
    gender = Column(Enum(Gender))
    birthday = Column(Date)
    email = Column(String(100))
    phone = Column(String(15))
    bio = Column(String(500))
    
class Sentences(Base):
    __tablename__ = "sentences"
    
    sentenceid = Column(Integer, primary_key = True, index = True)
    english = Column(String(1000))
    vietnamese = Column(String(1000))
    grade = Column(Integer)
    unit = Column(Integer)
    cefr_tags = Column(String(500))
    domain_tags = Column(String(500))
    
class Word(Base):
    __tablename__ = "word"
    
    wordid = Column(Integer, primary_key = True, index = True)
    english = Column(String(500))
    vietnamese = Column(String(500))
    pronunciation = Column(String(500))
    usefrequency = Column(String(500))
    tags = Column(String(500))
    
    
class Test(Base):
    __tablename__ = "test"
    
    testid = Column(Integer, primary_key = True, index = True)
    userid = Column(Integer, ForeignKey("user.userid"))
    timestamp = Column(DateTime)
    practicedphrases = Column(String(1000))
    score = Column(Float)
    wordmissed = Column(String(1000))
    
    
