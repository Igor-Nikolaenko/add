﻿// { Plugin interface
&НаКлиенте
Перем ПутьКФайлуПолный Экспорт;// в эту переменную будет установлен правильный клиентский путь к текущему файлу
&НаКлиенте
Перем КонтекстЯдра;
&НаКлиенте
Перем Файлы;

&НаКлиенте
Перем ФайлОткрыт;

// { Plugin interface
&НаКлиенте
Функция ОписаниеПлагина(КонтекстЯдра, ВозможныеТипыПлагинов) Экспорт
	Возврат ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов);
КонецФункции

&НаКлиенте
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
КонецПроцедуры

&НаСервере
Функция ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов)
	Возврат ЭтотОбъектНаСервере().ОписаниеПлагина(ВозможныеТипыПлагинов);
КонецФункции
// } Plugin interface

// { API

&НаКлиенте
Процедура ОткрытьФайл(Знач Путь, Знач КодировкаФайла = "utf-8", Знач Добавлять = Истина) Экспорт
	Объект.ПутьФайла = Путь;
	Объект.Кодировка = КодировкаФайла;
	
	СоздатьПлагины();
	Файлы.ОбеспечитьКаталогФайла(Объект.ПутьФайла);
	
	мФайлЛога = Новый ЗаписьТекста(Объект.ПутьФайла, Объект.Кодировка,,Добавлять);
	мФайлЛога.Закрыть();
	
	ФайлОткрыт = Истина;
КонецПроцедуры

&НаКлиенте
Функция Открыт() Экспорт
	Возврат ФайлОткрыт;
КонецФункции

&НаКлиенте
Процедура Вывести(Знач Сообщение) Экспорт
	
	Если НЕ ЗначениеЗаполнено(Объект.ПутьФайла) Тогда
		ВызватьИсключение "Не указано имя лог-файла в параметре <ИмяФайлаЛогВыполненияСценариев>";
	КонецЕсли;	 
	
	Попытка
		мФайлЛога = Новый ЗаписьТекста(Объект.ПутьФайла, Объект.Кодировка, , Истина);
		мФайлЛога.ЗаписатьСтроку(Сообщение);
		мФайлЛога.Закрыть();
	Исключение
		Сообщить(ОписаниеОшибки());
	КонецПопытки;
	
КонецПроцедуры

// } API

// { Helpers
&НаСервере
Функция ЭтотОбъектНаСервере()
	Возврат РеквизитФормыВЗначение("Объект");
КонецФункции


&НаКлиенте
Процедура СоздатьПлагины()
	Если Файлы = Неопределено Тогда
		Файлы = КонтекстЯдра.Плагин("Файлы");
	КонецЕсли; 
КонецПроцедуры
// } Helpers

ФайлОткрыт = Ложь;
