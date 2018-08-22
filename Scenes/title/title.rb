module Title
  class Director
    BACKGROUND = Image.load('images/mog_title.png')
    START = Image.load('images/start.png')
    def initialize
      $p1points = 0
      $p2points = 0
    end
    def play
    	Window.draw(0, 0, BACKGROUND)
      Window.draw(250,480,START)

      if Input.mouse_x >= 250 && Input.mouse_x <= 473 && Input.mouse_y >= 480 && Input.mouse_y <= 566
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
