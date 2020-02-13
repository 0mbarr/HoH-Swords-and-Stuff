class ChanceApplyBuff : IEffect
{
	ActorBuffDef@ m_buff;
	bool m_ignoreIntensity;
	uint m_weaponInfo;
	float m_chance;

	ChanceApplyBuff(UnitPtr unit, SValue& params)
	{
		@m_buff = LoadActorBuff(GetParamString(unit, params, "buff"));
		m_ignoreIntensity = GetParamBool(unit, params, "ignore-intensity", false, false);
		m_chance = GetParamFloat(unit, params, "chance", false, 1.0);	
	}
	
	void SetWeaponInformation(uint weapon)
	{
		m_weaponInfo = weapon;
	}

	bool Apply(Actor@ owner, UnitPtr target, vec2 pos, vec2 dir, float intensity, bool husk)
	{
		if (!CanApply(owner, target, pos, dir, intensity))
			return false;
			
		if (!FilterHuskDamage(owner, target, husk))
			return false;
			
		if (randf() > m_chance)
			return false;
			
		Actor@ actor = cast<Actor>(target.GetScriptBehavior());
		return actor.ApplyBuff(ActorBuff(owner, m_buff, m_ignoreIntensity ? 1.0f : intensity, false, m_weaponInfo));
	}

	bool CanApply(Actor@ owner, UnitPtr target, vec2 pos, vec2 dir, float intensity) override
	{
		if (!target.IsValid())
			return false;

		if (m_buff is null)
			return false;
			
		if (intensity <= 0)
			return false;

		Actor@ actor = cast<Actor>(target.GetScriptBehavior());
		if (actor is null)
			return false;

		return true;
	}
}