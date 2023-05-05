require 'yaml'

module RandomWord
  class Noun
    class << self
      ##
      # Produces the base form of a random noun.
      #
      # @return [String]
      #
      # @example
      #   RandomWord::Noun.base #=> "dog"
      #
      def base
        fetch('nouns.base')
      end

      def fetch(keys)
        key_parts = keys.split('.')
        data['en'][key_parts[0]][key_parts[1]].sample
      end

      private

      def data
        @data = YAML.load_file(load_path)
      end

      def load_path
        File.join(File.dirname(__FILE__), 'en', 'nouns.yml')
      end
    end
  end
end
