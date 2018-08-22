module Game
  class Director
    BACKGROUND = Image.load('images/matzu.png')
    FONT = Font.new(60,"MS 明朝")

	def play
      Window.draw(0,0,BACKGROUND)
      Window.draw_font(500,200,"GAME SCREEN",FONT)
      Window.draw_font(500,500,"PUSH A!",FONT)
      
      Scene.current = :result if Input.key_push?(K_A)
    end
  end
end
