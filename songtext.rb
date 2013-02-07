class Songtext
  def refrain(*args, &block)
    if block
      @refrain = block
    else
      if args.first[0].downcase == 'x'
        puts
        args.first[1..-1].to_i.times do
          @refrain.call()
          puts
        end
      end
    end
  end

  def method_missing(name, *args, &block)
    name = name.to_s
    if /\A[A-Z][a-z]*\z/ =~ name.to_s
      puts [Songtext.fix_word(name.downcase).capitalize, *args].join ' '
    else
      [Songtext.fix_word(name.downcase), *args].join ' '
    end
  end

  class << self
    def fix_word(word)
      case word
      when "i"
        "I"
      when "im"
        "I'm"
      when "ill"
        "I'll"
      when "ive"
        "I've"
      else
        word
      end
    end

    def sing(&block)
      singer = Songtext.new
      singer.instance_eval(&block)
    end
  end
end

Songtext.sing do
  refrain do
    Let the skyfall wHen it crumbles
    We will stand tall oR face it all together
    Let the skyfall wHen we crumbles
    We will stand tall oR face it all
    At skyfall
  end

  This is the eNd
  Hold your breath aNd count to ten
  Feel the earth move again here my heart burst again
  For this is the eNd
  Ive drowned aNd dreamed this moment
  So overdue i owe them
  Swept away im stolen

  refrain x2

  Skyfall is where we start a thousand miles aNd poles apart
  Where worlds collide aNd days are dark
  You may have my number you can take my nAme
  But youll never take my heart

  refrain x2

  Where you go i go
  What you see i see
  I know ill never be without the security
  Are your loving arms keeping me from harm
  Put your hand iN my hand aNd well stand

  refrain x2
end
