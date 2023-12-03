
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

#Setup
card_0 = Card.new("What is 5 + 5?", "10", :STEM)
card_1 = Card.new("What is Isaac's favorite animal?", "Beaver", :TuringStaff)
card_2 = Card.new("What is Mike's middle name?", "nobody knows", :TuringStaff)
card_3 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", :TuringStaff)
cards = [card_0, card_1, card_2, card_3]
deck = Deck.new(cards)
round = Round.new(deck)

puts "Welcome! You're playing with #{deck.cards.count} cards."
puts "-------------------------------------------------"


deck.cards.count do |index|
    puts" This is card number #{index} out of #{deck.cards.count}.
    Question: #{round.current_card.question}"

    guess = gets.to_i
    puts round.take_turn(guess).feedback
end

puts "****** Game over! ******"
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count} for a total score of #{round.percent_correct}."

@round.turn.count do |guess|
    puts "#{turn.card.category} - #{percent_correct_by_category} correct"
end
