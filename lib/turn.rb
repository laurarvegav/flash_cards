
class Turn
   attr_accessor :card
   attr_reader :guess

    def initialize (guess, card)
        @guess = guess
        @card = card
    end

    def correct?
        @guess == @card.answer
    end

    def feedback
        if @guess == @card.answer
            "Correct!"
        else
            "Incorrect."
        end
    end
end