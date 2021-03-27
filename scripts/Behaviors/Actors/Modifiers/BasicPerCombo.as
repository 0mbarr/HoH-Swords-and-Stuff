namespace Modifiers
{
	class BasicPerCombo : Modifier
	{
		ivec2 m_dmgAdd;
		ivec2 m_dmgPower;
		ivec2 m_statsAdd;
		ivec2 m_armorAdd;
		int m_TotalCap;
		int m_combo;
		int m_scale;
		float m_damageMul;
		
	
		BasicPerCombo(UnitPtr unit, SValue& params)
		{
			m_dmgPower = ivec2(
				GetParamInt(unit, params, "attack-power", false, 0),
				GetParamInt(unit, params, "spell-power", false, 0));
				
			m_dmgAdd = ivec2(
				GetParamInt(unit, params, "physical-add", false, 0),
				GetParamInt(unit, params, "magical-add", false, 0));
			
			m_statsAdd = ivec2(
				GetParamInt(unit, params, "health", false, 0),
				GetParamInt(unit, params, "mana", false, 0));
				
			m_armorAdd = ivec2(
				GetParamInt(unit, params, "armor", false, 0),
				GetParamInt(unit, params, "resistance", false, 0));
				
			m_scale = GetParamInt(unit, params, "scale", false, 1);
			
			m_TotalCap = GetParamInt(unit, params, "total-cap", false, 10);
			
		}	

		bool HasDamagePower() override { return true;}
		
		bool HasStatsAdd() override { return true;}
		bool HasArmorAdd() override { return true;}
		
		ivec2 DamagePower(PlayerBase@ player, Actor@ enemy) override {
			return ivec2(
				min(int((m_dmgPower.x * player.m_comboCount)/m_scale), m_TotalCap),
				min(int((m_dmgPower.y * player.m_comboCount)/m_scale), m_TotalCap));
		}
		ivec2 AttackDamageAdd(PlayerBase@ player, Actor@ enemy, DamageInfo@ di) override { 
			return ivec2(
				min(int((m_dmgAdd.x * player.m_comboCount)/m_scale), m_TotalCap),
				min(int((m_dmgAdd.x * player.m_comboCount)/m_scale), m_TotalCap)); 
		}
		ivec2 StatsAdd(PlayerBase@ player) override { 
			return ivec2(
				min(int((m_statsAdd.x * player.m_comboCount)/m_scale), m_TotalCap),
				min(int((m_statsAdd.y * player.m_comboCount)/m_scale), m_TotalCap));
		}
		vec2 ArmorAdd(PlayerBase@ player, Actor@ enemy) override {
			return vec2(
				min((m_armorAdd.x * player.m_comboCount)/m_scale, m_TotalCap),
				min((m_armorAdd.y * player.m_comboCount)/m_scale, m_TotalCap));
		}
	}
}
