module Result
  class Director
  	BACKGROUNDS = Image.load('images/mog_su_win.png')
    BACKGROUNDM = Image.load('images/mog_matu_win.png')
    BACKGROUNDD = Image.load('images/mog_shikiwake.png')
    P1 = Image.load('images/su.png')
    P2 = Image.load('images/mog.png')

    FONT = Font.new(60,"MS 明朝")
    MATZU = Sound.new('sounds/matzu_win.wav')
    P2.set_color_key([163,73,164])
    SU = Sound.new('sounds/su_win.wav')
    P1.set_color_key([163,73,164])
    RESULT = Sound.new('sounds/result.wav')
    FONT = Font.new(30,"MS 明朝")

    def initialize
      @voiceplay = 0
      @timewait = 0
    end

  	def play

      @timewait += 1


      if $p1points == $p2points
        Window.draw(0,0,BACKGROUNDD)
      elsif $p2points > $p1points
        Window.draw(0,0,BACKGROUNDM)
        Window.draw(20,200,P2)
        if @voiceplay == 0
        @voiceplay = 1
        MATZU.play
      end
    elsif $p2points < $p1points
      Window.draw(0,0,BACKGROUNDS)
        Window.draw(20,200,P1)
        if @voiceplay == 0
        @voiceplay = 1
        SU.play
      end
      end

      Window.draw_font(100,200,"SU: #{$p1points}pts",FONT,color:[254,0,0])
      Window.draw_font(100,250,"MATZU: #{$p2points}pts",FONT,color:[254,0,0])
      # 2秒後、音楽が流れる。
      if @timewait == 110
        RESULT.play
      end

      #SPACEキーが押されるとタイトル画面に戻る
  	  if Input.key_push?(K_SPACE)
        @timewait = 0
        @voiceplay = 0
        Scene.current = :title
      end

      Window.draw_font(20,500,"スペースキーでタイトルに戻る",FONT,color:[254,0,0])
  	end
  end
end
