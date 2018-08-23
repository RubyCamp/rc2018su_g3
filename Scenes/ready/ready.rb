module Ready
  class Director
    BACKGROUND = Image.load('images/matzu.png')
    MOUSE = Image.load('images/mouse.png')
    MOUSE.set_color_key([255,255,255])
    KEYBOARD = Image.load('images/keyboard.png')
    KEYBOARD.set_color_key([255,255,255])
    RMOUSE = Image.load('images/mouseready.png')
    RMOUSE.set_color_key([255,255,255])
    RKEYBOARD = Image.load('images/keyboardready.png')
    RKEYBOARD.set_color_key([255,255,255])
    BGM = Sound.new('sounds/title.wav')
    FONT = Font.new(30,"MS 明朝")
def initialize
  @mouse_player=0
  @key_player=0
end
def play
      Window.draw(0, 0, BACKGROUND)
    #  Window.draw_font(20,100,"エンターキーを押してね　　　      マウスをクリックしてね",FONT)
      if @key_player==0
      Window.draw(50, 200, KEYBOARD)
    elsif @key_player==1
      Window.draw(50, 200, RKEYBOARD)
      end

      if @mouse_player == 0
        Window.draw(450, 200, MOUSE)
      elsif @mouse_player == 1
        Window.draw(450, 200, RMOUSE)
      end

      if Input.key_push?(K_RETURN)
        @key_player = 1
      end

      if Input.mouse_down?(M_LBUTTON)
        @mouse_player = 1
      end

      if @key_player == 1 && @mouse_player == 1
        @key_player = 0
        @mouse_player = 0
        BGM.stop
        $i=0
        Scene.current = :game
      end
    end
  end
end
