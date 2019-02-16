module Players
  class Human < Player
    def move
      puts "#{token}, Select a square"
      gets.chomp
    end
  end
end
