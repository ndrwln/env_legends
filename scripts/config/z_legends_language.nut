local gt = this.getroottable();
::Const.LegendMod.Language <- {};
gt.Const.LegendMod.Pronouns <- [
	"They",
	"they",
	"Them",
	"them",
	"Their",
	"their",
	"Theirs",
	"theirs",
	"Themselves",
	"themselves",
	"Person",
	"person",
	"People",
	"people",
	"swordsman",
	"Swordsman",
	"noble",
	"Noble",
	"Sibling",
	"sibling",
	"Sib",
	"sib"
];
gt.Const.LegendMod.PronounTable <- {
	they = [
		"they",
		"he",
		"she"
	],
	them = [
		"them",
		"him",
		"her"
	],
	their = [
		"their",
		"his",
		"her"
	],
	theirs = [
		"theirs",
		"his",
		"hers"
	],
	themselves = [
		"themselves",
		"himself",
		"herself"
	],
	person = [
		"person",
		"man",
		"woman"
	],
	people = [
		"people",
		"men",
		"women"
	],
	swordsman = [
		"swordsman",
		"swordsman",
		"swordwoman"
	],
	noble = [
		"noble",
		"nobleman",
		"noblewoman"
	],
	sibling = [
		"sibling",
		"brother",
		"sister"
	],
	sib = [
		"sib",
		"bro",
		"sis"
	]
};
gt.Const.LegendMod.getPronoun <- function ( _gender, _neuter )
{
	local capitalized = _neuter[0] < 96;

	if (capitalized)
	{
		_neuter = _neuter.tolower();
	}

	local pronoun = this.Const.LegendMod.PronounTable[_neuter][_gender + 1];

	if (capitalized)
	{
		local first = pronoun.slice(0, 1);
		first = first.toupper();
		local second = pronoun.slice(1);
		pronoun = first + second;
	}

	return pronoun;
};
gt.Const.LegendMod.ToBeVerbPronouns <- [
	[
		"they are",
		[
			"they are",
			"he is",
			"she is"
		]
	],
	[
		"they were",
		[
			"they were",
			"he was",
			"she was"
		]
	],
	[
		"they will",
		[
			"they will",
			"he will",
			"she will"
		]
	],
	[
		"they\'re",
		[
			"they\'re",
			"he\'s",
			"she\'s"
		]
	],
	[
		"they\'ll",
		[
			"they\'ll",
			"he\'ll",
			"she\'ll"
		]
	],
	[
		"are they",
		[
			"are they",
			"is he",
			"is she"
		]
	],
	[
		"were they",
		[
			"were they",
			"was he",
			"was she"
		]
	]
];
gt.Const.LegendMod.extendVarsWithPronouns <- function ( _vars, _gender )
{
	foreach( pronoun in this.Const.LegendMod.Pronouns )
	{
		_vars.push([
			pronoun,
			this.Const.LegendMod.getPronoun(_gender, pronoun)
		]);
	}

	foreach( pronounToBeVerb in this.Const.LegendMod.ToBeVerbPronouns )
	{
		local placeholder = pronounToBeVerb[0];
		local value = pronounToBeVerb[1][_gender + 1];
		_vars.push([
			placeholder,
			value
		]);
		_vars.push([
			placeholder.slice(0, 1).toupper() + placeholder.slice(1),
			value.slice(0, 1).toupper() + value.slice(1)
		]);
	}
};
::Const.LegendMod.Language.arrayToText <- function ( _arr, _finalSeparator = "and", _highlight = false )
{
	local ret = "";

	if (_arr.len() == 0)
	{
		return ret;
	}

	if (_highlight)
	{
		ret = ret + ::Const.UI.getColorized(_arr[0], _highlight);
	}
	else
	{
		ret = ret + _arr[0];
	}

	if (_arr.len() == 1)
	{
		return ret;
	}

	for( local i = 1; i < _arr.len(); i++ )
	{
		local separator = i == _arr.len() - 1 ? " " + _finalSeparator + " " : ", ";

		if (_highlight)
		{
			ret = ret + (separator + ::Const.UI.getColorized(_arr[i], _highlight));
		}
		else
		{
			ret = ret + (separator + _arr[i]);
		}
	}

	return ret;
};

