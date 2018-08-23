module Result
  class Director
  	BACKGROUND = Image.load('images/mog_stage.png')
    P1 = Image.load('images/keyboard.png')
    P2 = Image.load('images/mouse.png')
    FONT = Font.new(40,"MS 明朝")

  	def play
  	  Window.draw(0,0,BACKGROUND)
      Window.draw_font(100,50,"プレイヤー1 #{$p1points}",FONT)
      Window.draw_font(300,50,"プレイヤー2 = #{$p2points}",FONT)

      if $p1points == $p2points
        Window.draw_font(100,200,"引き分け!",FONT)
      elsif $p1points > $p2points
        Window.draw_font(100,200,"p1の勝利!",FONT)
        Window.draw(100,500,P1)
      elsif $p1points < $p2points
        Window.draw_font(100,200,"p2の勝利!",FONT)
        Window.draw(100,500,P2)
      end

      #SPACEキーが押されるとタイトル画面に戻る
  	  Scene.current = :title if Input.key_push?(K_SPACE)

      Window.draw_font(100,500,"スペースキーでタイトルに戻る",FONT)
  	end
  end
end
