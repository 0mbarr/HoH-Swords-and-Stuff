namespace Modifiers
{
	class DamagePerKill : Modifier
	{
		ivec2 m_dmgPower;
		ivec2 m_dmgAdd;
		float m_dmgScale;
		float m_dmgMulCap;
		int m_initialKills;
		int m_currentKills;
	
		DamagePerKill(UnitPtr unit, SValue& params)
		{
			m_initialKills = player.m_record.statisticsSession.GetStatInt("enemies-killed");
			Print(m_initialKills);
			
			m_dmgPower = ivec2(
				GetParamInt(unit, params, "attack-power", false, 0),
				GetParamInt(unit, params, "spell-power", false, 0));
			
			m_dmgAdd = ivec2(
				GetParamInt(unit, params, "physical-add", false, 0),
				GetParamInt(unit, params, "magical-add", false, 0));
				
			m_dmgMulCap = GetParamFloat(unit, params, "dmg-mul-cap", false, 0);
			
			m_dmgScale = GetParamFloat(unit, params, "dmg-per-kill", false, 0.0005);
		}	
		
		bool HasDamagePower() override { return true;}
		bool HasDamageMul() override { return true; }
		bool HasUpdate() override { return true; }
	
		void Update(int dt) override {
			m_currentKills = player.m_record.statisticsSession.GetStatInt("enemies-killed");
			Print(m_currentKills - m_initialKills);
		}
		
		ivec2 DamagePower(PlayerBase@ player, Actor@ enemy) override {
			return ivec2(
				int(min(m_dmgPower.x , ((m_currentKills - m_initialKills) * m_dmgScale))),
				int(min(m_dmgPower.y , ((m_currentKills - m_initialKills) * m_dmgScale)))); 
		}
		
		ivec2 AttackDamageAdd(PlayerBase@ player, Actor@ enemy, DamageInfo@ di) override { 
			return ivec2(
				int(min(m_dmgAdd.x , ((m_currentKills - m_initialKills) * m_dmgScale))),
				int(min(m_dmgAdd.y , ((m_currentKills - m_initialKills) * m_dmgScale)))); 
		}
		
		vec2 DamageMul(PlayerBase@ player, Actor@ enemy) override{ 
			return vec2(1.0f + min(m_dmgMulCap, (m_currentKills - m_initialKills) * m_dmgScale));
		}
	}
}
