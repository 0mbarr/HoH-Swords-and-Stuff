class ChanceApplyBuff : ApplyBuff
{
	float m_chance;

	ChanceApplyBuff(UnitPtr unit, SValue& params)
	{
		super(unit, params);

		m_chance = GetParamFloat(unit, params, "chance", false, 1.0);	
	}

	bool CanApply(Actor@ owner, UnitPtr target, vec2 pos, vec2 dir, float intensity) override
	{	
		if (randf() > m_chance)
			return false;

		if (!target.IsValid())
			return false;

		if (m_buff is null)
			return false;
			
		if (intensity <= 0)
			return false;

		if (!m_targetSelf)
		{
			Actor@ actor = cast<Actor>(target.GetScriptBehavior());
			if (actor is null)
				return false;
		}

		return true;
	}
}