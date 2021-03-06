import pyttsx3 
import speech_recognition as sr 
import datetime
import webbrowser
import os
import random

engine = pyttsx3.init('sapi5')
voices = engine.getProperty('voices')
engine.setProperty('voice', voices[1].id)


def speak(audio):
    engine.say(audio)
    engine.runAndWait()


def wishMe():
    hour = int(datetime.datetime.now().hour)
    if hour>=0 and hour<12:
        speak("Good Morning! ")

    elif hour>=12 and hour<17:
        speak("Good Afternoon! ")

    elif hour>=17 and hour<19 :
        speak("Good Evening! ")

    else:
        speak("Good Night! ")

    speak("I am your  Vertual  Assistant Annie. Please tell me how may I help you")

def takeCommand():

    rr = sr.Recognizer()
    with sr.Microphone() as source:
        print("Listening...")
        rr.pause_threshold = 1
        audio = rr.listen(source)

    try:
        print("Recognizing...")
        query = rr.recognize_google(audio, language='en-in')
        print(f"User said: {query}\n")

    except Exception as e:
        print("Say that again please...")
        speak("Connection error")
        speak("I can't understand what are you saying....")
        return "None"
    return query


if __name__ == "__main__":
    wishMe()
    while True:
        query = takeCommand().lower()
        if "hello" in query or "hello Annie" in query:
            wish = "Hello ! How May i Help you.."
            print(wish)
            speak(wish)

        elif "who are you" in query or "about you" in query or "your details" in query:
            who_are_you = "I am Annie an A I based computer program but i can help you lot like a your assistant ! try me to give simple command !"
            print(who_are_you)
            speak(who_are_you)

        elif 'who make you' in query or 'who made you' in query or 'who created you' in query or 'who develop you' in query:
            speak(" For your information Nilesh Gopale Created me !    I can show you his Linked In profile if you want to see.    ok or no .....")
            ans_from_user_who_made_you = takeCommand()
            if 'yes' in ans_from_user_who_made_you or 'ok' in ans_from_user_who_made_you or 'yeah' in ans_from_user_who_made_you:
                webbrowser.open("http://linkedin.com/in/nilesh-gopale-aa6760195")
                speak('opening his profile...... please wait')

            elif 'no' in ans_from_user_who_made_you or 'no thanks' in ans_from_user_who_made_you or 'not' in ans_from_user_who_made_you:
                speak("All right ! OK...")
            else :
                speak("I can't understand. Please say that again !")
            
            
        elif (("run" in query) or  ("execute" in query) or ("open" in query)) and  (("notepad" in query) or ("editor" in query) ) :
            os.system("notepad")
            speak("opening notepad")
            
        elif (("run" in query) or  ("play" in query) or ("open" in query)) and  (("player" in query) or ("music player" in query) ) :
            os.system("wmplayer")
            speak("opening music player")
            
            
        elif (("run" in query) or  ("execute" in query) or ("open" in query)) and  (("paint" in query) or ("draw" in query) ) :
            os.system("mspaint")
            speak("opening paint")
            
        elif (("run" in query) or  ("execute" in query) or ("open" in query)) and  (("putty" in query) or ("connect" in query) ) :
            os.system("putty")
            speak("opening putty")

        elif 'open github' in query or 'start  my github' in query or 'show my github' in query or 'show me github' in query or 'login my github' in query or 'login github' in query:
            webbrowser.open("https://www.github.com")
            speak("opening github please wait!")

        elif 'login my facebook' in query or 'start my facebook' in query or 'show me facebook' in query or 'show my facebook' in query or 'run my facebook' in query :
            webbrowser.open("https://www.facebook.com")
            speak("opening facebook please wait")

        elif 'open instagram' in query or 'start my instagram' in query or 'run my inatagram' in query or 'show my instagram' in query or 'open my instagram' in query:
            webbrowser.open("https://www.instagram.com")
            speak("opening instagram please wait")   

        elif 'open google' in query or 'hey google' in query or 'hello google' in query or 'google' in query :
            webbrowser.open("google.com")
            speak("opening google please wait")
            
        elif 'login my gmail' in query or 'open my gmail' in query or 'show my mails' in query or 'start my gmail' in query:
            webbrowser.open("https://mail.google.com")
            speak("opening google mail pleae wait") 
              
             
        elif 'open amazon' in query or 'start amazon' in query or 'run amazon' in query or 'show amazon' in query:
            webbrowser.open("https://www.amazon.com")
            speak("opening amazon please wait")
            
        elif 'open code' in query or 'open compiler' in query or 'show me compiler' in query or 'open code compiler' in query :
            os.system("Code.exe")
            speak("opening code please wait")

        

        elif 'good bye' in query or 'bye' in query or 'ok see you again' in query :
            speak("good bye")
            exit()
            break



        elif "your name" in query or "sweat name" in query or 'what is your name' in query:
            s = "Thanks for Asking my self ! Annie"
            print(s)
            speak(s)

        elif "you feeling" in query:
            print("feeling Very happy to help you")
            speak("feeling Very happy to help you")

        elif query == 'none':
            continue

        elif 'exit' in query or 'stop' in query or 'quit' in query or 'shutdown' in query or 'end' in query :
            ex = 'See you soon. Bye'
            speak(ex)
            exit()
            break

        elif 'how are you' in query:
            setMsgs = ['Just doing my thing!', 'I am fine!', 'Nice!']
            ans_qus = random.choice(setMsgs)
            speak(ans_qus)
            speak(" How are you'")
            ans_from_user_how_are_you = takeCommand()
            if 'fine' in ans_from_user_how_are_you or 'happy' in ans_from_user_how_are_you or 'okey' in ans_from_user_how_are_you or 'Great' in ans_from_user_how_are_you:
                speak('Great')  
            elif 'not' in ans_from_user_how_are_you or 'sad' in ans_from_user_how_are_you or 'upset' in ans_from_user_how_are_you or 'bad' in ans_from_user_how_are_you:
                speak('Tell me how can i make you happy')
            else :
                speak("I can't understand. Please say that again !")

        else:
            temp = query.replace(' ','+')
            url="https://www.google.com/search?q="    
            res_ = 'please wait i search from internet to give your answer !'
            print(res)
            speak(res)
            webbrowser.open(url+temp)
