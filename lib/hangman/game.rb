# /lib/hangman/game.rb
module Hangman
  require "yaml"
  class Game
    attr_accessor :word, :guess, :answer, :guesses
    def initialize word=random_word
      @word = word
      @answer = "_" * (word.length)
      @guesses = 6
      @guess = ""
      @guessed = ""
      @saved = false
    end
    
    # def ask_load
      # puts "Is this your first day here? (Y/n) Press Y to load file."
      # reply = gets.chomp.upcase
      # load_file if reply == "Y" || "YES"
      # play
    # end
    
    def save_file
      @saved = true
      saving
      Dir.mkdir("saves") unless Dir.exists? "saves"
      File.open("my_save.yaml", "w") {|f| f.puts YAML::dump(self) }
    end
    
    # def load_file
      # self = YAML::load(File.open("my_save.yaml"))
    # end
    
    def display_answer
      puts @answer.split("").join(" ")
    end
    
    def random_word
      words = File.readlines("5desk.txt")
      words = words.select { |word| word.length > 4 && word.length < 12 }
      random = words[rand(words.length)].chomp.upcase
    end

    def solicit_guess
      draw_man
      display_answer
      puts @guessed
      puts "What letter would you like to guess, next?"
      @guess = gets.upcase.chomp
    end
    
    def evaluate_guess
      return save_file if @guess == "SAVE"
      @guessed += @guess
      if @word.split("").include? @guess 
        update_answer 
      else
        wrong_guess
      end
    end
    
    def update_answer
      right = @word.split("")
      answer = @answer.split("")
      answer.each_with_index { |l, i| answer[i] = @guess if @guess == right[i] }
      @answer = answer.join("")
    end
    
    def play
      # ask_load
      intro
      while true
        solicit_guess
        evaluate_guess
        if @answer == @word
          you_win
          return
        elsif @guesses == 0
          death
          return
        end
      end
    end

    def wrong_guess
      @guesses -= 1
      puts File.readlines("wrong_guess.txt")
    end
    
    def death
      puts @word
      puts File.readlines("death.txt")
    end
    
    def you_win
      puts @word
      puts File.readlines("you_win.txt")
    end
    
    def intro
      if @saved == false
        puts File.readlines("intro.txt")
      else
        puts File.readlines("wakeup.txt")
      end
    end
    
    def draw_man
      puts File.readlines("man#{@guesses}.txt")
    end
    
    def saving
      puts File.readlines("saving.txt")
    end
  end 
end