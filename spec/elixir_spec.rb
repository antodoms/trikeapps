require "spec_helper"
require "trikeapps"

describe Trikeapps::Elixir do

	before(:all) do
		@elixir = Trikeapps::Elixir.new
  end

  describe 'run' do

    it 'Accepts STDIN and we put "t r i k e" it returns "e k i r t"' do
    	expect(@elixir.stringreverse).to eq 'e k i r t'
    end

    it ' returns the reversed string data' do
			expect(@elixir.getresult).to eq 'e k i r t'
    end


  end


end
