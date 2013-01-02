ITG.Utils
=========

Набор вспомогательных командлет и функций для PowerShell.

Версия модуля: **2.0.0**

Функции модуля
--------------

### Dictionary

#### Обзор [ConvertFrom-Dictionary][]

Конвертация таблицы транслитерации и любых других словарей в массив объектов
с целью дальнейшей сериализации.

	ConvertFrom-Dictionary [-InputObject] <IDictionary> <CommonParameters>

Подробнее - [ConvertFrom-Dictionary][].

### ObjectProperty

#### Обзор [ConvertTo-ObjectProperty][]

Преобразование однотипных объектов со свойствами key и value в единый объект,
свойства которого определены поданными на конвейер парами.

	ConvertTo-ObjectProperty -Key <String> -Value <Object> [-TypeName <Type>] [-PassThru] <CommonParameters>

	ConvertTo-ObjectProperty -Key <String> -Value <Object> [-InputObject <IDictionary>] [-PassThru] <CommonParameters>

Подробнее - [ConvertTo-ObjectProperty][].

#### Обзор [Set-ObjectProperty][]

Добавление либо изменение свойств объекта, поступающего по контейнеру

	Set-ObjectProperty [-Key] <String> [-Value] <Object> -InputObject <Object> [-PassThru] <CommonParameters>

Подробнее - [Set-ObjectProperty][].

Подробное описание функций модуля
---------------------------------

#### ConvertFrom-Dictionary

Конвертация таблицы транслитерации и любых других словарей в массив объектов
с целью дальнейшей сериализации.

##### Синтаксис

	ConvertFrom-Dictionary [-InputObject] <IDictionary> <CommonParameters>

##### Параметры

- `InputObject <IDictionary>`
        Исходный словарь для конвейеризации

        Требуется? true
        Позиция? 1
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByValue)
        Принимать подстановочные знаки?

- `<CommonParameters>`
        Данный командлет поддерживает общие параметры: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer и OutVariable. Для получения дополнительных сведений введите
        "get-help [about_CommonParameters][]".



##### Примеры использования

1. Пример 1.

		@{'А'='A'; 'Б'='B'; 'В'='V'} | ConvertFrom-Dictionary;

#### ConvertTo-ObjectProperty

Преобразование однотипных объектов со свойствами key и value в единый объект,
свойства которого определены поданными на конвейер парами.

##### Синтаксис

	ConvertTo-ObjectProperty -Key <String> -Value <Object> [-TypeName <Type>] [-PassThru] <CommonParameters>

	ConvertTo-ObjectProperty -Key <String> -Value <Object> [-InputObject <IDictionary>] [-PassThru] <CommonParameters>

##### Параметры

- `Key <String>`
        Ключ key для hashtable.

        Требуется? true
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByPropertyName)
        Принимать подстановочные знаки?

- `Value <Object>`
        Значение Value для hashtable.

        Требуется? true
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByPropertyName)
        Принимать подстановочные знаки?

- `TypeName <Type>`
        Тип словаря, будет использован при создании нового словаря.

        Требуется? false
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?false
        Принимать подстановочные знаки?

- `InputObject <IDictionary>`
        Исходный словарь, в который будут добавлены сопоставления.

        Требуется? false
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByValue)
        Принимать подстановочные знаки?

- `PassThru [<SwitchParameter>]`

        Требуется? false
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?false
        Принимать подстановочные знаки?

- `<CommonParameters>`
        Данный командлет поддерживает общие параметры: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer и OutVariable. Для получения дополнительных сведений введите
        "get-help [about_CommonParameters][]".



##### Примеры использования

1. Пример 1.

		@{'А'='A'; 'Б'='B'} | ConvertFrom-Dictionary | ? { 'А' -contains $_.key } | ConvertTo-ObjectProperty -PassThru;

2. Пример 2.

		@{'А'='A'; 'Б'='B'} | ConvertFrom-Dictionary | ConvertTo-ObjectProperty -InputObject (@{a=2;zzzzz=3}) -PassThru;

#### Set-ObjectProperty

Добавление либо изменение свойств объекта, поступающего по контейнеру

##### Синтаксис

	Set-ObjectProperty [-Key] <String> [-Value] <Object> -InputObject <Object> [-PassThru] <CommonParameters>

##### Параметры

- `Key <String>`
        Ключ key для hashtable.

        Требуется? true
        Позиция? 1
        Значение по умолчанию
        Принимать входные данные конвейера?false
        Принимать подстановочные знаки?

- `Value <Object>`
        Значение Value для hashtable.

        Требуется? true
        Позиция? 2
        Значение по умолчанию
        Принимать входные данные конвейера?false
        Принимать подстановочные знаки?

- `InputObject <Object>`
        Исходный словарь, в который будут добавлены сопоставления.

        Требуется? true
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByValue)
        Принимать подстановочные знаки?

- `PassThru [<SwitchParameter>]`

        Требуется? false
        Позиция? named
        Значение по умолчанию
        Принимать входные данные конвейера?false
        Принимать подстановочные знаки?

- `<CommonParameters>`
        Данный командлет поддерживает общие параметры: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer и OutVariable. Для получения дополнительных сведений введите
        "get-help [about_CommonParameters][]".



##### Примеры использования

1. Добавляем в hashtable (можно и PSObject) свойство zz со значением 3.

		@{'А'='A'; 'Б'='B'; 'В'='V'} | Set-ObjectProperty -key zz -value 3 -PassThru

2. Пример 2.

		Set-ObjectProperty -InputObject $test -key prop -value 'val' -PassThru;


[about_CommonParameters]: http://go.microsoft.com/fwlink/?LinkID=113216 "Описание параметров, которые могут использоваться с любым командлетом."
[ConvertFrom-Dictionary]: <ITG.Utils#ConvertFrom-Dictionary> "Конвертация таблицы транслитерации и любых других словарей в массив объектов с целью дальнейшей сериализации."
[ConvertTo-ObjectProperty]: <ITG.Utils#ConvertTo-ObjectProperty> "Преобразование однотипных объектов со свойствами key и value в единый объект, свойства которого определены поданными на конвейер парами."
[Set-ObjectProperty]: <ITG.Utils#Set-ObjectProperty> "Добавление либо изменение свойств объекта, поступающего по контейнеру"

---------------------------------------

Генератор: [ITG.Readme](http://github.com/IT-Service/ITG.Readme "Модуль PowerShell для генерации readme для модулей PowerShell").

