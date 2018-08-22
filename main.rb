require 'dxruby'
require_relative 'Scene'
require_relative 'scenes/title/title'
require_relative 'scenes/ready/ready'
require_relative 'scenes/game/gameplay'
require_relative 'scenes/result/result'
require_relative "load"

Window.width = 800
Window.height = 600

Scene.add(:title, Title::Director.new)
Scene.add(:game, Game::Director.new)
Scene.add(:ready, Ready::Director.new)
Scene.add(:result, Result::Director.new)

# Scene[:title].class::BGM.loop_count = -1 # 無限ループ
# Scene[:title].class::BGM.play

Scene.current = :title

Window.loop do
  break if Input.key_push?(K_ESCAPE)
  Scene.play
end
