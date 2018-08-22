class Mouse
  attr_reader :x, :y, :radius, :sonzai
  attr_writer :radius

  def initialize
    @button = M_LBUTTON #左クリックする

    @sonzai = false 
    @sonzai_count = 0
    
    @mouse_x = 0 # MouseのX座標
    @mouse_y = 0 # MouseのY座標
    @radius = 20 # Mouseの範囲円の半径

    @image = Image.new(100,100,C_BLUE)
    @image.circle_fill(@image.width/2,@image.height/2,@radius,C_GREEN)
    @image.set_color_key(C_BLUE)
  end

  def clickMouse
    if @sonzai == false
      if Input.mouseDown?(@button)
        @sonzai = true
        @mouse_x = Input.mousePosX #マウスがクリックされたX座標
        @mouse_y = Input.mousePosY #マウスがクリックされたY座標
      end
    else
      @sonzai_count += 1
    end 

    if @sonzai_count >= 10 #再度クリックされずに６分の１秒経過した場合、範囲円を消去する
      @sonzai = false
      @sonzai_count = 0
    end

    if @sonzai == true
      Window.draw(@mouse_x - @image.width/2,@mouse_y - @image.height/2, @image) #マウスの範囲円を描画する
    end
  end
end
