﻿#language: ru

Функционал: создание документа Поступление товаров

Как Менеджер по закупкам я хочу
создать документ Поступление товаров 
чтобы оприходовать товары   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание документа Поступление товаров
// создание
* Открытие формы создания документа
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение шапки
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
	Тогда элемент формы с именем "Склад" стал равен 'Малый'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И я нажимаю кнопку выбора у поля с именем "Поставщик"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		|	'Код'		|	'Наименование'	|
		|	'000000012'	|	'Мосхлеб ОАО'	|
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
* Заполнение товарной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Когда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
	| 'Код'       | 'Наименование' |
	| '000000032' | 'Торт '        |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Поступление товара (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки


* Проверка табличной части
	Тогда таблица "Товары" содержит строки:
		| 'Товар' | 'Артикул' | 'Цена'   | 'Количество' | 'Сумма'    |
		| 'Торт ' | 'Т78'     | '150,00' | '10,00'      | '1 500,00' |
	
	И я нажимаю на кнопку с именем "ФормаЗаписать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица  "Список" содержит строки:
		| 'Номер' 	|
		| '$Номер$' |
	
Сценарий: проверка наличия в справочнике номенклатуры Торт
	И В командном интерфейсе я выбираю 'Закупки' 'Товары'
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И таблица  "Список" содержит строки:
		| 'Наименование' 	|
		| 'Торт' |