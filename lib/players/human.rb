module Players
  class Human < Player
    def move
      gets.chomp
    end
  end
end
