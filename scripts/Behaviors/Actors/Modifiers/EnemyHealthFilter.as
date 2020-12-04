namespace Modifiers
{
	class EnemyHealthFilter : FilterModifier
	{
		float m_below;
		float m_above;
		
		EnemyHealthFilter(UnitPtr unit, SValue& params)
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
			auto eb = cast<CompositeActorBehavior>(enemy);
			if (eb is null)
				return false;
			//print(eb.m_hp);
			return eb.m_hp <= m_below || eb.m_hp >= m_above; 
		}
	}
}