require 'dxruby'

class Start
	def draw_start
		start_box = Image.new(135,40,[32,44,131,0])
		Window.draw(600,500,start_box)
		start_font = Font.new(40,font_name="MS　明朝")
		Window.draw_font(600,500,"START!",start_font)
		
		if Input.mouse_x >= 600 && Input.mouse_x <= 735 && Input.mouse_y >= 500 && Input.mouse_y <= 540
			if Input.mouse_down?(M_LBUTTON)
				return true
			end
		end

		return false
	end

	def draw_matzu 
		image = Image.load('Matzu.png')
		Window.draw(100,100,image)

		return false
	end
end