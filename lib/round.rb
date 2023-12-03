class Round
   attr_accessor :deck,
                 :turns

   def initialize (deck)
      @deck = deck
      @turns = []
    end

    def current_card
      @deck.cards[@turns.length]
    end

    def take_turn (guess)
      new_turn = Turn.new(guess, current_card)
       
      turns = @turns.push(new_turn)
        
      new_turn
    end

    def number_correct 
      @turns.count do |turn|
        turn.correct?
      end
    end

    def number_correct_by_category (cat)
      @turns.count do |turn|
       turn.correct? && turn.card.category == cat
      end
    end

    def percent_correct 
      (number_correct.to_f / @turns.count.to_f) * 100
    end
end