module Players
  class Human < Player
    def move (board)
      puts "#{token}, Select a square"
      gets.chomp
    end
  end
end
