ParameterType(
  name: 'word_type_html',
  regexp: /sense|origin|idiom|/,
  transformer: ->(word_type) { word_type.to_sym }
)

ParameterType(
  name: 'word_type_json',
  regexp: /noun|synonym|audio/,
  transformer: ->(word_type) { word_type.to_sym }
)


