require "dxruby"
require_relative "load"
require_relative "mogura"
require_relative "mouse"

Window.width=800
Window.height=600

image=Image.new(80,40,[255,0,0])

mouse=Mouse.new

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

mogura=Array.new
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

		for mogu in mogura do
			if mogu.getX==random_x && mogu.getY==random_y
				kaburinashi=false
			end
		end

		if kaburinashi
			count_x_array[random_x]+=1
			count_y_array[random_y]+=1
			break
		end
	end

	mogura.push(Mogura.new(alphabet_key_array[i],random_x,random_y))

	count_point=0

end


Window.loop do

	mouse.setR


	for mogu in mogura do
		mogu.pushKey
	end

	for mogu in mogura do
		mogu.upMogura
		mogu.selectCharacter
		mogu.drawMogura
	end

	for i in 0..2
		for j in 0..8
			Window.draw(40+j*80,250+i*125,image)
		end
	end

	mouse.clickMouse

	for mogu in mogura do
		mogu.hitMogura(mouse.getX,mouse.getY,mouse.getR,mouse.getSonzai)
		if mogu.getPoint
			count_point+=1
			print(count_point.to_s+"\n")
		end
	end

end
