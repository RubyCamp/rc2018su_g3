require 'dxruby'
require_relative 'start'
require_relative 'scene'
require_relative 'scenes/title/title'
require_relative 'scenes/ready/ready'
require_relative 'scenes/game/gameplay'
require_relative 'scenes/result/result'

Window.width = 1280
Window.height = 720

Scene.add(:title,Title::Director.new)
Scene.add(:game,Game::Director.new)

Scene.current = :title 

Window.loop do
	break if Input.key_push?(K_ESCAPE)
	Scene.play
end
