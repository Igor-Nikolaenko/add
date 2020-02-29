﻿# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOn837
@IgnoreOn839

#из-за ошибки web клиента в 8.3.10
@IgnoreOnWeb8310

@tree


Функционал: Автоматизированное получение изменения состояния формы

Как Разработчик я хочу
Чтобы у меня был функционал для получения шагов Gherkin при изменении формы
Для того чтобы я мог использовать их в своих сценариях без программирования

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Дано я удаляю все элементы Справочника "Справочник1"
	Дано я создаю fixtures по макету "Макет"
	Дано Я очищаю окно сообщений пользователю

Сценарий: Я получаю изменения формы в виде сценария Gherkin

#Область Создание элементов шапки

	Когда Я нажимаю кнопку командного интерфейса "Основная"
	И     В панели функций я выбираю "Справочник1"
	Тогда открылось окно "Справочник1"
	Тогда открылось окно "Спр" "авочник1"
	Тогда открылось окно "Спр" "а" "в" "о" "ч" "н" "ик1"
	Тогда открылось окно "Спр" + "а" + "в" + "о" + "ч" + "н" + "ик1"

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаОкна"
	Если появилось окно с заголовком "Справочник1" в течение 10 секунд Тогда
			Затем Я запоминаю значение выражения "2" в переменную "ПроверкаОкна"
	Тогда переменная "ПроверкаОкна" имеет значение 2

	Если текущее окно имеет заголовок "Спра*ник1" Тогда
			Затем Я запоминаю значение выражения "3" в переменную "ПроверкаОкна"
	Тогда переменная "ПроверкаОкна" имеет значение 3


	И     В форме "Справочник1" в таблице "Список" я перехожу к строке:
		| Код       | Наименование       |
		| "000000002" | Тестовый Элемент 2 |
	И     в таблице "Список" я перехожу к строке содержащей подстроки
		| Код       | Наименование       |
		| "000000002" | '2'             |

	И     в таблице "Список" я перехожу к первой строке

	И     я запоминаю значение таблицы "Список" поля "Код" как "КодЭлементаВТаблице"
	И в таблице "Список" я перехожу к последней строке
	И в таблице "Список" я перехожу к строке:
			| 'Код'                       |
			|  '$КодЭлементаВТаблице$'    |


	И таблица  "Список"  содержит строки:
			| 'Код'                       |
			|  '$КодЭлементаВТаблице$'    |


	И     в таблице "Список" я перехожу к строке по шаблону
		| Код       | Наименование       |
		| "00000000*" | '*Элемент*2'             |

	И     В форме "Справочник1" в ТЧ "Список" я выбираю текущую строку
	И     открылось окно "Тестовый Элемент * (Справочник1)"
