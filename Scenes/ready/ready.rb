module Ready
  class Director
    BACKGROUND = Image.load('images/ruby.png')
    FONT = Font.new(60,"MS 明朝")

    def initialize
      @key_player = 0
      @mouse_player = 0
    end

    def play
      Window.draw(0, 0, BACKGROUND)
      Window.draw_font(400,400,"Ready Screen",FONT)

      if Input.key_push?(K_RETURN)
        @key_player = 1 
      end

      if Input.mouse_down?(M_LBUTTON) 
        @mouse_player = 1 
      end

      if @key_player == 1 && @mouse_player == 1 
        @key_player = 0
        @mouse_player = 0

        Scene.current = :game
      end
    end
  end
end
