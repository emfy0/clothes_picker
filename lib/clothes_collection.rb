require 'scanf'

class ClothesCollestion
  attr_reader :all_clothes

  def initialize(all_clothes)
    @all_clothes = all_clothes
  end

  def self.from_path(path)
    file_names = Dir[File.join(path, '*.txt')]
    all_clothes =
      file_names.map do |file_name|
        lines = File.readlines(file_name, chomp: true)
        for_range = lines[2].scanf('(%d, %d)')
        Clothes.new(lines[0], lines[1], (for_range[0]..for_range[1]))
      end

    new(all_clothes)
  end

  def only_specified(specifications)
    @all_clothes.select do |item|
      type = specifications[:type] || item.type
      temperature = specifications[:temperature].nil? ? true : item.suits_the_temperature?(specifications[:temperature])
      item.type == type && temperature
    end
  end

  def existing_types
    @all_clothes.map(&:type).uniq
  end
end