#	И     В открытой форме я открываю выпадающий список с заголовком "Реквизит1"

	Если Версия платформы ">=" "8.3.10" Тогда
			Тогда открылась форма "Тестовый Элемент 2 (Справочник1)"
			Тогда открылась форма с именем "Справочник.Справочник1.Форма.ФормаЭлемента"

	Если Версия платформы ">=" "8.3.12" Тогда
		И представление элемента с именем "Наименование" стало равно "Тестовый Элемент 2"

	И я жду доступности элемента с именем "Наименование" в течение 10 секунд

	И я фиксирую форму с именем "Справочник.Справочник1.Форма.ФормаЭлемента"

	И в поле с именем 'РеквизитСтрока' я ввожу текст 'Тест'
	И я перехожу к следующему реквизиту
	И я активизирую поле с именем "РеквизитСтрока"
	И я запоминаю значение текущего поля как "ЗначениеПоляРеквизитСтрока"
	И я перехожу к следующему реквизиту
	И Я запоминаю значение выражения '"$ЗначениеПоляРеквизитСтрока$" + "$ЗначениеПоляРеквизитСтрока$"' в переменную "ЗначениеПоляРеквизитСтрока2"
	И я активизирую поле с именем "РеквизитСтрока"
	И в текущее поле я ввожу текст "$ЗначениеПоляРеквизитСтрока2$"
	И элемент формы с именем "РеквизитСтрока" стал равен "ТестТест"


	И     в поле "Реквизит число" я увеличиваю значение
	И     в поле "Реквизит число" я уменьшаю значение
	И     в таблице "ТабличнаяЧасть1" я нажимаю на кнопку 'Добавить'
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	И     в таблице "ТабличнаяЧасть1" я выбираю текущую строку
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит число" я увеличиваю значение
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит число" я уменьшаю значение
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки

	И элемент формы с именем "РеквизитЧисло" стал равен "0,00"
	И в таблице "ТабличнаяЧасть1" я перехожу к следующей ячейке
	И в таблице "ТабличнаяЧасть1" я перехожу к предыдущей ячейке

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаТЧ"
	Если в таблице "ТабличнаяЧасть1" поле с именем "ТабличнаяЧасть1РеквизитСтрока" имеет значение "" тогда
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаТЧ"
	Тогда переменная "ПроверкаТЧ" имеет значение 2

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаТЧ"
	Если в таблице "ТабличнаяЧасть1" поле с именем "ТабличнаяЧасть1РеквизитСтрока" имеет значение "" тогда
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаТЧ"
	Тогда переменная "ПроверкаТЧ" имеет значение 2

	И     таблица "ТабличнаяЧасть1" стала равной:
		| 'Реквизит число' |
		| ''               |


	И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитСтрока"
	И в таблице "ТабличнаяЧасть1" я выбираю текущую строку
	И в таблице "ТабличнаяЧасть1" в поле 'Реквизит строка' я ввожу текст '555'
	И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	И     я запоминаю значение таблицы "ТабличнаяЧасть1" поля "Реквизит строка" как "ЗначениеРеквизитСтрока"

	Тогда таблица "ТабличнаяЧасть1" стала равной:
		| 'Реквизит строка'           |
		| '$ЗначениеРеквизитСтрока$'  |

	И в таблице 'ТабличнаяЧасть1' я удаляю строку


	#Создание нескольких строк таблицы. Значение реквизита создаётся как "Значение1", "Значение2" и т.д.
	Затем Я запоминаю значение выражения "5" в переменную "МаксКолСтрок"
	Затем Я запоминаю значение выражения "0" в переменную "ТекНомерСтроки"
	Затем Пока выражение встроенного языка "$ТекНомерСтроки$ < $МаксКолСтрок$" истинно тогда
		Дано в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем 'ТабличнаяЧасть1Добавить'
		И в таблице "ТабличнаяЧасть1" я активизирую поле с именем "ТабличнаяЧасть1РеквизитСтрока"
		И Я запоминаю значение выражения "$ТекНомерСтроки$+1" в переменную "ТекНомерСтроки"
		И в таблице "ТабличнаяЧасть1" в поле 'Реквизит строка' я ввожу значение выражения '"Значение" + $ТекНомерСтроки$'
		И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки

	И в таблице 'ТабличнаяЧасть1' я выделяю все строки
	И Пока в таблице "ТабличнаяЧасть1" количество строк ">" 0 Тогда
		И в таблице "ТабличнаяЧасть1" я перехожу к первой строке
		И в таблице 'ТабличнаяЧасть1' я удаляю строку




	И в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем 'ТабличнаяЧасть1Добавить'
	И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки


	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
	Если таблица "ТабличнаяЧасть1" равна переданной тогда
		| 'Реквизит число' |
		| ''               |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаРавенствоТаблицы"

	Тогда переменная "ПроверкаУсловияНаРавенствоТаблицы" имеет значение 2


	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
	#проверяем, что условие не выполнится
	Если таблица "ТабличнаяЧасть1" равна переданной тогда
		| 'Реквизит число' |
		| '111'            |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаРавенствоТаблицы"

	Тогда переменная "ПроверкаУсловияНаРавенствоТаблицы" имеет значение 1





	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
	Если таблица "ТабличнаяЧасть1" равна макету "МакетТабличнаяЧасть1" тогда
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаРавенствоТаблицы"

	Тогда переменная "ПроверкаУсловияНаРавенствоТаблицы" имеет значение 2


	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаРавенствоТаблицы"
	#проверяем, что условие не выполнится
	Если таблица "ТабличнаяЧасть1" равна макету "МакетТабличнаяЧасть1СОшибкой" тогда
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаРавенствоТаблицы"

	Тогда переменная "ПроверкаУсловияНаРавенствоТаблицы" имеет значение 1






	И затем я выполняю код встроенного языка
		|'Сообщить("Hello world!");'|
		|'Сообщить("Hello world!");'|

	И     в таблице "ТабличнаяЧасть1" я удаляю текущую строку


	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаУсловияНаЗначенияПоля"
	Если поле с именем "Наименование" стало равно "Тестовый Элемент 2" в течение 10 секунд Тогда
			Затем Я запоминаю значение выражения "2" в переменную "ПроверкаУсловияНаЗначенияПоля"

	Тогда переменная "ПроверкаУсловияНаЗначенияПоля" имеет значение 2


	#Проверка работы с многострочным реквизитом
	И     в поле "Реквизит многострочная строка" я ввожу текст
		|'111'|
		|'222'|
	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен
		|'111'|
		|'222'|

	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен шаблону
		|'1*1'|
		|'2*2'|

	И     элемент формы с именем "РеквизитМногострочнаяСтрока" стал равен шаблону
		|'1*1'|
		|'222'|

	И     элемент формы с именем "Код" стал равен шаблону  "0*0*"

	#Проверка работы с полем стандартного периода
	И     я нажимаю кнопку выбора у поля "Реквизит стандартный период"
	Тогда открылось окно "Выберите период"
	И пауза 1
	И     в поле "DateBegin" я ввожу текст "08.04.1981"
	И     в поле "DateEnd" я ввожу текст "11.09.1983"
	И     я нажимаю на кнопку "Выбрать"
	И элемент формы "Реквизит стандартный период" стал равен "08.04.1981 - 11.09.1983"

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаДоступности"
	Если элемент "Наименование" доступен для редактирования Тогда
		Тогда Я запоминаю значение выражения "2" в переменную "ПроверкаДоступности"
	Тогда переменная "ПроверкаДоступности" имеет значение 2



	И     В открытой форме из выпадающего списка с именем "Реквизит1" я выбираю "ЗначениеПеречисления1"
	И     из выпадающего списка с именем "Реквизит1" я выбираю точное значение "ЗначениеПеречисления2"
	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления2"
	И     из выпадающего списка с именем "Реквизит1" я выбираю точное значение "ЗначениеПеречисления1"
	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления1"


	И     В открытой форме я выбираю значение реквизита с заголовком "Реквизит2" из формы списка
	Тогда открылось окно "Справочник2"
	И     В форме "Справочник2" в таблице "Список" я перехожу к строке:
		| Наименование      |
		| ТестовыйЭлемент21 |
	И     В форме "Справочник2" в ТЧ "Список" я выбираю текущую строку
	Тогда открылось окно "Тестовый Элемент * (Справочник1) *"
	И     В открытой форме в поле с именем "РеквизитЧисло" я ввожу текст "12,34"
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст "тест"
	И     я запоминаю значение поля с именем "РеквизитЧисло" как "ЗначениеРеквизитЧисло"
	Тогда переменная "ЗначениеРеквизитЧисло" имеет значение "12,34"
	И     поле с именем "РеквизитЧисло" равно переменной "ЗначениеРеквизитЧисло"
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст ""
	И     элемент формы с именем "РеквизитСтрока" стал равен ""
	И     В открытой форме в поле с именем "РеквизитСтрока" я ввожу текст "тест"

	И в поле "!РеквизитДата" я ввожу начало текущего месяца
	И в поле "!РеквизитДата" я ввожу конец текущего месяца
	И в поле "!РеквизитДата" я ввожу начало следующего месяца
	И в поле "!РеквизитДата" я ввожу конец следующего месяца
	И в поле с именем "РеквизитДата" я ввожу текущую дату
	И в поле "Рек строка1" я ввожу текущую дату и текущее время

	И     В открытой форме в поле с именем "РеквизитДата" я ввожу текст "08.04.1981"
	Если поле с именем "РеквизитСтрока" имеет значение "тест" тогда
		И     В открытой форме я устанавливаю флаг с заголовком "Реквизит булево"
	И     элемент формы с именем "РеквизитБулево" стал равен "Да"
	И     В открытой форме я меняю значение переключателя с заголовком "Реквизит переключатель" на "Первое значение"
	И     поле с именем "РеквизитСтрока" присутствует на форме

