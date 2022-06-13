require 'clothes'

describe Clothes do
  let(:clothes) { described_class.new('Name', 'Type', (0..10)) }

  describe '#suits_the_tempecature?' do
    context 'returns true or false if clothes suits the temperature' do
      it 'returns true' do
        expect(clothes.suits_the_temperature?(5)).to be_truthy
      end

      it 'returns false' do
        expect(clothes.suits_the_temperature?(-1)).to be_falsy
      end
    end
  end

  describe '#to_s' do
    it "makes string of #{described_class}" do
      expect(clothes.to_s).to eq 'Name (Type) 0..10'
    end
  end
end
