module Title
  class Director
    BACKGROUND = Image.load('images/mog_title.png')
    START = Image.load('images/start.png')
    def play
    	Window.draw(0, 0, BACKGROUND)
      Window.draw(400,550,START)

      if Input.mouse_x >= 400 && Input.mouse_x <= 758 && Input.mouse_y >= 550 && Input.mouse_y <= 654
        if Input.mouse_down?(M_LBUTTON)
          Scene.current = :ready
        end
      end
      if Input.key_push?(K_RETURN)
        Scene.current = :ready
      end
    end
  end
end
