### About
Программа подбирающая одежду по погоде.

### Usage
Программа спросит у вас текущую температуру, и подскажет что надеть.
```
bundle intsall && bundle exec ruby main.rb
```

> ```
> Сколько градусов за окном? (можно с минусом)
> 10
>
> Предлагаем сегодня надеть:
>
> Кроссовки (Обувь) 0..15
> Джинсы (Штаны) -5..15
> Пальто (Верхняя одежда) -5..10
> ```
### Additional info

В папке `data` лежат текстовые файлы вот в таком формате:
```
<Название веши>
<Тип веши>
<Диапазон температур>
```
Например,
```
Шапка-ушанка
Головной убор
(-20, -5)
```
#### Тесты
Чтобы запустить тесты или посмотреть краткую документацию:
```
bundle exec rspec --fd
```
