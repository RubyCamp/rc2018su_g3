module Result
  class Director

  	BACKGROUND = Image.load('images/mog_stage.png')
    P1 = Image.load('images/keyboard.png')
    P2 = Image.load('images/mouse.png')
    FONT = Font.new(60,"MS 明朝")
    MATZU = Sound.new('sounds/matzu_win.wav')
    SU = Sound.new('sounds/su_win.wav')
    RESULT = Sound.new('sounds/result.wav')

    def initialize
      @timewait = 0
    end

  	def play
  	  Window.draw(0,0,BACKGROUND)
      Window.draw_font(100,50,"MATZU: #{$p1points}pts",FONT)
      Window.draw_font(500,50,"SU: #{$p2points}pts",FONT)

      @timewait += 1


      if $p1points == $p2points
        Window.draw_font(270,200,"引き分け!",FONT)
      elsif $p1points > $p2points
        Window.draw_font(270,200,"MATZUの勝利!",FONT)
        Window.draw(100,500,P1)
        MATZU.play
      elsif $p1points < $p2points
        Window.draw_font(270,200,"SUの勝利!",FONT)
        Window.draw(100,500,P2)
        SU.play
      end

      # 2秒後、音楽が流れる。
      if @timewait == 120
        RESULT.play
      end

      #SPACEキーが押されるとタイトル画面に戻る
  	  if Input.key_push?(K_SPACE)
        @timewait = 0
        Scene.current = :title
      end

      Window.draw_font(100,500,"スペースキーでタイトルに戻る",FONT)
  	end
  end
end
