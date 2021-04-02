
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

puts "What's your name?"
answer = gets.chomp
puts "\nHi #{answer}! Let's see how well you know your Trump and Kayne.\nTell me who tweeted the following.\n"

def run_quiz (questions)
    answer = ""
    score = 0
    for question in questions 
        puts question.prompt
        answer = gets.chomp()
        if answer == question.answer
            score += 1
        puts "Correct! Your score is #{score}"
        else 
            puts "Nope! Sorry"
        end
        
    end
    puts ( "\nThat's the end of the quiz questions. You got " + score.to_s + "/" + questions.length().to_s )
    if score > questions.length / 2
        puts "Great!"
    elsif score > questions.length / 4
        puts "Terrible!"
    elsif score == 0
        puts "Dude.." 
    else
        puts "Keep working on it." 
    end
end

run_quiz (questions)