import os


def addToClipBoard(text):
    command = 'echo %r | xclip -selection clipboard' % text
    os.system(command)
