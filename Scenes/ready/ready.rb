module Ready
  class Director
    BACKGROUND = Image.load('images/ruby.png')
    MOUSE = Image.load('images/mouse.png')
    KEYBOARD = Image.load('images/keyboard.png')
    RMOUSE = Image.load('images/mouseready.png')
    RMOUSE.set_color_key([255,255,255])
    RKEYBOARD = Image.load('images/keyboardready.png')
    RKEYBOARD.set_color_key([255,255,255])
def initialize
  @x=0
  @y=0
end
    def play
      Window.draw(0, 0, BACKGROUND)
      if @x==0
      Window.draw(100, 200, KEYBOARD)
    elsif @x==1
      Window.draw(100, 200, RKEYBOARD)
      end
      if @y==0
      Window.draw(700, 200, MOUSE)
    elsif @y==1
        Window.draw(700, 200, RMOUSE)
      end
      if Input.key_push?(K_RETURN) then
        @x=1
      end
      if Input.mouse_down?(M_LBUTTON) then
        @y=1
      end
      if @x==1 && @y==1 then
      @x=0
      @y=0
      Scene.current = :game
      end
    end
  end
end
