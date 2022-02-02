require '../classes/corrector'

describe Corrector do
  describe '#validate_name' do
    it 'returns a string with the first letter capitalized' do
      name_instance = Corrector.new.correct_name('julio')
      expect(name_instance).to eq('Julio')
    end

    it 'returns a trim string if the string.length > 10' do
      name_instance = Corrector.new.correct_name('juliocarlos')
      expect(name_instance).to eq('Juliocarlo')
    end
  end
end
