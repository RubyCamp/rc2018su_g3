class Write
  attr_reader :str,:key_code
  def initialize()
   @str = " "
   @font = Font.new(32)
   @key_code=nil
  end

  def update
  	@str = 'a' if Input.key_push?(K_A)
  	@str = 'b' if Input.key_push?(K_B)
  	@str = 'c' if Input.key_push?(K_C)
  	@str = 'd' if Input.key_push?(K_D)
  	@str = 'e' if Input.key_push?(K_E)
  	@str = 'f' if Input.key_push?(K_F)
  	@str = 'g' if Input.key_push?(K_G)
  	@str = 'h' if Input.key_push?(K_H)
  	@str = 'i' if Input.key_push?(K_I)
  	@str = 'j' if Input.key_push?(K_J)
  	@str = 'k' if Input.key_push?(K_K)
  	@str = 'l' if Input.key_push?(K_L)
  	@str = 'm' if Input.key_push?(K_M)
  	@str = 'n' if Input.key_push?(K_N)
  	@str = 'o' if Input.key_push?(K_O)
  	@str = 'p' if Input.key_push?(K_P)
  	@str = 'q' if Input.key_push?(K_Q)
  	@str = 'r' if Input.key_push?(K_R)
  	@str = 's' if Input.key_push?(K_S)
  	@str = 't' if Input.key_push?(K_T)
  	@str = 'u' if Input.key_push?(K_U)
  	@str = 'v' if Input.key_push?(K_V)
   	@str = 'w' if Input.key_push?(K_W)
  	@str = 'x' if Input.key_push?(K_X)
  	@str = 'y' if Input.key_push?(K_Y)
  	@str = 'z' if Input.key_push?(K_Z)
  	@str = '-' if Input.key_push?(K_MINUS)
    @str.chop! if Input.key_push?(K_BACK)

    setKeyNum
  end

  def miss
     @str.chop!
  end

  private
  def setKeyNum
    if @str=="a"
      @key_code=K_A
    elsif @str=="b"
      @key_code=K_B
    elsif @str=="c"
      @key_code=K_C
    elsif @str=="d"
      @key_code=K_D
    elsif @str=="e"
      @key_code=K_E
    elsif @str=="f"
      @key_code=K_F
    elsif @str=="g"
      @key_code=K_G
    elsif @str=="h"
      @key_code=K_H
    elsif @str=="i"
      @key_code=K_I
    elsif @str=="j"
      @key_code=K_J
    elsif @str=="k"
      @key_code=K_K
    elsif @str=="l"
      @key_code=K_L
    elsif @str=="m"
      @key_code=K_M
    elsif @str=="n"
      @key_code=K_N
    elsif @str=="o"
      @key_code=K_O
    elsif @str=="p"
      @key_code=K_P
    elsif @str=="q"
      @key_code=K_Q
    elsif @str=="r"
      @key_code=K_R
    elsif @str=="s"
      @key_code=K_S
    elsif @str=="t"
      @key_code=K_T
    elsif @str=="u"
      @key_code=K_U
    elsif @str=="v"
      @key_code=K_V
    elsif @str=="w"
      @key_code=K_W
    elsif @str=="x"
      @key_code=K_X
    elsif @str=="y"
      @key_code=K_Y
    elsif @str=="z"
      @key_code=K_Z
    elsif @str=="-"
      @key_code=K_MINUS
    end


  end

end
