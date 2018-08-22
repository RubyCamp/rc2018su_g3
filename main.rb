require 'dxruby'
require_relative 'start'

Window.width = 1280
Window.height = 720

start = Start.new

Window.loop do
  matzu_push = start.draw_start

  if matzu_push
  	start.draw_matzu
  end
end
