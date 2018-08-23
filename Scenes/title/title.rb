module Title
  class Director
    BACKGROUND = Image.load('images/mog_title.png')
    START = Image.load('images/start.png')
    BGM = Sound.new('sounds/title.wav')
    VOLP = Image.load('images/vol+.png')
    VOLP.set_color_key([255,255,255])
    VOLM = Image.load('images/vol-.png')
    VOLM.set_color_key([255,255,255])
    STAFF = Image.load('images/staff.png')
    STITLE = Sound.new('sounds/su_title.wav')

    def initialize
      @su_y1 = 300
      @su_y2 = 600
      @su_muki = true
      @ikari_count = 0
      @big_su = $image_big_su
      @waittime = 0
    end

    def play
      #BGMを流す
      if @waittime == 1
        sleep(1)
        STITLE.play
      end
      if $bgmplaying == 0 && @waittime == 150
        $bgmplaying = 0
        BGM.play
      end

    	Window.draw(0, 0, BACKGROUND)
      Window.draw(250,480,START)
      Window.draw(-80,@su_y1,@big_su)
      Window.draw(420,@su_y2,@big_su)
      Window.draw(650,520,VOLP)
      Window.draw(700,520,VOLM)
      Window.draw(470,140,STAFF)

      if @su_muki
        @su_y1 += 2
        @su_y2 -= 2
      else
        @su_y1 -= 2
        @su_y2 += 2
      end

      if @su_y1 >= 600
        @su_muki = false
      elsif @su_y1 <= 300
        @su_muki = true
      end

      @ikari_count += 1

      if @ikari_count >= 120
        @big_su = $image_big_su
        @ikari_count = 0
      elsif @ikari_count >= 60
        @big_su = $image_big_su_ikari
      end


      ### Staff画面に遷移する ###

      if Input.mouse_x >= 470 && Input.mouse_x <= 779 && Input.mouse_y >= 140 && Input.mouse_y <= 214
        if Input.mouse_down?(M_LBUTTON)

          Scene.current = :staff
        end
      end

      ### Volume変更する ###

      # Volume UP
      if Input.mouse_x >= 650 && Input.mouse_x <= 699 && Input.mouse_y >= 520 && Input.mouse_y <= 570
        if Input.mouse_down?(M_LBUTTON)
          $volume += 2
          $volume = [$volume,255].min #255が上限

          BGM.set_volume($volume)
        end
      end

      # Volume DOWN
      if Input.mouse_x >= 700 && Input.mouse_x <= 750 && Input.mouse_y >= 520 && Input.mouse_y <= 570
        if Input.mouse_down?(M_LBUTTON)
          $volume -=2
          $volume = [$volume,0].max #0が下限

          BGM.set_volume($volume)
        end
      end

      ### Ready画面に遷移する ###

      #ｘ座標が250px ~ 473px,ｙ座標が480px ~ 566pxの範囲でマウスがクリックされたとき
      if Input.mouse_x >= 250 && Input.mouse_x <= 473 && Input.mouse_y >= 480 && Input.mouse_y <= 566
        if Input.mouse_push?(M_LBUTTON)
          @waittime = 0
          Scene.current = :ready
        end
      end

      #Enterを押したとき
      if Input.key_push?(K_RETURN)
        @waittime = 0
        Scene.current = :ready
      end
      @waittime += 1
    end
  end
end
