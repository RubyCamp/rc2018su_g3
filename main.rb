require 'dxruby'
require_relative 'Scene'
require_relative 'scenes/title/title'
require_relative 'scenes/ready/ready'
require_relative 'scenes/game/gameplay'
require_relative 'scenes/result/result'
require_relative "load"

$who_player = 0
$p1points = 2
$p2points = 0

$bgmplaying = 0
$volume = 230

Window.width = 800
Window.height = 600

Scene.add(:title, Title::Director.new)
Scene.add(:game, Game::Director.new)
Scene.add(:ready, Ready::Director.new)
Scene.add(:result, Result::Director.new)

Scene.current = :title

Window.loop do
  break if Input.key_push?(K_ESCAPE) #ESCキーでゲーム終了
  Scene.play
end
