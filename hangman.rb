class Game
  attr_accessor :random_word, :word
  @@tries = 1

  def initialize
    pick_random_line
    length_selector(@random_word)  
    print_enigma
    play_game
  end

  def pick_random_line
    @random_word = File.readlines("google-10000-english-no-swears.txt").sample.to_s
    # p random_word.is_a?(String)
  end

  def length_selector(word)
    until word.length >= 6 && word.length <= 12
      pick_random_line
    end
    @word = @random_word.chomp
    # puts word.is_a?(String)
  end

  def print_enigma
    enigma = @word.tr('a-zA-Z', '_')
    @enigma = enigma.chomp.split(//)
    puts enigma
    puts @word
  end

  def play_game
    while @@tries < 6
      puts 'Type a letter to see if it is included in the word'
      letter = gets.chomp.downcase
      # def guessing
      #   if @@tries > 1
      #     puts "Do you want to guess already? Type yes or no"
      #     want_guess = gets.chomp.downcase
      #     if want_guess != "yes" || want_guess != "no"
      #       puts "Come again?"
      #       want_guess = gets.chomp.downcase
      #     elsif want_guess == "yes"
      #       puts "Alright, you may guess!"
      #       guess = gets.chomp.downcase
      #       if guess == @word
      #         puts "That's right! You win!"
      #         @@tries = 7
      #       else
      #         puts "That's not it! Next round!"
      #       end
      #     elsif want_guess == "no"
      #       puts "Alright, proceed!"
      #       @@tries -= 1
      #     end
      #   end
      end
      if @enigma.include?(letter)
        puts 'You have already selected this character'
        @@tries -= 1
      elsif letter.ord < 97 || letter.ord > 122
        puts 'Please type a valid character'
        letter = gets.chomp.downcase
      end 
      if @word.include?(letter)
        a = (0 ... @word.length).find_all { |i| @word[i,1] == letter }
        p a
        def substitute_characters_in_enigma(original_string, indexes, character)
          indexes.each do |index|
            original_string[index] = character
          end
          original_string
        end
        substitute_characters_in_enigma(@enigma, a, letter)
        p @enigma
      end
      @@tries += 1
      p @@tries
      guessing
      if @@tries == 6
        puts 'Final round! Time to guess the word!'
        guess = gets.chomp.downcase
        if guess == @word
          puts "That's right! You win!"
        elsif
          puts "Too bad! Wrong guess! You loose!"
        end
      end
    end
  end
end

Game.new
