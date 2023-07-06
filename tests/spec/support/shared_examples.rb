module SharedExamples
  RSpec.shared_examples 'valid request' do |word_type, word, description|
    it description do
      subject = described_class.new(word_type)

      allow(subject).to receive(:puts)
      definitions = subject.definition_for(word)

      expect(definitions).to be_a_non_empty_array
    end
  end

  RSpec.shared_examples 'invalid request' do |word_type, word, description, error|
    it description do
      subject = described_class.new(word_type)

      allow(subject).to receive(:puts)

      expect { subject.definition_for(word) }.to raise_error(error)
    end
  end

  RSpec.shared_examples 'valid user prompt' do |word, description, _error|
    it description do
      subject = described_class.new(:sense)

      allow(subject).to receive(:puts)
      allow(subject).to receive(:gets).and_return(word)

      expect(subject).to receive(:gets)
      subject.definition_for
      expect(subject.term).to eq(word)
    end
  end

  RSpec.shared_examples 'invalid user prompt' do |word, description, error|
    it description do
      subject = described_class.new(:sense)

      allow(subject).to receive(:puts)
      allow(subject).to receive(:gets).and_return(word)

      expect { subject.definition_for(word) }.to raise_error(error)
    end
  end

  RSpec.shared_examples 'valid request random' do |word_type, description|
    it description do
      subject = described_class.new(word_type)

      allow(subject).to receive(:puts)
      definitions = subject.random_definition

      expect(definitions).to be_a_non_empty_array
    end
  end
end
