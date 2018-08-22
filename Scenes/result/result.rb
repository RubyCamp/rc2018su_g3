module Result
  class Director 
  	BACKGROUND = Image.load('images/su.png')

  	def play
  	  Window.draw(100,100,BACKGROUND)
  	  Scene.current = :title if Input.key_push?(K_SPACE)
  	end
  end
end
