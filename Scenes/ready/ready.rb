module Ready
  class Director
    BACKGROUND = Image.load('images/ruby.png')
def initialize
  @x=0
  @y=0
end
    def play
      Window.draw(0, 0, BACKGROUND)
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
