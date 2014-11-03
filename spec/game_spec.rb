# spec/game_spec.rb
require "spec_helper.rb"
module Hangman do
  describe Game do
    context "#word" do
      it "returns the word" do
        game = Game.new("foo")
        expect(game.word).to eq "foo"
      end
      
      it "is random by default" do
        game1 = Game.new
        game2 = Game.new
        expect(game1.word).to_not eq game2.word
      end
    end
    
    context "#random_word" do
      it "returns a string" do
        random = Game.new.random_word
        expect(random.is_a?(String)).to eq true
      end
      
      it "is more than 4 letters long" do
        500.times do
          random = Game.new.random_word
          expect(random.length).to be > 4
        end
      end
      
      it "is less than 12 letters long" do
        500.times do
          random = Game.new.random_word
          expect(random.length).to be < 12
        end
      end 
    end
    
    context "#answer" do
      it "is is initialized with as many _s as the length of the word" do
        game = Game.new("rabbit")
        expect(game.word.length).to eq (game.answer.length / 2)
      end
    end
    
    context "#guesses" do
      it "is initialized at 6" do
        game = Game.new
        expect(game.guesses).to eq 6
      end
    end
    
  end
end