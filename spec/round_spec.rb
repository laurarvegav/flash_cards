require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

RSpec.describe Round do
    before(:each) do
      #setup for tests below
      @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      @cards = [@card_1, @card_2, @card_3]
      @deck = Deck.new(@cards)
      @round = Round.new(@deck)
    end

    it 'exists' do
      expect(@round).to be_an_instance_of Round
    end

    it 'stores a deck' do 
      expect(@round.deck).to eq (@deck)
    end

    it 'starts with no turns' do
      expect(@round.turns).to eq([])
    end

    it 'returns the correct card being played' do
      expect(@round.current_card).to eq (@card_1)
    end

    it 'can create a Turn class object and store guess and card' do
      new_turn_1 = @round.take_turn("Juneau")

      expect(new_turn_1).to be_an_instance_of (Turn)
      expect(new_turn_1.guess).to eq ("Juneau")
      expect(new_turn_1.card).to eq (@card_1)
        
      new_turn_2 = @round.take_turn("Venus")
      expect(new_turn_2).to be_an_instance_of (Turn)
    end
    
    it 'can store each turn in the turns array' do
      new_turn_1 = @round.take_turn("Juneau")

      expect(@round.turns).to eq ([new_turn_1])

      new_turn_2 = @round.take_turn("Venus")

      expect(@round.turns).to eq ([new_turn_1, new_turn_2])
        
    end

    it 'stores the guess in the new Turn object and moves on to the next card in the deck' do    
      new_turn_1 = @round.take_turn("Juneau")
        
      expect(@round.current_card).to eq (@card_2)

      new_turn_2 = @round.take_turn("Venus")
        
      expect(@round.current_card).to eq (@card_3)
    end

    it "counts turns" do
      new_turn_1 = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
        
      expect(@round.turns.count).to eq (2)
    end

    it "gives feedback on turns" do
      new_turn_1 = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
        
      expect(@round.turns.last.feedback).to eq ("Incorrect.")
    end

    it "calculates number of correct guesses" do
      new_turn_1 = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
        
      expect(@round.number_correct).to eq (1)
      
      new_turn_2 = @round.take_turn("North north west")

      expect(@round.number_correct).to eq (2)
    end

    it "calculates number of correct guesses by category" do
      new_turn_1 = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
        
      expect(@round.number_correct_by_category(:Geography)).to eq (1)
      expect(@round.number_correct_by_category(:STEM)).to eq (0)
      
      new_turn_2 = @round.take_turn("North north west")

      expect(@round.number_correct_by_category(:STEM)).to eq (1)
    end

    it "calculates percentage of correct guesses" do
      new_turn_1 = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
        
      expect(@round.percent_correct).to eq (50)
    end

    it "calculates percentage of correct guesses by category" do
      new_turn_1 = @round.take_turn("Juneau")
      new_turn_2 = @round.take_turn("Venus")
        
      expect(@round.percent_correct_by_category(:Geography)).to eq (100)
      
      new_turn_2 = @round.take_turn("North north west")

      expect(@round.percent_correct_by_category(:STEM)).to eq (50)
    end

    it "calculates percentage of correct guesses by category when no correct guesses" do
      new_turn_1 = @round.take_turn("Denver")
      new_turn_2 = @round.take_turn("Venus")
        
      expect(@round.percent_correct_by_category(:Geography)).to eq (0)
      
      new_turn_2 = @round.take_turn("North north west")

      expect(@round.percent_correct_by_category(:STEM)).to eq (100)
    end

  end