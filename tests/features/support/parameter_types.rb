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

ParameterType(
  name: 'dictionary_type',
  regexp: /parse|api/,
  transformer: lambda do |str|
    Object.const_get("DictionaryDefinitions#{str.capitalize}")
  end
)

