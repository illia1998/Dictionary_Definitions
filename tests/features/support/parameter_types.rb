ParameterType(
  name: 'word_type_html',
  regexp: /noun|origin|idiom|/, # TODO: remove \w+
  transformer: ->(word_type) { word_type.to_sym }
)

ParameterType(
  name: 'word_type_json',
  regexp: /noun|synonym|audio/,
  transformer: ->(word_type) { word_type.to_sym }
)


