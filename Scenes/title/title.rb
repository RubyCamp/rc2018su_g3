require_relative '../../start'

module Title
  class Director
    BACKGROUND = Image.load('images/matzu.png')
    START = Start.new

    def play
    	Window.draw(0, 0, BACKGROUND)

      	matzu_push = START.draw_start

		if matzu_push
	  		Scene.current = :game
	  		Scene.play
		end
    end
  end
end