module Ready
  class Director
    BACKGROUND = Image.load('images/mog_stage.png')

    MOUSE = Image.load('images/mouse.png')
    MOUSE.set_color_key([255,255,255])
    RMOUSE = Image.load('images/mouseready.png')
    RMOUSE.set_color_key([255,255,255])

    KEYBOARD = Image.load('images/keyboard.png')
    KEYBOARD.set_color_key([255,255,255])
    RKEYBOARD = Image.load('images/keyboardready.png')
    RKEYBOARD.set_color_key([255,255,255])
    
    BGM = Sound.new('sounds/title.wav')
    FONT = Font.new(30,"MS 明朝")

    def initialize
      @key_player = 0
      @mouse_player = 0
      @waiting = 0
    end

    def play
      Window.draw(0,0,BACKGROUND)
      Window.draw(50,330,KEYBOARD)
      Window.draw(450,330,MOUSE)

      # Player1 == Matzu, Player == Su
      if $who_player == 0 
        Window.draw(0,0,$image_matzu_ready)
        Window.draw(400,0,$image_su_ready)
      else
        Window.draw(0,0,$image_su_ready)
        Window.draw(400,0,$image_matzu_ready)
      end

      if Input.key_push?(K_RETURN)
        @key_player = 1
      end

      if Input.mouse_push?(M_LBUTTON)
        @mouse_player = 1
      end

      if @key_player == 1
        Window.draw(50, 330, RKEYBOARD)
      end

      if @mouse_player == 1 
        Window.draw(450, 330, RMOUSE)
      end

      if @key_player == 1 && @mouse_player == 1
        @waiting += 1

        if @waiting >= 10
          @key_player = 0
          @mouse_player = 0
          BGM.stop
          $bgmplaying=0
          Scene.current = :game
        end
      end
    end
  end
end
