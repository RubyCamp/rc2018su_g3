module Rule
  class Director
    BACKGROUND = Image.load('images/ruru.png')
    RETURN = Image.load('images/return.png')

      def play
        Window.draw(0, 0, BACKGROUND)
        Window.draw(650,50,RETURN)

        #ｘ座標が250px ~ 473px,ｙ座標が480px ~ 566pxの範囲でマウスがクリックされたとき
        if Input.mouse_x >= 650 && Input.mouse_x <= 730 && Input.mouse_y >= 50 && Input.mouse_y <= 200
          if Input.mouse_push?(M_LBUTTON)
            Scene.current = :title
          end
        end

        #Enterを押したとき
        if Input.key_push?(K_RETURN)
          Scene.current = :title
        end
      end
    end
  end
