require 'pry'

module Trikeapps
  class StringDemystifier

    #Default constructor taking the string that is entered
    def initialize(str)
      @word = str
    end

    def demystify
      #binding.pry
      str = rule1
      #binding.pry  
      str = rule2(str)
      #binding.pry
      str = rule3(str)
    end


    # If a character has the same character to its left and right, it should be replaced with that other character (i.e. AWA becomes AAA) unless the surrounding character is a space
    def rule1(str = @word)
      newstr = str.chars
      newstr.each_index do |index|
        if newstr[index-1].eql?newstr[index+1]
          newstr[index]=newstr[index-1] unless newstr[index].eql?(" ") || newstr[index-1].eql?(" ") || newstr[index+1].eql?(" ")
        end
      end
      newstr.join('').to_s.squeeze(" ")
    end

    # Any sequence of six characters should be replaced with a single character, i.e. AAAAAA becomes A
    def rule2(str = @word)
      newstr = str.chars
      newstr.each_index do |index|
        if (newstr[index..index+5].uniq.length==1)
          newstr[index..index+5] = newstr[index]
        end
      end
      newstr.join('').to_s.squeeze(" ")
    end

    # Any instance of the exclamation mark (!) character causes the string to be reversed, and the exclamation mark character removed
    def rule3(str = @word)
      newstr = str.chars

      reverse = false
      output = ''

      newstr.each do |char|
        if char == '!'
            reverse = !reverse
        else
            output << char
        end
      end

      output.reverse! unless !reverse
      output.to_s.squeeze(" ")
    end

  end
end
