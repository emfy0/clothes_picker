require 'clothes'
require 'clothes_collection'

describe ClothesCollestion do
  describe '::from_path' do
    context 'reads *.txt files from <path>' do
      let(:clothes_from_path) { described_class.from_path(File.join(__dir__, 'fixtures')) }

      it "returns the instance from #{described_class}" do
        expect(clothes_from_path).to be_a described_class
      end

      it 'reads all files from path' do
        expect(clothes_from_path.all_clothes.size).to eq 2
      end

      it 'contians Clothes' do
        expect(clothes_from_path.all_clothes).to all be_a Clothes
      end

      it 'read files correctly' do
        expect(clothes_from_path.all_clothes)
          .to contain_exactly(
            an_object_having_attributes(type: 'Обувь', name: 'Зимние ботнки', temperature_range: -30..0),
            an_object_having_attributes(type: 'Верхняя одежда', name: 'Зимняя куртка', temperature_range: -30..-5)
          )
      end
    end
  end

  let(:clothes) do
    [
      Clothes.new('Пальто', 'Верхняя одежда', (-10..5)),
      Clothes.new('Куртка', 'Верхняя одежда', (-5..10)),
      Clothes.new('Джинсы', 'Штаны', (-10..10))
    ]
  end

  let(:collection) { described_class.new(clothes) }

  describe '#existing_types' do
    it 'return all (uniq) existing types of clothes' do
      expect(collection.existing_types).to match_array ['Верхняя одежда', 'Штаны']
    end
  end

  describe '#only_specified' do
    context 'returns choosed objects via <specification>' do
      it "returns all clothes typed 'Верхняя одежда'" do
        expect(collection.only_specified(type: 'Верхняя одежда'))
          .to contain_exactly(
            an_object_having_attributes(name: 'Пальто', type: 'Верхняя одежда', temperature_range: -10..5),
            an_object_having_attributes(name: 'Куртка', type: 'Верхняя одежда', temperature_range: -5..10)
          )
      end

      it "returns all clothes typed <'Верхняя одежда'> && suits the temperature <6>" do
        expect(collection.only_specified(type: 'Верхняя одежда', temperature: 9))
          .to contain_exactly(
            an_object_having_attributes(name: 'Куртка', type: 'Верхняя одежда', temperature_range: -5..10)
          )
      end
    end
  end
end
