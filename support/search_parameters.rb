# this module contains search parameter methods for JSON
module SearchParameters
  def audio
    audios = @parsed_response[0]['phonetics'].map { |audio| audio['audio'] }
    display_items(audios.reject(&:empty?))
  end

  def noun
    nouns = @parsed_response[0]['meanings'][0]['definitions'].map { |noun| noun['definition'] }
    display_items(nouns)
  end

  def synonym
    synonyms = @parsed_response[0]['meanings'][0]['synonyms']
    display_items(synonyms)
  end

  private

  def display_items(items)
    items.each.with_index(1) do |item, i|
      puts "#{i}) #{item}"
    end
  end
end
