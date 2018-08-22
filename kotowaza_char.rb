
class KotowazaChar
  attr_writer :color

  def initialize(x , y , char)
    @x = x
    @y = y
    @char = char
    @color = C_WHITE
    
    @font = Font.new(32)
  end
  

  def cange
    @color = C_BLUE
    
  end

  def char
    return @char
  end

  def draw
    Window.draw_font(@x,@y,@char,@font,color: @color)
  end
end