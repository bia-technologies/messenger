﻿
///////////////////////////////////////////////////////////////////////////////////////////////
//
// Модуль транспорта отправки сообщений <ИмяТранспорта>
//
///////////////////////////////////////////////////////////////////////////////////////////////

Перем ПараметрыАвторизации;	// хранит структуру авторизации
Перем ОписаниеПротокола;	// хранит структуру описания протокола

///////////////////////////////////////////////////////////////////////////////////////////////
// Стандартный интерфейс
///////////////////////////////////////////////////////////////////////////////////////////////

// Протокол
//	Метод возвращает описание используемого протокола
//
// Возвращаемое значение:
//	Структура - Описание протокола
//		{
//			Имя 			- Строка - Системное имя транспорта
//			Представление 	- Строка - пользовательское представление транспорта
//			Описание		- Строка - Строковое описание транспорта
//			Операторы		- Структура - Возможные операторы транспорта
//		}
//
Функция Протокол() Экспорт
	
	Если ОписаниеПротокола = Неопределено Тогда

		ОписаниеПротокола = Новый Структура("Имя, Представление, Описание, Операторы", "Шаблон", "Шаблон", "Шаблонный протокол", Неопределено);

	КонецЕсли;

	Возврат ОписаниеПротокола;

КонецФункции // Протокол()

// Инициализация
//	Инициализация параметров транспорта
//
// Параметры:
//  ПараметрыИнициализации - Структура - набор параметров инициализации
//
Процедура Инициализация(ПараметрыИнициализации) Экспорт
	
	Если ПараметрыИнициализации = Неопределено Тогда

		Сообщить(СтрШаблон("Для инициализации транспорта %1 необходимо передавать в параметрах: ", Протокол().Представление));
		Сообщить(" - Параметр1");
		Сообщить(" - Параметр2");
		
		ВызватьИсключение СтрШаблон("Инициализация транспорта %1 невыполнена", Протокол().Представление);

	КонецЕсли;
	
	ВызватьИсключение СтрШаблон("Отсутствует реализация иницициализации транспорта %1", Протокол().Представление);

КонецПроцедуры // Инициализация()

// ОтправитьСообщение
//	Метод отправки сообщения
//
// Параметры:
//	Адресат					- Строка	- Адресат сообщения
//	Сообщение				- Строка	- Текст отправляемого сообщения
//	ДополнительныеПараметры	- Структура	- Набор дополнительных параметров
//
Процедура ОтправитьСообщение(Адресат, Сообщение, ДополнительныеПараметры = Неопределено) Экспорт
	
	Если ПараметрыАвторизации = Неопределено Тогда

		ВызватьИсключение СтрШаблон("Для отправки сообщения необходимо выполнить инициализацию транспорта %1", Протокол().Представление);

	КонецЕсли;

	ВызватьИсключение СтрШаблон("Отсутствует реализация отправки сообщения для транспорта %1", Протокол().Представление);
	
КонецПроцедуры // ОтправитьСообщение()

///////////////////////////////////////////////////////////////////////////////////////////////

ПараметрыАвторизации = Неопределено;