#КонецОбласти

	Затем Я запоминаю значение выражения "1" в переменную "ПроверкаОтсутствияСтроки"
	Если в таблице "ТабличнаяЧасть1" нет строки Тогда
			| 'Реквизит строка'        |
			| 'Какое-то значение'      |
		Затем Я запоминаю значение выражения "2" в переменную "ПроверкаОтсутствияСтроки"

	Тогда переменная "ПроверкаОтсутствияСтроки" имеет значение 2

#Область Создание элементов ТЧ

	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я нажимаю на кнопку с заголовком "Добавить"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит число" я ввожу текст "56,78"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит строка"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит число"
	И     я запоминаю значение таблицы "ТабличнаяЧасть1" поля с именем "ТабличнаяЧасть1РеквизитЧисло" как "ЗначениеРеквизитЧислоТаблица"
	Тогда переменная "ЗначениеРеквизитЧислоТаблица" имеет значение "56,78"
	И     я вывожу значение переменной "ЗначениеРеквизитЧислоТаблица"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит строка" я ввожу текст "ТестСтрока"
	И     в таблице "ТабличнаяЧасть1" в поле "Реквизит дата" я ввожу текущую дату
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" в поле с заголовком "Реквизит дата" я ввожу текст "11.09.1983"
	И     в таблице "ТабличнаяЧасть1" я активизирую поле "Реквизит число"
	И     поле таблицы "ТабличнаяЧасть1" "ТабличнаяЧасть1РеквизитЧисло" равно переменной "ЗначениеРеквизитЧислоТаблица"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" из выпадающего списка с заголовком "Реквизит справочник" я выбираю "ТестовыйЭлемент21"
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я изменяю флаг с заголовком "Реквизит булево"
	И     в таблице "ТабличнаяЧасть1" я снимаю флаг "Реквизит булево"
	И     в таблице "ТабличнаяЧасть1" я устанавливаю флаг "Реквизит булево"
	И     в таблице "ТабличнаяЧасть1" я снимаю флаг с именем "ТабличнаяЧасть1РеквизитБулево"
	И     в таблице "ТабличнаяЧасть1" я устанавливаю флаг с именем "ТабличнаяЧасть1РеквизитБулево"
	И     в таблице "ТабличнаяЧасть1" я завершаю редактирование строки
	И     В открытой форме в ТЧ "ТабличнаяЧасть1" из выпадающего списка с заголовком "Реквизит справочник" я выбираю "ТестовыйЭлемент21"



	И     в таблице "ТабличнаяЧасть1" поле "Реквизит строка" имеет значение "ТестСтрока"
	И     в таблице "ТабличнаяЧасть1" поле с именем "ТабличнаяЧасть1РеквизитСтрока" имеет значение "ТестСтрока"


	И     В открытой форме в ТЧ "ТабличнаяЧасть1" я выбираю значение реквизита с заголовком "Реквизит справочник выбор из формы списка" из формы списка
	Тогда открылось окно "Справочник2"
	И     В форме "Справочник2" в таблице "Список" я перехожу к строке:
		| Наименование      |
		| ТестовыйЭлемент21 |
	И     В форме "Справочник2" в ТЧ "Список" я выбираю текущую строку

