class Mogura
  attr_reader :x_num,:y_num,:point

  def initialize(key_code,x,y)
    @key_code = key_code
    @x_num = x
    @y_num = y
    @x = 40 + x*80
    @y = 250 + y*125
    @y_up = @y
    @image = $image_matzu

    @sonzai = false
    @damage = false
    @damage_count = 0

    @kirikaeshi = true
    @matzu = true
    @@r = 40
    @center_x = @x+@@r
    @center_y = @y_up+@@r

    @point = false
  end

  def pushKey(key_code,bool)

    if bool && @key_code==key_code
      @sonzai=true
    end

    #if Input.key_push?(@key_code)
      #@sonzai=true
    #end
  end

  def upMogura
    @point=false
    if @sonzai && @damage!=true
      if @kirikaeshi
        @y_up-=2
      else
        @y_up+=2
      end
      if @y_up<=@y-50
        @kirikaeshi=false
      elsif @y_up>=@y
        @point=true
        self.downMogura
      end
      @center_y=@y_up+@@r
    end

    if @damage
      @damage_count+=1
    end

    if @damage_count>=20
      @damage_count=0
      @damage=false
      self.downMogura
    end

  end

  def drawMogura
    if @sonzai
      Window.draw(@x,@y_up-35,@image)
    end
  end

  def selectCharacter

    if Input.key_push?(K_RETURN)
      if @matzu
        @matzu=false
      else
        @matzu=true
      end
    end

    if @matzu
      if @damage
        @image=$image_matzu_ikari
      else
        @image=$image_matzu
      end
    else
      if @damage
        @image=$image_su_ikari
      else
        @image=$image_su
      end
    end

  end

  def hitMogura(x,y,r,sonzai)
    if @sonzai==true && sonzai==true
      a=((@center_x-x)/2)**2
      b=((@center_y-y)/2)**2
      c=((@@r+r)/2)**2

      if a+b<=c
        @damage=true
      end
    end
  end

  def downMogura
    @sonzai=false
    @kirikaeshi=true
    @y_up=@y
  end
end
