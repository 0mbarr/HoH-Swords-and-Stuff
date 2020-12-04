namespace Modifiers
{
	class DamagePerKill : Modifier
	{
		float m_dmgScale;
		float m_dmgCap;
		float m_damageMul;
		int m_initialKills;
	
		DamagePerKill(UnitPtr unit, SValue& params)
		{
			m_dmgScale = GetParamFloat(unit, params, "dmg-per-kill", false, 0.00005);
			m_dmgCap = GetParamFloat(unit, params, "dmg-cap", false, 10);
			
			m_damageMul *= GetParamFloat(unit, params, "mul", false, 1);
		}	

		bool HasDamageMul() override { return true; }
		
		vec2 DamageMul(PlayerBase@ player, Actor@ enemy) override{ 
			return vec2(1.0f + min(m_dmgCap, (player.m_record.statisticsSession.GetStatInt("enemies-killed")-m_initialKills) * m_dmgScale));}
	}
}