#КонецОбласти

	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"

	И я запоминаю количество строк таблицы "ТабличнаяЧасть1" как "КолСтрокТЧ1"
	И количество строк таблицы "ТабличнаяЧасть1" равно переменной "КолСтрокТЧ1"

#Область Проверка значений элементов формы
	Тогда элемент формы с именем "Код" стал равен "000000002"
	И     элемент формы с именем "Наименование" стал равен "Тестовый Элемент 2"
	И     значение поля с именем "Наименование" содержит текст "Тестовый"
	И     Проверяю шаги на Исключение:
		|'И     значение поля с именем "Наименование" содержит текст "Тестовый111"'|

	И     элемент формы с именем "Реквизит1" стал равен "ЗначениеПеречисления1"
	И     элемент формы с именем "Реквизит2" стал равен "ТестовыйЭлемент21"
	И     элемент формы с именем "РеквизитЧисло" стал равен "12,34"
	И     элемент формы с именем "РеквизитСтрока" стал равен "тест"
	И     элемент формы с именем "РеквизитДата" стал равен "08.04.1981"
	И     элемент формы с именем "РеквизитБулево" стал равен "Да"
	И     элемент формы с именем "РеквизитПереключатель" стал равен "1"
	И     таблица формы с именем "ТабличнаяЧасть1" стала равной:
		| 'N' | 'Реквизит число' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,78'          |  '56,78'         | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |

	И     таблица "ТабличнаяЧасть1" стала равной по шаблону:
		| 'N' | 'Реквизит число' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '*,78'           |  '56,*'          | 'Т*тСт*ка'        | '11.*.1983'     | 'Тестов*Элемент21'                          | '*естовыйЭлемент2*'   | '*'               |


	И     таблица формы с именем "ТабличнаяЧасть1" содержит строки:
		| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,78'          | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |

	И     таблица "ТабличнаяЧасть1" содержит строки из макета "СтрокиТабличнаяЧасть1"

	И     таблица "ТабличнаяЧасть1" не содержит строки:
		| 'N' |
		| '2' |
		| '3' |

	И     таблица "ТабличнаяЧасть1" не содержит строки из макета "НеСтрокиТабличнаяЧасть1"

	#Проверим, что шаг, проверяющий отстутствие строки вызовет исключение, т.к. в макете указано значение
	#	| 'N' |
	#	| '1' |
	Затем Проверяю шаги на Исключение:
        |'И     таблица "ТабличнаяЧасть1" не содержит строки из макета "МакетСПервойСтрокой"'|


	И     таблица формы с именем "ТабличнаяЧасть1" содержит строки:
		| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |
		| '1' | '56,7*'          | '*'               | '11.09.1983'    | 'ТестовыйЭлемент*'                         | 'ТестовыйЭлемент21'   | 'Да'              |
