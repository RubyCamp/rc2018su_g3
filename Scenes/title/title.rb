module Title
  class Director
    BACKGROUND = Image.load('images/mog_title.png')
    START = Image.load('images/start.png')
    BGM = Sound.new('sounds/title.wav')
    VOLP = Image.load('images/vol+.png')
    VOLP.set_color_key([255,255,255])
    VOLM = Image.load('images/vol-.png')
    VOLM.set_color_key([255,255,255])

    def initialize
      $p1points = 0
      $p2points = 0

      @su_y1=300
      @su_y2=600
      @su_muki=true
      @ikari_count=0
      @su_gazo=$image_big

      $bgmplaying = 0
      $volume = 230
    end

    def play
      if $bgmplaying==0
        $bgmplaying=1
        BGM.play
      end

    	Window.draw(0, 0, BACKGROUND)
      Window.draw(250,480,START)

      if @su_muki
        @su_y1+=2
        @su_y2-=2
      else
        @su_y1-=2
        @su_y2+=2
      end

      if @su_y1>=600
        @su_muki=false
      elsif @su_y1<=300
        @su_muki=true
      end

      @ikari_count+=1

      if @ikari_count>=120
        @su_gazo=$image_big
        @ikari_count=0
      elsif @ikari_count>=60
        @su_gazo=$image_big_ikari
      end

      Window.draw(-80,@su_y1,@su_gazo)
      Window.draw(420,@su_y2,@su_gazo)

      Window.draw(650,520,VOLP)
      Window.draw(700,520,VOLM)
      
      if Input.mouse_x >= 650 && Input.mouse_x <= 699 && Input.mouse_y >= 520 && Input.mouse_y <= 570
        if Input.mouse_down?(M_LBUTTON)
          $volume +=2
          if $volume >= 255
            $volume = 255
          end
          BGM.set_volume($volume)
        end
      end
      if Input.mouse_x >= 700 && Input.mouse_x <= 750 && Input.mouse_y >= 520 && Input.mouse_y <= 570
        if Input.mouse_down?(M_LBUTTON)
          $volume -=2
          if $volume <= 0
            $volume = 0
          end
          BGM.set_volume($volume)
        end
      end

      if Input.mouse_x >= 250 && Input.mouse_x <= 473 && Input.mouse_y >= 480 && Input.mouse_y <= 566
        if Input.mouse_down?(M_LBUTTON)
          Scene.current = :ready
        end
      end
      if Input.key_push?(K_RETURN)
        Scene.current = :ready
      end
    end
  end
end
