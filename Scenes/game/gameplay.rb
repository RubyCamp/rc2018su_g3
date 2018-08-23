require_relative "mogura"
require_relative "mouse"
require 'romkan'
require_relative 'write'
require_relative 'kotowaza_char'
require_relative 'kotowaza_sentence'

module Game
  class Director
    BACKGROUND = Image.load('load/station.png')
  	FONT = Font.new(40,"MS 明朝")
    BGM = Sound.new('sounds/game.wav')
    def initialize

      @str = Write.new()

      @sentence = KotowazaSentence.new(230,100)
      @sentence2 = KotowazaSentence.new(230,100)
      @sentence.koto_each

      @usa_x=50
      @kame_x=25

      @image=Image.new(80,40,[255,0,0]) #モグラの穴

      @mouse=Mouse.new

      count_x_array=Array.new
      count_y_array=Array.new
      alphabet_key_array=Array.new

      alphabet_key_array.push(K_A)
      alphabet_key_array.push(K_B)
      alphabet_key_array.push(K_C)
      alphabet_key_array.push(K_D)
      alphabet_key_array.push(K_E)
      alphabet_key_array.push(K_F)
      alphabet_key_array.push(K_G)
      alphabet_key_array.push(K_H)
      alphabet_key_array.push(K_I)
      alphabet_key_array.push(K_J)
      alphabet_key_array.push(K_K)
      alphabet_key_array.push(K_L)
      alphabet_key_array.push(K_M)
      alphabet_key_array.push(K_N)
      alphabet_key_array.push(K_O)
      alphabet_key_array.push(K_P)
      alphabet_key_array.push(K_Q)
      alphabet_key_array.push(K_R)
      alphabet_key_array.push(K_S)
      alphabet_key_array.push(K_T)
      alphabet_key_array.push(K_U)
      alphabet_key_array.push(K_V)
      alphabet_key_array.push(K_W)
      alphabet_key_array.push(K_X)
      alphabet_key_array.push(K_Y)
      alphabet_key_array.push(K_Z)
      alphabet_key_array.push(K_MINUS)

      9.times do
      	count_x_array.push(0)
      end
      3.times do
      	count_y_array.push(0)
      end

      @mogura=Array.new
      for i in 0..26 do

      	while true
      		kaburinashi=true

      		random_x=rand(9)
      		while true
      			random_x=rand(9)
      			if count_x_array[random_x]<3
      				break
      			end
      		end


      		random_y=rand(3)
      		while true
      			random_y=rand(3)
      			if count_y_array[random_y]<9
      				break
      			end
      		end

      		for mogu in @mogura do
      			if mogu.x_num==random_x && mogu.y_num==random_y
      				kaburinashi=false
      			end
      		end

      		if kaburinashi
      			count_x_array[random_x]+=1
      			count_y_array[random_y]+=1
      			break
      		end
      	end

      	@mogura.push(Mogura.new(alphabet_key_array[i],random_x,random_y))

      	@count_point=0 #プレイヤーの得点
      end
    end

  	def play
      Window.draw(0,0,BACKGROUND)
      Scene.current = :result if Input.key_push?(K_SPACE)

          if $bgmplaying==0

          BGM.set_volume($volume)
          $bgmplaying=1
          BGM.play
        end

      @str.update
      check_bool=@sentence.check(@str)
      #print(@sentence.check(@str).to_s+"\n")
      #p @sentence.check(@str)
      for mogu in @mogura do
    		mogu.pushKey(@str.key_code,check_bool)
    	end
      @sentence.draw
      @sentence.draw_kotowaza

      if @usa_x<300
        @usa_x+=2
      elsif @usa_x<350
        @usa_x+=1
      elsif @usa_x<400
        @usa_x+=2
      elsif @usa_x<500
        @usa_x+=0.1
      elsif @usa_x<600
        @usa_x+=0.05
      else
        @usa_x+=5
      end

    	for mogu in @mogura do
    		mogu.upMogura
    		mogu.switchCharacter
    		mogu.drawMogura
    	end

    	for i in 0..2
    		for j in 0..8
    			Window.draw(40+j*80,250+i*125,@image)
    		end
    	end

    	@mouse.clickMouse

    	for mogu in @mogura do
    		mogu.hitMogura(@mouse.x,@mouse.y,@mouse.radius,@mouse.sonzai)
    		if mogu.point
    			@count_point+=1
    			print(@count_point.to_s+"\n")
    		end
    	end

      if @usa_x>@kame_x
        Window.draw(@kame_x,500,$image_kame)
        Window.draw(@usa_x,500,$image_usa)
      else
        Window.draw(@usa_x,500,$image_usa)
        Window.draw(@kame_x,500,$image_kame)
      end

      if @usa_x>=880
        if $who_player==0
          $who_player=1
        else
          $who_player=0
        end
        initialize
        BGM.stop
        $bgmplaying = 0
        Scene.current = :result
      end

      if KotowazaSentence::KOTO_BOX.length == @sentence.count
        #break
      end

    end
  end
end
