require 'tty-prompt'

prompt = TTY::Prompt.new
greeting = 'What is the capital of Scotland?'
choices = %w(Edinburgh Glasgow)
answer = prompt.select(greeting, choices)
'do something' if answer == choices[0]


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