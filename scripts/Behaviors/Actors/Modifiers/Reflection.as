namespace Modifiers
{
	class Reflection : Modifier
	{
		int m_physical;
		int m_magical;
		ivec2 m_amount;
		
		Reflection(UnitPtr unit, SValue& params)
		{
			m_physical = GetParamInt(unit, params, "physical", false, 0);
			m_magical = GetParamInt(unit, params, "magical", false, 0);
			m_amount = ivec2(m_physical, m_magical);
		}

		bool HasDamageTaken() override { return true; }
		bool HasDamageBlock() override { return true; }
		
		void DamageTaken(PlayerBase@ player, Actor@ enemy, int dmgAmnt) override 
		{
			if (enemy is null || enemy.IsDead())
				return;
				
			vec2 pos = xy(enemy.m_unit.GetPosition());
			vec2 dir = normalize(xy(enemy.m_unit.GetPosition() - player.m_unit.GetPosition()));
			
			uint weaponInfo = 0;
		
			auto dmg = DamageInfo(player,int(min(dmgAmnt, m_physical)), int(min(dmgAmnt, m_magical)), false, true, weaponInfo);
			dmg.LifestealMul = 0;

			enemy.Damage(dmg, pos, dir);
		}
		ivec2 DamageBlock(PlayerBase@ player, Actor@ enemy) override
		{
			return m_amount;
		}
	}
}