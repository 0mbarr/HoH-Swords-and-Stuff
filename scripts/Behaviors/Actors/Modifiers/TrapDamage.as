namespace Modifiers
{
	class TrapDamage : Modifier
	{
		float m_trapMultiplier;
	
		TrapDamage(UnitPtr unit, SValue& params)
		{
			m_trapMultiplier = GetParamFloat(unit, params, "trap-mul", false, 1);
		}	
		
		bool HasDamageTakenMul() override { return true; }
		
		float DamageTakenMul(PlayerBase@ player, DamageInfo &di) override { 
			if (di.Attacker is null)
				return m_trapMultiplier;
			else
				return 1.0f;
		}
	}
}