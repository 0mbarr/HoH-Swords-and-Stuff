namespace Modifiers
{
    class EnemyUnitFilter : FilterModifier
    {
        array<string> m_enemyUnit;

        EnemyUnitFilter(UnitPtr unit, SValue& params)
        {
            super(unit, params);

            auto arrUnits = GetParamArray(unit, params, "filters");
            for (uint i = 0; i < arrUnits.length(); i++){
                m_enemyUnit.insertLast(arrUnits[i].GetString());
				//print(m_enemyUnit[i]);
				}
        }
		
		void Initialize(SyncVerb verb, uint id, uint modId) override
		{
			m_syncVerb = verb;
			m_syncId = id;

			FilterModifier::Initialize(verb, id, modId);
		}

        bool Filter(PlayerBase@ player, Actor@ enemy) override
        {
			bool result = false;
			auto eb = cast<CompositeActorBehavior>(enemy);
			if (eb is null)
                return false;
			
			//print("You are attacking: "+ eb.m_bestiaryOverride);
			
			for (uint i = 0; i < m_enemyUnit.length(); i++){
			    if (m_enemyUnit[i] == eb.m_bestiaryOverride)
					result = true; break;
			}
			return result;
        }
    }
}