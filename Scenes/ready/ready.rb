module Ready
  class Director
    BACKGROUND = Image.load('images/matzu.png')

    def play
      Window.draw(0, 0, BACKGROUND)
      x=0
      y=0
      if Input.key_push?(K_RETURN) then
        x=1
      end
      if Input.mause_down?(M_LBUTTON)
        y=1
      end
      if x=1 && y=1 then
      x=0
      y=0
      Scene.current = :game
      end
    end
  end
end
