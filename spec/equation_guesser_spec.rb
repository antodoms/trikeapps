require "spec_helper"
require "trikeapps"

RSpec::Matchers.define :be_boolean do
  match do |actual|
    expect(actual).to satisfy { |x| x == true || x == false }
  end
end

describe Trikeapps::EquationGuesser do

	before(:all) do
		@eq_small = Trikeapps::EquationGuesser.new([1,3],15)
		@eq_medium = Trikeapps::EquationGuesser.new([1,2,3,4],25)
		@eq_large = Trikeapps::EquationGuesser.new([1,2,3,4,5,6,7,8,9,10],5761)
		@guessed_list = ["1*2+3+4 = 9 (0)","1+2+3+4 = 10 (1)","1*2*3+4 = 10 (1)","1+2+3*4 = 24 (15)"]
  end

  describe 'increment_operator' do

    it 'returns a Boolean' do
    	expect(@eq_small.increment_operator).to be_boolean
    end

    it 'should return false when all operator combination is over' do
    	expect(@eq_small.increment_operator).to eq true
    	expect(@eq_small.increment_operator).to eq true
    	expect(@eq_small.increment_operator).to eq false
	  end

  end

  describe 'create_equation' do

  	it 'returns a string' do
    	expect(@eq_small.create_equation).to be_a String
    end

	  it 'should create the first equation 1+2+3+4' do
    	expect(@eq_medium.create_equation).to eq '1+2+3+4'
	  end

	  it 'update the equation after incrementing to ' do
	  	expect(@eq_medium.increment_operator).to eq true
    	expect(@eq_medium.create_equation).to eq '1*2+3+4'
	  end

  end

  describe 'evaluate_equation(equation)' do
  	it 'returns an Integer' do
    	expect(@eq_small.evaluate_equation(@eq_small.create_equation)).to be_a Integer
    end

    it 'should return 9 for 1*2+3+4 = 9' do
    	expect(@eq_medium.evaluate_equation(@eq_medium.create_equation)).to eq 9
	  end

  end

  describe 'guessed_string(equation, actual_result, expected_result)' do

  	it 'should return a String' do
  		expect(@eq_medium.guessed_string("1*2+3+4",9,9)).to be_a String
	  end

  	it 'should return 0 difference when difference between actual and expected value is 0' do
  		expect(@eq_medium.guessed_string("1*2+3+4",9,9)).to eq "1*2+3+4 = 9 (0)"
	  end

	  it 'should return 5 difference when difference between actual and expected value is 5' do
  		expect(@eq_medium.guessed_string("1*2+3+4",9,14)).to eq "1*2+3+4 = 9 (5)"
	  end
  end


  describe 'best_guess(guessed_list)' do

  	it 'should return a String' do
  		expect(@eq_medium.best_guess(@guessed_list)).to be_a String
	  end

  	it 'should return the best guess amoung the list -> for this case 1*2+3+4 = 9 (0)' do
  		expect(@eq_medium.best_guess(@guessed_list)).to eq "1*2+3+4 = 9 (0)"
	  end

  end

  describe 'guess(guesses)' do

  	it 'should return a String' do
  		expect(@eq_medium.guess(20)).to be_a String
	  end

  	it 'should return the best guess in the 20 guesses -> for this case 1*2+3+4 = 9 (0)' do
  		expect(@eq_medium.guess(20)).to eq "Guesses: 8 Best Guess: 1+2*3*4 = 25 (0)"
	  end

  end


end
