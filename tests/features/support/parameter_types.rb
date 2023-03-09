# frozen_string_literal: true

def convert_array_to_regexp(array)
  array.join('|')
end

ParameterType(
  name: 'word_type',
  regexp: /#{convert_array_to_regexp(WORD_TYPE_PARAMS)}/,
  transformer: ->(word_type) { word_type.to_sym }
)

ParameterType(
  name: 'dictionary_type',
  regexp: /parse|api/,
  transformer: lambda do |str|
    Object.const_get("DictionaryDefinitions#{str.capitalize}")
  end
)

