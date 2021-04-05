require "tty-prompt"

# Question class
class Question
    attr_accessor :prompt, :answer
    def initialize (prompt, answer)
        @prompt = prompt
        @answer = answer
    end
end

# Question list
p1 = "\n'I have never seen a thin person drinking Diet Coke.' Who said it? \n\nTrump       Kanye"
p2 = "\n'For anyone that has money they know the first rule is to use other people's money.' Who said it? \nTrump       Kanye"

questions = [
    Question.new(p1, "Trump"),
    Question.new(p2, "Kanye")
]

# Intro text
pastel = Pastel.new

puts pastel.cyan("What's your name?")
name = gets.chomp
puts pastel.yellow ("\nHi #{name}! Let's see how well you know your Trump and Kayne.\n")
puts pastel.yellow.bold ("Tell me who tweeted the following.\n")

# Runs questions
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

    
# Total score question  
pastel = Pastel.new
puts pastel.magenta( "\nThat's the end of the quiz questions. You got " + score.to_s + "/" + questions.length().to_s )
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
                puts "Thanks for playing #{name}"
                # put error message in here?
            end
    else puts "👋 Thanks for playing #{name}"
    end
end

prompt = TTY::Prompt.new
greeting = 'What is the capital of Scotland?'
choices = %w(Edinburgh Glasgow)
answer = prompt.select(greeting, choices)
'do something' if answer == choices[0]
end


run_quiz (questions)



