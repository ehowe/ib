class TranslatesController < ApplicationController
  def index
  end

  def translate
    phrase = params[:phrase].split
    phrase.map! do |word|
      word = syllables(word.dup)
      word = word.is_a?(Array) ? word : [word]
      word.map! do |wp|
        wp.gsub!(/(.*?)([aeiou])(.*?)$/, "\\1ib\\2\\3") if wp.match(/.*?[aeiou]/)
        wp.gsub!(/y$/, "iby")
        wp
      end
      word.join
    end
    phrase = phrase.join(' ')

    render :json => phrase
  end

  private

  def syllables(word)
    word.downcase!
    return word if word.length <= 3
    word = [word]
    word[0].scan(/^eu|eu$/).each do |word_part|
      word << word_part
      word[0].sub!(/.*?#{word_part}/, '')
    end
    %w[ei ai au oi ou a e i o u].each do |match|
      regex = /.*?#{match}[^$]/
      word[0].scan(regex).each do |word_part|
        if word_part =~ /[bcdfghjklmnpqrstvwxz]+?y/
          word_part.scan(/[bcdfghjklmnpqrstvwxz]+?y/).each { |wp| word << wp }
          word_part.sub!(/[bcdfghjklmnpqrstvwxz]+?y/, '')
        end
        word << word_part
        word[0].sub!(/.*?#{word_part}/, '')
        word[-1] << word[0] if word[0].length == 1 && word[0].match(/[^aeiou]/)
        word[-1] << word[0] if word[0] == "e"
      end
    end
    if word[0] != "" && word[0].match(/.*[aiou]$/)
      word << word[0]
    end
    word.shift
    word
  end
end
