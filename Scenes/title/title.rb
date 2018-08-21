module Title
  class Director
    BACKGROUND = Image.load('images/matzu.png')

    def play
    	Window.draw(0, 0, BACKGROUND)

      	matzu_push = Input.key_push?(K_A)

		if matzu_push
	  		Scene.current = :game
	  		Scene.play
		end
    end
  end
end