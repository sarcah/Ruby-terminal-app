require "tty-prompt"


class Question
    attr_accessor :prompt, :answer
    def initialize (prompt, answer)
        @prompt = prompt
        @answer = answer
    end
end

p1 = "\n'I have never seen a thin person drinking Diet Coke.' Who said it? \n\nTrump       Kanye"
p2 = "\n'For anyone that has money they know the first rule is to use other people's money.' Who said it? \nTrump       Kanye"

questions = [
    Question.new(p1, "Trump"),
    Question.new(p2, "Kanye")
]

pastel = Pastel.new

puts pastel.cyan("What's your name?")
answer = gets.chomp
puts pastel.yellow ("\nHi #{answer}! Let's see how well you know your Trump and Kayne.\n")
puts pastel.yellow.bold ("Tell me who tweeted the following.\n")

def run_quiz (questions)
    pastel = Pastel.new
    answer = ""
    score = 0
    for question in questions 
        puts question.prompt
        answer = gets.chomp()
        if answer == question.answer
            score += 1
        puts pastel.green ("Correct! Your score is #{score}")
        else 
            puts pastel.red ("Nope! Sorry")
        end
end


# prompt = TTY::Prompt.new
# greeting = 'What is the capital of Scotland?'
# choices = %w(Edinburgh Glasgow)
# answer = prompt.select(greeting, choices)
# 'do something' if answer == choices[0]
# end
    
# Final score    
puts ( "\nThat's the end of the quiz questions. You got " + score.to_s + "/" + questions.length().to_s )
    if score > questions.length / 2
        puts "😄Great!😄"
    elsif score == 0
        puts "Dude.." 
    else
        puts "Keep working on it." 
    end
end



run_quiz (questions)