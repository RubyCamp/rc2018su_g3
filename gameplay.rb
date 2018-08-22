require 'dxruby'
require 'romkan'
require_relative 'write'
require_relative 'kotowaza_sentence'

Window.width = 800
Window.height = 600

#入力するだけ
str = Write.new()


sentence = KotowazaSentence.new(230,100)
sentence2 = KotowazaSentence.new(230,100)
sentence.koto_each

Window.loop do 
	
  str.update
  sentence.check(str)
  sentence.draw
  sentence.draw_kotowaza
 
  
  #配列の中の文章がなくなったら終了
  if KotowazaSentence::KOTO_BOX.length == sentence.count
    break
  end
		
end