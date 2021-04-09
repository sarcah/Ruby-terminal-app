require 'rspec'
# require_relative "../quiz_class.rb"
require "../quiz_class.rb"

# describe "test" do
#     it 'should print test' do
#         expect test.to eq "Hello World"
#     end
# end

RSpec.describe Question do
    it { is_expected.to respond_to :answer }
    it { is_expected.to respond_to :prompt }
end

RSpec.describe "Question" do
    subject { Question.new }
    it "should respond to name" do
        expect(subject).to respond_to :name
    end
end