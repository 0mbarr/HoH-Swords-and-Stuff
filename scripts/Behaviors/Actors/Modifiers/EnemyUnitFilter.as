namespace Modifiers
{
    class EnemyUnitFilter : FilterModifier
    {
        array<string> m_enemyUnit;

        EnemyUnitFilter(UnitPtr unit, SValue& params)
        {
            super(unit, params);

            auto arrUnits = GetParamArray(unit, params, "filters");
            for (uint i = 0; i < arrUnits.length(); i++)
                m_enemyUnit.insertLast(arrUnits[i].GetString());
        }
		
		void Initialize(SyncVerb verb, uint id, uint modId) override
		{
			m_syncVerb = verb;
			m_syncId = id;

			FilterModifier::Initialize(verb, id, modId);
		}

        bool Filter(PlayerBase@ player, Actor@ enemy) override
        {
           /* auto params = enemy.GetBehaviorParams();
 
            string eb = GetParamString(UnitPtr(), params, "beastiary-name", false);
			PrintError("You are attacking: "+ eb);
            if (eb is null)
                return false;

            return eb != -1;*/
			return false;
        }
    }
}