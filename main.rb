require 'dxruby'

Window.width = 1280
Window.height = 720

font = Font.new(32)

x = 100
y = 100

Window.loop do
  Window.draw_font(x, y, 'A', font)
  x = x + 1
  y = y + 1
end
