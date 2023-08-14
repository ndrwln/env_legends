::Const.LegendMod.addStaticFunctions <- function ()
{
	::Legends.S <- {};
	::Legends.S.colorize <- function ( _valueString, _value )
	{
		local color = _value >= 0 ? this.Const.UI.Color.PositiveValue : this.Const.UI.Color.NegativeValue;
		return "[color=" + color + "]" + _valueString + "[/color]";
	};
	::Legends.S.getSign <- function ( _value )
	{
		if (_value == 0)
		{
			return "";
		}

		return _value > 0 ? "+" : "-";
	};
	::Legends.S.getChangingWord <- function ( _value )
	{
		if (_value >= 0)
		{
			return "increase";
		}

		return "decrease";
	};
	delete ::Const.LegendMod.addStaticFunctions;
};