# Реквизит число специально указан два раза


	Тогда таблица формы с именем "ТабличнаяЧасть1" содержит изменения:
		| 'Реквизит число' |
		| '56,78'          |




	И     элемент формы с именем "Код1" стал равен "000000002"
	И     элемент формы с именем "Наименование2" стал равен "Тестовый Элемент 2"
	И     элемент формы с именем "Наименование1" стал равен "Тестовый Элемент 2"
	И     элемент формы с именем "Реквизит3" стал равен "ЗначениеПеречисления1"

#КонецОбласти
	И     я нажимаю на кнопку Vanessa-ADD "Забыть состояние формы TestClient"
	И     я нажимаю на кнопку Vanessa-ADD "ПолучитьИзмененияФормыGherkin"
	И     Пауза 2
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать и закрыть"


#Область Проверка созданного кода Gherkin по изменениям элементов формы

	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Код" стал равен \'000000002\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит1" стал равен \'ЗначениеПеречисления1\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит2" стал равен \'ТестовыйЭлемент21\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитЧисло" стал равен \'12,34\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитСтрока" стал равен \'тест\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитДата" стал равен \'08.04.1981 0:00:00\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитБулево" стал равен \'Да''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "РеквизитПереключатель" стал равен \'1\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'таблица "ТабличнаяЧасть1" стала равной:'
#	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка '| 'N' | 'Реквизит число' | 'Реквизит строка' | 'Реквизит дата' | 'Реквизит справочник выбор из формы списка' | 'Реквизит справочник' | 'Реквизит булево' |'
#	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка '| '1' | '56,78'          | 'ТестСтрока'      | '11.09.1983'    | 'ТестовыйЭлемент21'                         | 'ТестовыйЭлемент21'   | 'Да'              |'
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Код1" стал равен \'000000002\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование2" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Наименование1" стал равен \'Тестовый Элемент 2\''
	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'элемент формы с именем "Реквизит3" стал равен \'ЗначениеПеречисления1\''

#КонецОбласти

	И я отменяю фиксирование формы


	Тогда в таблице "Список" текущая строка равна:
		| 'Реквизит1'             | 'Наименование'       |
		| 'ЗначениеПеречисления1' | 'Тестовый Элемент 2' |

Сценарий: Проверка гиперссылки у форматированной строки

	Дано я открываю форму с форматированной строкой
		Когда Я нажимаю кнопку командного интерфейса "Основная"
		И В панели функций я выбираю 'Справочник1'
		Тогда открылось окно 'Справочник1'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Справочник1 (создание)'
	Когда я нажимаю на вторую гиперссылку из форматированной строки
		И я перехожу к закладке "Вспомогательная"
		И я нажимаю на гиперссылку 'Гиперссылка2' для поля "Форматированная строка"
	Тогда В последнем сообщении TestClient есть строка "ГиперссылкаФорматированнойСтроки = http://Гиперссылка2"

