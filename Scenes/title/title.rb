module Title
  class Director
    BACKGROUND = Image.load('images/mog_title.png')

    def play
      Window.draw(0, 0, BACKGROUND)
      Scene.current = :ready if Input.key_push?(K_RETURN)
    end
  end
end
