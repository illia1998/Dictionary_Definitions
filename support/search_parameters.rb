# this module contains search parameter methods for JSON
module SearchParameters
  def audio
    arr ||= []
    @parsed_response[0]['phonetics'].each { |audio| arr << audio['audio'] }
    arr.reject(&:empty?).each.with_index(1) do |audio, i|
      puts "#{i}) #{audio}"
    end
  end

  def noun
    @parsed_response[0]['meanings'][0]['definitions'].each.with_index(1) do |noun, i|
      puts "#{i}) #{noun['definition']}"
    end
  end

  def synonym
    @parsed_response[0]['meanings'][0]['synonyms'].each.with_index(1) do |synonym, i|
      puts "#{i}) #{synonym}"
    end
  end
end
