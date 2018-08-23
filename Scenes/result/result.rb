module Result
  class Director
  	BACKGROUND = Image.load('images/su.png')
    P1win = Image.load('images/keyboard.png')
    P2win = Image.load('images/mouse.png')
    FONT = Font.new(40,"MS 明朝")
  	def play
  	  Window.draw(100,100,BACKGROUND)
      Window.draw_font(100,50,"プレイヤー1 = #{$p1points}",FONT)
      Window.draw_font(100,100,"プレイヤー2 = #{$p2points}",FONT)
      if $p1points == $p2points
      Window.draw_font(100,200,"引き分け!",FONT)
      elsif $p1points > $p2points
        Window.draw_font(100,200,"p1の勝利!",FONT)
        Window.draw(100,200,P1win)
      elsif $p1points < $p2points
        Window.draw_font(100,200,"p2の勝利!",FONT)
        Window.draw(100,200,P2win)
      end
  	  Scene.current = :title if Input.key_push?(K_SPACE)

    Window.draw_font(100,500,"スペースキーでタイトルに戻る",FONT)
  	end
  end
end
