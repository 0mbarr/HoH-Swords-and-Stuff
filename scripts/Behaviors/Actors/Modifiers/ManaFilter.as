namespace Modifiers
{
	class ManaFilter : FilterModifier
	{
		float m_below;
		float m_above;
		
		ManaFilter(UnitPtr unit, SValue& params)
		{
			super(unit, params);
			
			m_below = GetParamFloat(unit, params, "below", false, -10);
			m_above = GetParamFloat(unit, params, "above", false, 10);
		}	

		void Initialize(SyncVerb verb, uint id, uint modId) override
		{
			m_syncVerb = verb;
			m_syncId = id;

			FilterModifier::Initialize(verb, id, modId);
		}

		bool Filter(PlayerBase@ player, Actor@ enemy) override 
		{
			if (player is null)
				return false;
			return player.m_record.mana <= m_below || player.m_record.mana >= m_above; 
		}
	}
}