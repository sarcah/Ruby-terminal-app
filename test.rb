require 'tty-prompt'

prompt = TTY::Prompt.new
greeting = 'What is the capital of Scotland?'
choices = %w(Edinburgh Glasgow)
answer = prompt.select(greeting, choices)
'do something' if answer == choices[0]