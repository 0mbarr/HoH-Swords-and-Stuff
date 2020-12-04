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

            /*if (cast<Miniboss>(enemy) !is null){
            PrintError("Is Miniboss: True");
            }
            else{
            PrintError("Is Miniboss: False");
            }*/
            return cast<Miniboss>(enemy) !is null;
        }
    }
}