
require 'rspec'
require "../src/quiz_class.rb"


RSpec.describe Question do
    it { is_expected.to respond_to :answer }
    it { is_expected.to respond_to :prompt }
end

RSpec.describe "Question" do
    subject { Question.new }
    it "should respond to name" do
        expect(subject).to respond_to :answer
    end
end

