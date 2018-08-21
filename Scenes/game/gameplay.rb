module Game
	class Director
		BACKGROUND = Image.load('images/ruby.png')

		def play
    		Window.draw(100,100,BACKGROUND)
    	end
	end
end