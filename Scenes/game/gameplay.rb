module Game
	class Director
		BACKGROUND = Image.load('images/matzu.png')

		def play
    		Window.draw(0,0,BACKGROUND)
    	end
	end
end
