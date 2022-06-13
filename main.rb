require_relative 'lib/clothes'
require_relative 'lib/clothes_collection'

collection = ClothesCollestion.from_path("#{__dir__}/data")

puts 'Сколько градусов за окном? (можно с минусом)'
temperature = gets.to_i

print "\nПредлагаем сегодня надеть:\n\n"

collection.existing_types.each do |type|
  puts collection.only_specified(type: type, temperature: temperature).sample || "Нет подходящей вещи( (#{type})"
end
