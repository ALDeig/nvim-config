local M = {}

M.pyright = {
	pyright = {
		-- Using Ruff's import organizer
		disableOrganizeImports = true,
		disableTaggedHints = true,
	},
	python = {
		analysis = {
			diagnosticSeverityOverrides = {
				-- TODO: отключить настройки, дублирующиеся с Ruff
				analyzeUnannotatedFunctions = true,
				strictParameterNoneValue = true,
				enableTypeIgnoreComments = true,
				disableBytesTypePromotions = true,
				strictListInference = true,
				strictDictionaryInference = true,
				strictSetInference = true,
				deprecateTypingAliases = false,
				enableExperimentalFeatures = false,
				reportMissingTypeStubs = "none",
				reportMissingModuleSource = "warning",
				reportInvalidTypeForm = "error",
				reportMissingImports = "error",
				reportUndefinedVariable = "error",
				reportAssertAlwaysTrue = "error",
				reportInvalidStringEscapeSequence = "error",
				reportInvalidTypeVarUse = "error",
				reportSelfClsParameterName = "error",
				reportUnsupportedDunderAll = "error",
				reportUnusedExpression = "error",
				reportWildcardImportFromLibrary = "error",
				reportAbstractUsage = "error",
				reportArgumentType = "error",
				reportAssertTypeFailure = "error",
				reportAssignmentType = "none",
				reportAttributeAccessIssue = "error",
				reportCallIssue = "error",
				reportGeneralTypeIssues = "error",
				reportInconsistentOverload = "error",
				reportIndexIssue = "error",
				reportInvalidTypeArguments = "error",
				reportNoOverloadImplementation = "error",
				reportOperatorIssue = "error",
				reportOptionalSubscript = "error",
				reportOptionalMemberAccess = "error",
				reportOptionalCall = "error",
				reportOptionalIterable = "error",
				reportOptionalContextManager = "error",
				reportOptionalOperand = "error",
				reportRedeclaration = "error",
				reportReturnType = "error",
				reportTypedDictNotRequiredAccess = "error",
				reportPrivateImportUsage = "error",
				reportUnboundVariable = "error",
				reportUnhashable = "error",
				reportUnusedCoroutine = "error",
				reportUnusedExcept = "error",
				reportFunctionMemberAccess = "error",
				reportIncompatibleMethodOverride = "error",
				reportIncompatibleVariableOverride = "error",
				reportOverlappingOverload = "error",
				reportPossiblyUnboundVariable = "error",
				reportConstantRedefinition = "error",
				reportDeprecated = "error",
				reportDuplicateImport = "error",
				reportIncompleteStub = "error",
				reportInconsistentConstructor = "error",
				reportInvalidStubStatement = "error",
				reportMatchNotExhaustive = "error",
				reportMissingParameterType = "none",
				reportMissingTypeArgument = "none",
				reportPrivateUsage = "error",
				reportTypeCommentUsage = "error",
				reportUnknownArgumentType = "none",
				reportUnknownLambdaType = "none",
				reportUnknownMemberType = "none",
				reportUnknownParameterType = "none",
				reportUnknownVariableType = "none",
				reportUnnecessaryCast = "error",
				reportUnnecessaryComparison = "none",
				reportUnnecessaryContains = "error",
				reportUnnecessaryIsInstance = "error",
				reportUnusedClass = "error",
				reportUnusedImport = "none",
				reportUnusedFunction = "error",
				reportUnusedVariable = "none",
				reportUntypedBaseClass = "error",
				reportUntypedClassDecorator = "error",
				reportUntypedFunctionDecorator = "error",
				reportUntypedNamedTuple = "error",
				reportCallInDefaultInitializer = "none",
				reportImplicitOverride = "none",
				reportImplicitStringConcatenation = "none",
				reportImportCycles = "none",
				reportMissingSuperCall = "none",
				reportPropertyTypeMismatch = "none",
				reportShadowedImports = "none",
				reportUninitializedInstanceVariable = "none",
				reportUnnecessaryTypeIgnoreComment = "none",
				reportUnusedCallResult = "none",
			},
			-- Ignore all files for analysis to exclusively use Ruff for linting
			-- ignore = { '*' },
		},
	},
}

M.ruff = {
	settings = {
		-- target_version = "py312",
		configurationPreference = "filesystemFirst",
		respect_gitignore = true,
		lineLength = 88,
		lint = {
			preview = true,
			select = { "ALL" },
			ignore = {
				"ANN201", -- Отсутствует аннотация типа возвращаемого значения для публичной функции
				"ANN003", -- Отсутствует аннотация типа для **kwargs
				"COM812", -- Отсутствует завершающая запятая
				"CPY", -- Связанные с авторским правом
				"D100", -- Отсутствует docstring в публичном модуле
				"D102", -- Отсутствует docstring в публичном методе
				"D103", -- Отсутствует docstring в публичной функции
				"D104", -- Отсутствует docstring в публичном пакете
				"D107", -- Отсутствует docstring в __init__
				"D203", -- 1 blank line required before class docstring (conflicts with D211)
				"D205", -- Требуется 1 пустая строка между кратким описанием и подробным
				"D213", -- Multi-line docstring summary should start at the second line (conflicts with D212)
				"DOC201", -- Docstring содержит секцию return, но функция ничего не возвращает
				"DOC501", -- В docstring отсутствуют исключения в секции Raises
				"DOC502", -- Описание исключения в docstring должно начинаться с заглавной буквы
				"DTZ001", -- Использование `datetime.datetime()` без аргумента `tzinfo` не разрешено
				"ERA001", -- Найден закомментированный код
				"FA102", -- Отсутствует `from __future__ import annotations`
				"RET502", -- Не возвращайте None неявно в функции, которая может вернуть не-None значение
				"RUF001", -- Строка содержит неоднозначный unicode символ
				"RUF002", -- Docstring содержит неоднозначный unicode символ
				"RUF003", -- Комментарий содержит неоднозначный unicode символ
			},
		},
	},
}

return M
