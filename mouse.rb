class Mouse
  def initialize
    #どのボタンをクリックするか
    @button=M_LBUTTON

    #う
    @sonzai=false
    @sonzai_count=0
    @size=0
    @image = Image.new(100,100,C_BLUE)
    @x=0
    @y=0
    @r=20
    @image.circle_fill(@image.width/2,@image.height/2,@r,C_GREEN)
    @image.set_color_key(C_BLUE)
  end

  def getX
    return @x
  end

  def getY
    return @y
  end

  def setR
    if @size==0
      @r=20
    end
  end

  def getR
    return @r
  end

  def getSonzai
    return @sonzai
  end

  def clickMouse
    if Input.mouseDown?(M_LBUTTON)
      if @sonzai==false
        @sonzai=true
        @x=Input.mousePosX
        @y=Input.mousePosY
      else
        @sonzai_count+=1
      end
    else
      @sonzai_count+=1
    end
    if @sonzai_count>=10
      @sonzai=false
      @sonzai_count=0
    end
    if @sonzai==true
      Window.draw(@x-@image.width/2,@y-@image.height/2,@image)
    end
  end

end
