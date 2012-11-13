function ConvertFrom-Dictionary {
	<#
		.Synopsis
			Конвертация таблицы транслитерации и любых других словарей в массив объектов
			с целью дальнейшей сериализации.
		.Example
			@{'А'='A'; 'Б'='B'; 'В'='V'} | ConvertFrom-Dictionary;
	#>
	
	
	param (
		# Исходный словарь для конвейеризации
		[Parameter(
			Mandatory=$true
			, Position=0
			, ValueFromPipeline=$true
		)]
		[AllowEmptyCollection()]
		[System.Collections.IDictionary]
		$InputObject
	)

	process {
		$InputObject.GetEnumerator();
	}
}

New-Alias -Name Get-Pair -Value ConvertFrom-Dictionary;

function Set-ObjectProperty {
	<#
		.Synopsis
			Добавление либо изменение свойств объекта, поступающего по контейнеру
		.Example
			@{'А'='A'; 'Б'='B'; 'В'='V'} | Set-ObjectProperty -key zz -value 3 -PassThru
			Добавляем в hashtable (можно и PSObject) свойство zz со значением 3.
		.Example
			Set-ObjectProperty -InputObject $test -key prop -value 'val' -PassThru;
	#>
	[CmdletBinding(
	)]
	param (
		# Ключ key для hashtable.
		[Parameter(
			Mandatory=$true
			, Position=0
		)]
		[ValidateNotNullOrEmpty()]
		[string]
		$Key
	,
		# Значение Value для hashtable.
		[Parameter(
			Mandatory=$true
			, Position=1
		)]
		$Value
	,
		# Исходный словарь, в который будут добавлены сопоставления.
		[Parameter(
			Mandatory=$true
			, ValueFromPipeline=$true
		)]
		[ValidateNotNull()]
		$InputObject
	,
		[switch]
		$PassThru
	)

	process {
		$InputObject.$Key = $Value;
		if ( $PassThru ) { return $InputObject;	};
	}
}

function ConvertTo-ObjectProperty {
	<#
		.Synopsis
			Преобразование однотипных объектов со свойствами key и value в единый объект,
			свойства которого определены поданными на конвейер парами.
		.Example
			@{'А'='A'; 'Б'='B'} | ConvertFrom-Dictionary | ? { 'А' -contains $_.key } | ConvertTo-ObjectProperty -PassThru;
		.Example
			@{'А'='A'; 'Б'='B'} | ConvertFrom-Dictionary | ConvertTo-ObjectProperty -InputObject (@{a=2;zzzzz=3}) -PassThru;
	#>
	[CmdletBinding(
		DefaultParameterSetName="NewObject"
	)]
	param (
		# Ключ key для hashtable.
		[Parameter(
			Mandatory=$true
			, ValueFromPipelineByPropertyName=$true
		)]
		[ValidateNotNullOrEmpty()]
		[string]
		$Key
	,
		# Значение Value для hashtable.
		[Parameter(
			Mandatory=$true
			, ValueFromPipelineByPropertyName=$true
		)]
		$Value
	,
		# Тип словаря, будет использован при создании нового словаря.
		[Parameter(
			Mandatory=$false
			, ParameterSetName="NewObject"
		)]
		[Type]
		$TypeName = [PSObject]
	,
		# Исходный словарь, в который будут добавлены сопоставления.
		[Parameter(
			Mandatory=$false
			, ValueFromPipeline=$true
			, ParameterSetName="ExistingObject"
		)]
		[AllowEmptyCollection()]
		[System.Collections.IDictionary]
		$InputObject
	,
		[switch]
		$PassThru
	)

	begin {
		switch ( $PSCmdlet.ParameterSetName ) {
			'NewObject' { $res = ( New-Object -TypeName $TypeName ); }
			'ExistingObject' { $res = $InputObject; }
		};
	}
	process {
		if (
			( $res -is [System.Collections.IDictionary] ) `
			-or ( Get-Member -InputObject $res -MemberType Properties -Name $Key )
		) {
			$res.$Key = $Value;
		} else {
			Add-Member -InputObject $res -MemberType NoteProperty -Name $Key -Value $Value;
		};
	}
	end {
		if ( $PassThru ) { return $res; };
	}
}

New-Alias -Name ConvertTo-PSObject -Value ConvertTo-ObjectProperty;
New-Alias -Name Add-Pair -Value ConvertTo-ObjectProperty;

Export-ModuleMember `
	-Alias `
		Get-Pair `
		, Add-Pair `
		, ConvertTo-Dictionary `
		, ConvertTo-PSObject `
	-Function `
		ConvertFrom-Dictionary `
		, Set-ObjectProperty `
		, ConvertTo-ObjectProperty `
;