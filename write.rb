class Write
  attr_reader :str
  def initialize()
   @str = " "
   @font = Font.new(32)
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
  end
  
  def miss
     @str.chop!
  end
  
end