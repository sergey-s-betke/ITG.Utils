ITG.Utils
=========

Набор вспомогательных командлет и функций.

Версия модуля: **1.1.0**

Функции модуля
--------------

### CustomMember

#### Обзор [Add-CustomMember][]

Преобразование однотипных объектов со свойствами key и value в единый объект,
свойства которого определены поданными на конвейер парами.

	Add-CustomMember [-Name] <String> [-Value] <Object> [-Force] <CommonParameters>

Подробнее - [Add-CustomMember][].

### Pair

#### Обзор [Add-Pair][]

Преобразование / добавление однотипных объектов со свойствами key и value в hashtable / любой другой словарь.

	Add-Pair [-Key] <String> [-Value] <Object> [-InputObject <IDictionary>] [-PassThru] <CommonParameters>

Подробнее - [Add-Pair][].

#### Обзор [Get-Pair][]

Конвертация таблицы транслитерации и любых других словарей в массив объектов с целью дальнейшей сериализации.

	Get-Pair [-InputObject] <IDictionary> <CommonParameters>

Подробнее - [Get-Pair][].

Подробное описание функций модуля
---------------------------------

#### Add-CustomMember

Преобразование однотипных объектов со свойствами key и value в единый объект,
свойства которого определены поданными на конвейер парами.

##### Синтаксис

	Add-CustomMember [-Name] <String> [-Value] <Object> [-Force] <CommonParameters>

##### Параметры

- `Name <String>`
        Идентификатор свойства

        Требуется? true
        Позиция? 1
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByPropertyName)
        Принимать подстановочные знаки?

- `Value <Object>`
        Значение Value для hashtable

        Требуется? true
        Позиция? 2
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByPropertyName)
        Принимать подстановочные знаки?

- `Force [<SwitchParameter>]`

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

1. 'А'='A';
	'Б'='B';
	'В'='V';
	'Г'='G';
} `
| [Add-CustomMember][] `
;

		@{

#### Add-Pair

Преобразование / добавление однотипных объектов со свойствами key и value в hashtable / любой другой словарь.

##### Синтаксис

	Add-Pair [-Key] <String> [-Value] <Object> [-InputObject <IDictionary>] [-PassThru] <CommonParameters>

##### Параметры

- `Key <String>`
        Ключ key для hashtable.

        Требуется? true
        Позиция? 1
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByPropertyName)
        Принимать подстановочные знаки?

- `Value <Object>`
        Значение Value для hashtable.

        Требуется? true
        Позиция? 2
        Значение по умолчанию
        Принимать входные данные конвейера?true (ByPropertyName)
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

1. 'А'='A';
	'Б'='B';
	'В'='V';
	'Г'='G';
} `
| [Get-Pair][] `
| ? { 'А','Б' -contains $_.key } `
| [Add-Pair][] -PassThru `
;

		@{

2. 'А'='A';
	'Б'='B';
	'В'='V';
	'Г'='G';
} `
| [Get-Pair][] `
| [Add-Pair][] -InputObject (@{a=2;zzzzzzzzzzzz=3}) -PassThru

		@{

3. 'А'='A';
	'Б'='B';
	'В'='V';
	'Г'='G';
} `
| [Add-Pair][] -key zzzzzzzzzzzz -value 3 -PassThru

		@{

#### Get-Pair

Конвертация таблицы транслитерации и любых других словарей в массив объектов с целью дальнейшей сериализации.

##### Синтаксис

	Get-Pair [-InputObject] <IDictionary> <CommonParameters>

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

1. 'А'='A';
	'Б'='B';
	'В'='V';
	'Г'='G';
} `
| [Get-Pair][] `
;

		@{


[about_CommonParameters]: http://go.microsoft.com/fwlink/?LinkID=113216 "Описание параметров, которые могут использоваться с любым командлетом."
[Add-CustomMember]: <ITG.Utils#Add-CustomMember> "Преобразование однотипных объектов со свойствами key и value в единый объект, свойства которого определены поданными на конвейер парами."
[Add-Pair]: <ITG.Utils#Add-Pair> "Преобразование / добавление однотипных объектов со свойствами key и value в hashtable / любой другой словарь."
[Get-Pair]: <ITG.Utils#Get-Pair> "Конвертация таблицы транслитерации и любых других словарей в массив объектов с целью дальнейшей сериализации."

---------------------------------------

Генератор: [ITG.Readme](http://github.com/IT-Service/ITG.Readme "Модуль PowerShell для генерации readme для модулей PowerShell").

