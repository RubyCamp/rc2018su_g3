require 'romkan'
require_relative 'kotowaza_char'

class KotowazaSentence
  attr_reader :chars
  attr_reader :count
  attr_reader :koto_str
  KOTO_BOX = [
	"いぬもあるけばぼうにあたる",
	"さるもきからおちる",
	"ごじゅっぽひゃっぽ"
	]

  def initialize(x , y )
    @x = x
    @y = y
    @charnum = 0
    @koto_box = KOTO_BOX
    @chars = []
    @count = 0
    @koto_str = " "
    @font = Font.new(20)

  end

  def koto_each

      #文字を置く幅のまえの幅
      prev_width = 0
      #キャラ配列の初期化
      @chars = []
      kotoroma_str = koto_shuffle



      #width_index は　i を使うのに必要
      kotoroma_str.each_char.with_index do |char,i|
        if i > 0 then

          #prev_charには前の文字を格納
          prev_char = kotoroma_str[i - 1]

          #calc_width関数からwidthの幅選択
          width = calc_width(prev_width, prev_char)

          #widthの幅をprev_widthに代入
          prev_width  = width

        else
          width = 0
          prev_width = 0
        end

          #chars配列に
          @chars << KotowazaChar.new(@x+width , @y ,char)
        end
  end

  def draw
    @chars.each do |char|
      char.draw
    end
  end



#一文字ずつ色を変える

  def check(str)
    return false if str.str == " "
    if @chars[@charnum].char == str.str
      @chars[@charnum].change
      @charnum += 1
      str.str.chop!
      if @charnum == @chars.length
         @count +=1
        if @count < KOTO_BOX.length
          koto_each
          @charnum = 0
        end
      end
      return true
    else
      return false
    end
  end


  def koto_shuffle
    #シャッフル用配列
    @koto_box = @koto_box.shuffle


    @koto_str = @koto_box.pop

    #ローマ字をkotoroma_str #変更
    kotoroma_str = @koto_str.to_roma

    return kotoroma_str
  end

  def draw_kotowaza
     Window.draw_font(260,80,@koto_str,@font)
  end

  private
  #最終的に実行された式が戻り値として返される
  def calc_width(prev_width, prev_char)
    case prev_char
    when "f","r","t" then
      prev_width + 13
    when "i","j" ,"l"then
      prev_width + 11
    when "m","w"then
      prev_width + 24
    else
      prev_width + 18
    end
  end



end
