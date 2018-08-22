module Result
  class Director
  	BACKGROUND = Image.load('images/su.png')
    P1win = Image.load('images/keyboard.png')
    P2win = Image.load('images/mouse.png')
    FONT = Font.new(60,"MS 明朝")
  	def play
  	  Window.draw(100,100,BACKGROUND)
      Window.draw_font(300,100,"プレイヤー1 = #{$p1points}",FONT)
      Window.draw_font(300,200,"プレイヤー2 = #{$p2points}",FONT)
      if $p1points == $p2points
      Window.draw_font(300,400,"引き分け!",FONT)
      elsif $p1points > $p2points
        Window.draw_font(300,400,"p1の勝利!",FONT)
        Window.draw(100,100,P1win)
      elsif $p1points < $p2points
        Window.draw_font(300,400,"p2の勝利!",FONT)
        Window.draw(100,100,P2win)
      end
  	  Scene.current = :title if Input.key_push?(K_SPACE)

    Window.draw_font(300,600,"スペースキーでタイトルに戻る",FONT)
  	end
  end
end
