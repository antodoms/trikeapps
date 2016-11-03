
module Trikeapps
  class Elixir

  	def initialize
  		@result=""
  	end

	  def stringreverse
	  	puts "Enter a string (For Rspec Tests use the string 't r i k e')"
	  	@result = %x[elixir lib/trikeapps/elixir_string_reverse.exs]
		  @result = @result.tr("\n","")
	  end

	  def getresult
	  	@result
	  end
	end
end
