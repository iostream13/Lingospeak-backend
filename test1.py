
from pydub import AudioSegment
import speech_recognition as sr

import pyttsx3

# Initialize the recognizer
r = sr.Recognizer()
def print_file_content(file_path):
    audio = AudioSegment.from_file(file_path, format=file_path.split(".")[-1])
    audio.export("temp.wav", format="wav")
    recognizer = sr.Recognizer()
    with sr.AudioFile("temp.wav") as source:
        audio_data = recognizer.record(source)
        text = recognizer.recognize_google(audio_data)
        print(text)
            
file_path = "ls.mp3"
print_file_content(file_path)