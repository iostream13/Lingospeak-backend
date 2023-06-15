
from pydub import AudioSegment
import speech_recognition as sr

import pyttsx3

def split_audio_and_transcribe(audio_file_path, chunk_duration_ms):
    res = ""
    audio = AudioSegment.from_file(audio_file_path)
    total_duration = len(audio)
    start_time = 0
    end_time = chunk_duration_ms

    while end_time <= total_duration:
        chunk = audio[start_time:end_time]
        chunk.export("temp.wav", format="wav")

        recognizer = sr.Recognizer()
        try:
            with sr.AudioFile("temp.wav") as source:
                audio_data = recognizer.record(source)
                text = recognizer.recognize_google(audio_data)
                res = res + " " + text
        except sr.UnknownValueError:
            pass

        start_time = end_time
        end_time += chunk_duration_ms

    # Xử lý phần cuối cùng có thời lượng khác chunk_duration_ms nếu cần thiết
    if start_time < total_duration:
        chunk = audio[start_time:]
        chunk.export("temp.wav", format="wav")

        recognizer = sr.Recognizer()
        try:
            with sr.AudioFile("temp.wav") as source:
                audio_data = recognizer.record(source)
                text = recognizer.recognize_google(audio_data)
                res = res + " " + text
        except sr.UnknownValueError:
            pass
    return res
audio_file_path = "ls.mp3"
chunk_duration_ms = 10000
print(split_audio_and_transcribe(audio_file_path, chunk_duration_ms))


