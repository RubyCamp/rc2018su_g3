class Mogura
  attr_reader :x_num, :y_num, :point

  DAMAGE_S_1=Sound.new('sounds/su_die1.wav')
  DAMAGE_S_2=Sound.new('sounds/su_ite.wav')
  DAMAGE_M=Sound.new('sounds/konoyaro.wav')

  def initialize(key_code,x,y)
    @key_code = key_code
    @x_num = x
    @y_num = y
    @x = 40 + x*80
    @y = 250 + y*125
    @y_up = @y

    @characters = {:matzu => [$image_matzu,$image_matzu_ikari],
                   :su => [$image_su,$image_su_ikari]}

    if $who_player == 0
      @current_character = :matzu
    else
      @current_character = :su
    end

    @current_image = @characters[@current_character][0]

    @sonzai = false
    @damage = false
    @damage_count = 0

    @kirikaeshi = true
    @@r = 40
    @center_x = @x + @@r
    @center_y = @y_up + @@r

    @point = false
  end

  def pushKey(key_code,bool)
    if bool && @key_code == key_code
      @sonzai = true
    end
  end

  def upMogura
    @point = false

    if @sonzai && @damage != true
      if @kirikaeshi
        @y_up -= 2
      else
        @y_up += 1
      end

      if @y_up <= @y-50
        @kirikaeshi = false
      elsif @y_up >= @y
        @point = true
        self.downMogura
      end

      @center_y = @y_up + @@r
    end

    if @damage
      @damage_count += 1
    end

    if @damage_count >= 20
      @damage_count = 0
      @damage = false
      self.downMogura
    end
  end

  def downMogura
    @sonzai = false
    @kirikaeshi = true
    @y_up = @y
    @damage = false
  end

  def drawMogura
    if @sonzai
      Window.draw(@x,@y_up-35,@current_image)
    end
  end

  def hitMogura(x,y,r,sonzai)
    if @sonzai == true && sonzai == true
      a = ((@center_x-x)/2)**2
      b = ((@center_y-y)/2)**2
      c = ((@@r+r)/2)**2

      if a+b <= c
        @damage = true
        if @current_character==:matzu
          DAMAGE_M.play
        else
          if @x_num%2==0
            DAMAGE_S_1.play
          else
            DAMAGE_S_2.play
          end
        end
      end
    end
  end

  def switchCharacter
    if @damage
      @current_image = @characters[@current_character][1]
    else
      @current_image = @characters[@current_character][0]
    end
  end
end