Сценарий: Проверка гиперссылки у имени форматированной строки

	Дано я открываю форму с форматированной строкой
		Когда Я нажимаю кнопку командного интерфейса "Основная"
		И В панели функций я выбираю 'Справочник1'
		Тогда открылось окно 'Справочник1'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Справочник1 (создание)'
	Когда я нажимаю на вторую гиперссылку из форматированной строки
		И я перехожу к закладке "Вспомогательная"
		И я нажимаю на гиперссылку 'Гиперссылка1' для поля с именем "ФорматированнаяСтрокаСсылка"
	Тогда В последнем сообщении TestClient есть строка "ГиперссылкаФорматированнойСтроки = http://Гиперссылка1"

Сценарий: Проверка наличия строк в таблице по шаблону
	Дано открыл форму с таблицей
		Когда Я нажимаю кнопку командного интерфейса "Основная"
		И     В панели функций я выбираю "Справочник1"
		Тогда открылось окно "Справочник1"
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Справочник1 (создание)'
	Когда я заполнил таблицу обычными и многострочными строками
		# И В командном интерфейсе я выбираю 'Основная' 'Справочник1'
		# Тогда открылось окно 'Справочник1'
		# И я нажимаю на кнопку с именем 'ФормаСоздать'
		# Тогда открылось окно 'Справочник1 (создание)'
		И в таблице "ТабличнаяЧасть1" я нажимаю на кнопку с именем 'ТабличнаяЧасть1Добавить'
		# Тогда открылось окно 'Справочник1 (создание) *'
		И я перехожу к следующему реквизиту
		И в таблице "ТабличнаяЧасть1" в поле 'Реквизит строка' я ввожу текст 'первая вто'
		И я перехожу к следующему реквизиту
		# И в таблице "ТабличнаяЧасть1" в поле 'Многострочная строка' я ввожу текст 'первая вто'
		И в таблице "ТабличнаяЧасть1" в поле 'Многострочная строка' я ввожу текст
		"""
		много первая
		много вторая
		"""
		# И     в поле "Реквизит многострочная строка" я ввожу текст
		# 	|'111'|
		# 	|'222'|
		И я перехожу к следующему реквизиту
		И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки

	Тогда в таблице есть строки, в т.ч. и многострочные, указанные по простому шаблону - * в начале или конце строки
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка |
			| '*вая*'      	  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка |
			| '*ва*'      	  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка |
			| ва*      	  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка |
			| *ва      	  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка |
			| *вто      	  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка | Многострочная строка |
			| *вто      	  | 'много*'                   |
		Тогда таблица "ТабличнаяЧасть1" стала равной по шаблону:
			| Реквизит строка | Многострочная строка |
			| *вая*      	  | *втор*                   |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка | Многострочная строка |
			| *вая*      	  | много*                  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка | Многострочная строка |
			| *вая*      	  | *много*                  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка | Многострочная строка |
			| *вая*      	  | *много                  |

	Тогда в таблице нет строк, в т.ч. и многострочных, указанных по простому шаблону - * в начале или конце строки
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка |
			| '*1вая*'      	  |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка |
			| '*1ва*'      	  |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка |
			| 1ва*      	  |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка |
			| *1ва      	  |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка |
			| *1вто      	  |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка | Многострочная строка |
			| *1вто      	  | 'много*'                   |
		# Тогда таблица "ТабличнаяЧасть1" стала равной по шаблону:
		# 	| Реквизит строка | Многострочная строка |
		# 	| *1вая*      	  | *втор*                   |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка | Многострочная строка |
			| *1вая*      	  | много*                  |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка | Многострочная строка |
			| *вая*      	  | *много*                  |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| Реквизит строка | Многострочная строка |
			| *вая*      	  | *много                  |

	Тогда в таблице есть строки, в т.ч. и многострочные, указанные по более сложному шаблону - * в середине строки
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка |
			| 'пер*ая'      	  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Реквизит строка |
			| '*пер*ая*'      	  |
		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| Многострочная строка |
			| 'вто*ая'                   |
		Тогда таблица "ТабличнаяЧасть1" стала равной по шаблону:
			| Многострочная строка |
			| '*вто*ая*'                   |
		Тогда таблица "ТабличнаяЧасть1" стала равной по шаблону:
			| Многострочная строка |
			| '*то*ая*'                   |
		Тогда таблица "ТабличнаяЧасть1" стала равной по шаблону:
			| Многострочная строка |
			| '*вто*а*'                   |
