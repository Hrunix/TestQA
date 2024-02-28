﻿#language: ru

@tree

Функционал: Создание документа Поступления товаров

Как Администратор я хочу
создание документа поступлдения товаров 
чтобы поставить товар на учет   


Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание документа
// создание
* Открытие формы создания документа
	И В панели функций я выбираю 'Приходные накладные'
	Тогда открылось окно 'Приходные накладные'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Приходная накладная (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Мой магазин'
	Тогда элемент формы с именем "Склад" стал равен 'Мой магазин'	
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
* Заполнение товарной части
	И в таблице "Товары" из выпадающего списка с именем "ТоварыНоменклатура" я выбираю точное значение 'Ореховая паста "Нутелла"'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '100,000'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '100,00'
	И в таблице "Товары" я завершаю редактирование строки
	и я нажимаю на кнопку "Записать"


*Номер
	И я запоминаю значение поля "Номер" как "$Номер$"				
* Проведение документа 
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Приходная накладная (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер' |
		| "$Номер$" |

Сценарий: Запускаю сценарий торг
И В панели функций я выбираю 'Номенклатуры'
Тогда таблица "Список" содержит строки:
	| 'Наименование'             | 'Код'         | 'Артикул' |
	| 'Ассорти (Конфты)'         | '00000000001' | ''        |
	| 'Барбарис (Конфеты)'       | '00000000005' | ''        |
	| 'Батон нарезной'           | '00000000006' | ''        |
	| 'Батончик "Марс"'          | '00000000008' | '2 345'   |
	| 'Белочка (Конфеты)'        | '00000000002' | ''        |
	| 'Конфета шоколадная'       | '00000000007' | '1 234'   |
	| 'Конфета шоколадная'       | '00000000010' | '1234'    |
	| 'Куртка кож. женская'      | '00000000003' | ''        |
	| 'Ореховая паста "Нутелла"' | '00000000009' | '3 456'   |
	| 'Стиральная машина BOSCH'  | '00000000004' | ''        |


