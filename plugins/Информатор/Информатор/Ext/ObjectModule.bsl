﻿// { Plugin interface
Функция ОписаниеПлагина(КонтекстЯдра, ВозможныеТипыПлагинов) Экспорт
	Результат = Новый Структура;
	Результат.Вставить("Тип", ВозможныеТипыПлагинов.Утилита);
	Результат.Вставить("Идентификатор", "Информатор");
	Результат.Вставить("Представление", "Информатор - техническая информация");
	
	Возврат Новый ФиксированнаяСтруктура(Результат);
КонецФункции

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
КонецПроцедуры
// } Plugin interface

#Область ПрограммныйИнтерфейс


#КонецОбласти

#Область СлужебныеПроцедурыИФункции


#КонецОбласти
