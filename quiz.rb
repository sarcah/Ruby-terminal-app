require_relative "./questions.rb"
require "tty-prompt"
require "tty-link"
require "tty-box"

# Question class
class Question
    attr_accessor :prompt, :answer
    def initialize (prompt, answer)
        @prompt = prompt
        @answer = answer
    end
end

# Input name
pastel = Pastel.new
count = 0
begin
    count += 1
    puts pastel.cyan.bold("What's your name?")
    name = gets.chomp
    raise NameError, "Name cannot be empty" if name.empty?
rescue NameError => error 
    puts "Name cannot be empty"
    retry if count <3
    return
end

# Intro text
puts pastel.yellow ("\nHi #{name}! Let's see how well you know your Trump and Kayne.\n")
box = TTY::Box.frame "Tell me who tweeted the following.", "Type 'Trump' or 'Kanye' for each question", padding: 1, align: :center
puts box
puts pastel.yellow ("\nGet the spelling right, or you won't get the point!")



# Runs questions
questions = question_list

    def run_quiz (questions)
        pastel = Pastel.new
        answer = ""
        score = 0
        for question in questions 
            puts pastel.italic.bold (question.prompt)
            answer = gets.chomp().capitalize
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

# Gamble question
prompt = TTY::Prompt.new
greeting = ( "\nYour total score is " + score.to_s + ". Would you like to gamble?\nIf you're right, you'll double your points.\nIf you're wrong, you'll lose everything...\nSelect Yes or No" )
choices = %w(Yes No)
answer = prompt.select(greeting, choices)
    if answer == choices[0]
        puts "\nWho has more Twitter followers? Trump or Kanye?"
            answer_final = gets.chomp.capitalize
                if answer_final == "Trump"
                    puts "\nNope! He no longer has a Twitter account, remember?"
                    score = 0
                    puts pastel.magenta.bold "Your final score is 0"
                elsif answer_final == "Kanye"
                    puts "\nYep! Trump no longer has a Twitter account, so has no followers"
                    score = score * 2
                    puts pastel.magenta.bold ("Your final score is " + score.to_s )
                    puts "\n👋 Good gambling! Thanks for playing #{name}"
                else puts "\nThanks anyway #{name}!"
                end
    else puts "\n👋 Thanks for playing #{name}"
    end
    

puts "Credit for quiz:"
puts TTY::Link.link_to("CNN quiz", "https://edition.cnn.com/interactive/2016/02/politics/trump-kanye-who-tweeted/")

