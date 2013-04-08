require 'pry'

def dipthongs(word)
  matches = []
  ['ei', 'ai', 'au', 'oi', 'ou'].each do |match|
    matches << word.scan(/#{match}/)
    matches.flatten!
  end
  binding.pry
end

def syllables(word)
  word.downcase!
  return word if word.length <= 3
  word = [word]
  regex = /.*(ei|ai|au|oi|ou|[aeiou])/
  %w[ei ai au oi ou a e i o u].each do |match|
    word << word[0].match(/.*#{match}/)[1]
    word[0].gsub(/.*#{match}/, '')
  end
end

phrase = ARGV.dup

phrase.each do |word|
  syllables(word.dup)
end
