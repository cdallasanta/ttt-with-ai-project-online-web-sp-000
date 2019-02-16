module Players
  class Human < Player
    def move
      puts "#{current_player.token}, Select a square"
      gets.chomp
    end
  end
end
