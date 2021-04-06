require "tty-prompt"
require_relative "./questions.rb"

# Question class
class Question
    attr_accessor :prompt, :answer
    def initialize (prompt, answer)
        @prompt = prompt
        @answer = answer
    end
end

# Intro text
pastel = Pastel.new

puts pastel.cyan.bold("What's your name?")
name = gets.chomp
puts pastel.yellow.bold ("\nHi #{name}! Let's see how well you know your Trump and Kayne.\n")
puts pastel.yellow.bold ("Tell me who tweeted the following.\nType 'Trump' or 'Kanye' for each question.\n")



# Runs questions
questions = question_list


    def run_quiz (questions)
        pastel = Pastel.new
        answer = ""
        score = 0
        for question in questions 
            puts pastel.italic (question.prompt)
            answer = gets.chomp()
            if answer == question.answer
                score += 1
            puts pastel.green ("Correct! Your score is #{score}")
            else 
                puts pastel.red ("Nope! Sorry")
            end
        end
        score
    end

score = run_quiz (questions)
    
# Total score question  
pastel = Pastel.new
puts pastel.magenta.bold( "\nThat's the end of the quiz questions. You got " + score.to_s + "/" + questions.length().to_s )
    if score > questions.length / 2
        puts "Great! 👏"
    elsif score == 0
        puts "Dude... 😳" 
    else
        puts "Keep working on it 👍" 
    end

    # gamble question
    puts ( "\nYour total score is " + score.to_s + ". Would you like to gamble these points?\nIf you're right, you'll double your points.\nIf you're wrong, you'll lose everything...\nType Yes or No" )
    answer_gamble = gets.chomp
    if answer_gamble == "Yes"
        puts "\nWho has more Twitter followers? Trump or Kanye?"
        answer_final = gets.chomp
            if answer_final == "Trump"
                puts "\nNope! He no longer has a Twitter account, remember?"
                score = 0
                puts pastel.magenta.bold "Your final score is 0"
            elsif answer_final == "Kanye"
                puts "\nYep! Trump no longer has a Twitter account, so has no followers"
                score = score * 2
                puts pastel.magenta.bold ("Your final score is " + score.to_s )
                puts "\n👋 Good gambling! Thanks for playing #{name}"
                # put error message in here?
            end
    else puts "\n👋 Thanks for playing #{name}\n"
    end




# prompt = TTY::Prompt.new
# greeting = 'What is the capital of Scotland?'
# choices = %w(Edinburgh Glasgow)
# answer = prompt.select(greeting, choices)
# 'do something' if answer == choices[0]



# Credit for quiz: https://edition.cnn.com/interactive/2016/02/politics/trump-kanye-who-tweeted/
# accessed 6th April 2021, author is CNN.