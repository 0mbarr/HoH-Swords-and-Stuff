namespace Modifiers
{
    class MinibossFilter : FilterModifier
    {
        MinibossFilter(UnitPtr unit, SValue& params)
        {
            super(unit, params);
        }

        void Initialize(SyncVerb verb, uint id, uint modId) override
        {
            m_syncVerb = verb;
            m_syncId = id;

            FilterModifier::Initialize(verb, id, modId);
        }

        bool Filter(PlayerBase@ player, Actor@ enemy) override
        {
            return cast<Miniboss>(enemy) !is null;
        }
    }
}