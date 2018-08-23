module Result
  class Director
  	BACKGROUND = Image.load('images/su.png')
    P1win = Image.load('images/keyboard.png')
    P2win = Image.load('images/mouse.png')
    FONT = Font.new(40,"MS 明朝")
    MATZU = Sound.new('sounds/matzu_win.wav')
    SU = Sound.new('sounds/su_win.wav')
    RESULT = Sound.new('sounds/result.wav')
def initialize
  @pb = 0
  @timewait = 0
end
  	def play
  	  Window.draw(100,100,BACKGROUND)
      Window.draw_font(100,50,"プレイヤー1 = #{$p1points}",FONT)
      Window.draw_font(100,100,"プレイヤー2 = #{$p2points}",FONT)
      @timewait+=1
      if $p1points == $p2points
        Window.draw_font(100,200,"引き分け!",FONT)
      elsif $p1points > $p2points
        Window.draw_font(100,200,"p1の勝利!",FONT)
        Window.draw(400,100,P1win)
        if @pb ==0
        SU.play
        @pb +=1
        end
      elsif $p1points < $p2points
        Window.draw_font(100,200,"p2の勝利!",FONT)
        Window.draw(400,100,P2win)
        if @pb ==0
        MATZU.play
        @pb +=1
        end
      end
  	  if Input.key_push?(K_SPACE)
        @timewait = 0
        Scene.current = :title
        @pb = 0
      end
      if @timewait == 120
      RESULT.play
    end
      Window.draw_font(100,500,"スペースキーでタイトルに戻る",FONT)
  	end
  end
end
