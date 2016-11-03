require "spec_helper"
require "trikeapps"

describe Trikeapps::EquationGuesser do

	before(:all) do
		@elixir = Trikeapps::Elixir.new
  end

  describe 'run' do

    it 'Accepts STDIN and we put "j o e" it returns "t r i k e"' do
    	expect(@elixir.stringreverse).to eq 'e k i r t'
    end

    it ' returns the reversed string data' do
			expect(@elixir.getresult).to eq 'e k i r t'
    end


  end


end
