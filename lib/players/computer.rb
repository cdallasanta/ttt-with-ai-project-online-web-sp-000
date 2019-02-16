module Players
  class Computer < Player
    def move
      rand(9)+1.to_s
    end
  end
end
