require_relative '../lib/word_generator.rb'

describe NumberToWord do
  let(:phone1) { '6686787825' }
  let(:result1) {[["noun", "struck"], ["onto", "struck"], ["motor", "truck"], ["motor", "usual"], ["nouns", "truck"], ["nouns", "usual"], "motortruck"]}

  let(:phone2) { '2282668687' }
  let(:result2) {[["act", "amounts"], ["act", "contour"], ["bat", "amounts"], ["bat", "contour"], ["cat", "amounts"], ["cat", "contour"], ["acta", "mounts"], "catamounts"]}

  context 'Testing conversion of phone number to combinations of words ' do
    it 'Test output of conversion with multiple words combination' do
      object = NumberToWord.new()
      expect(object.convert_to_word(phone1)[:result]).to match_array(result1)
      expect(object.convert_to_word(phone2)[:result]).to match_array(result2)
      expect(object.convert_to_word(phone1)[:time_taken]).to be < 1
      expect(object.convert_to_word(phone2)[:time_taken]).to be < 1
    end
    it 'should return empty array if number is not 3 char long' do
      object = NumberToWord.new()
      expect(object.convert_to_word("23")).to match_array({})
    end

    it 'should return empty array if number contains 1 or 0' do
      object = NumberToWord.new()
      expect(object.convert_to_word("23101010")).to match_array({})
    end


  end
end