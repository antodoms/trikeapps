require 'pry'

module Trikeapps
  class EquationGuesser

    def initialize(list, result)
      @operands = list
      @expected_result = result

      @operator_value = Array.new(list.size) { |e| 0}
      @operator_increment_completed = false
      @operators = ["+","*"]
    end

    #this increments the operator combination also making it unique
    def increment_operator
      incremented = false
      i = 0
      while (incremented == false && i<(@operator_value.size) && @operator_increment_completed==false)
        if @operator_value[i] < (@operators.size-1)
          @operator_value[i] += 1
          incremented = true
        else
          @operator_value[i] = 0
          i+=1
        end
      end
      incremented
    end

    #this generates a new equation based on the newly incremented operator list
    def create_equation
      equation =''
      for i in 0..(@operands.size-1)
        if i==0
          equation << @operands[i].to_s
        else
          #binding.pry
          equation << @operators[@operator_value[i-1]].to_s
          equation << @operands[i].to_s
        end
      end
      equation
    end

    #this function guesses the best guess from the top x number of guess
    def guess(guesses)

      total_guesses = 0
      guesses_array = []
      guessed_correctly = false

      while (total_guesses < guesses && guessed_correctly==false)

        break if !increment_operator
        equation = create_equation

        result = evaluate_equation(equation)
        stringresult = guessed_string(equation, result, @expected_result)

        guesses_array.push(stringresult)
        guessed_correctly=true if result == @expected_result
        total_guesses += 1

      end

      guesses_array.each do |a|
        p a
      end

      "Guesses: #{total_guesses} Best Guess: #{best_guess(guesses_array)}"
    end

    # This method accepts a string equation & evaluate the mathematical operation
    def evaluate_equation(string)
      actual_result = eval(string.chars.join(''))
      actual_result
    end

    # This method accepts the created equation, actual result and expected result to display the guessed string
    def guessed_string(equation, actual_result, expected_result)
      guessed_string = equation + ' = ' + actual_result.to_s + " (#{((expected_result)-(actual_result)).abs})"
      guessed_string
    end

    # This method accepts the array list from the generated guesses to find the best guess amoung it 
    def best_guess(guessed_list)
      bestguess = guessed_list[0]
      guessed_list.each_index do |i|
        if(guessed_list[i].scan(/\(([^\)]+)\)/).last.last.to_i < bestguess.scan(/\(([^\)]+)\)/).last.last.to_i)
          bestguess = guessed_list[i]
        end
      end
      bestguess
    end

    # Accesors start #
    def operands
      @operands
    end
    def operators
      @operators
    end
    def operator_value
      @operator_value
    end
    def expected_result
      @expected_result
    end
    # Accesors stop #
  end
end