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