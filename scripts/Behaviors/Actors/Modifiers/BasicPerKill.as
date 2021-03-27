namespace Modifiers
{
	class HealthPerKill : Modifier
	{
		int m_killPer;
		int m_healthCap;
		int m_manaCap;
		int m_initialKills;
		int m_currentKills;
	
		HealthPerKill(UnitPtr unit, SValue& params)
		{
			m_initialKills = player.m_record.statisticsSession.GetStatInt("enemies-killed");
			Print(m_initialKills);
			m_killPer = GetParamInt(unit, params, "kills", false, 100);
			m_healthCap = GetParamInt(unit, params, "health-cap", false, 0);
			m_manaCap = GetParamInt(unit, params, "mana-cap", false, 0);
		}	

		bool HasStatsAdd() override { return true; }
		bool HasUpdate() override { return true; }
	
		void Update(int dt) override {
			m_currentKills = player.m_record.statisticsSession.GetStatInt("enemies-killed");
			Print(m_currentKills - m_initialKills);
		}
		
		ivec2 StatsAdd(PlayerBase@ player) override { 
		return ivec2(
			int(min(m_healthCap,((player.m_record.statisticsSession.GetStatInt("enemies-killed") - m_initialKills)/m_killPer))),
			int(min(m_manaCap,((player.m_record.statisticsSession.GetStatInt("enemies-killed") - m_initialKills)/m_killPer))));
		}
	}
}