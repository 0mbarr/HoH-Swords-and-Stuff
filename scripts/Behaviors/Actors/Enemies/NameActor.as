class NameActor : CompositeActorBehavior
{
	string m_bestiaryName;
	NameActor(UnitPtr unit, SValue& params)
	{
		super(unit, params);
		m_bestiaryName = GetParamString(unit, params, "beastiary-name", false);
		print("unit " + unit.GetDebugName() + " has beastiary-name = " + m_bestiaryName);
	}
	
}