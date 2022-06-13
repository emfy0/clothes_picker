class Clothes
  attr_reader :name, :type, :temperature_range

  def initialize(name, type, temperature_range)
    @name = name
    @type = type
    @temperature_range = temperature_range
  end

  def suits_the_temperature?(temperature)
    @temperature_range.include?(temperature)
  end

  def to_s
    "#{name} (#{type}) #{temperature_range}"
  end
end
