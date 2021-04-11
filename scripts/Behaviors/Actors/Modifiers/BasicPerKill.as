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
			auto player = GetLocalPlayerRecord();
			m_initialKills = player.statisticsSession.GetStatInt("enemies-killed");
			print(m_initialKills);
			m_killPer = GetParamInt(unit, params, "kills", false, 100);
			m_healthCap = GetParamInt(unit, params, "health-cap", false, 0);
			m_manaCap = GetParamInt(unit, params, "mana-cap", false, 0);
		}	

		bool HasStatsAdd() override { return true; }
		bool HasUpdate() override { return true; }
		
		ivec2 StatsAdd(PlayerBase@ player) override { 
		return ivec2(
			int(min(m_healthCap,int((player.m_record.statisticsSession.GetStatInt("enemies-killed") - m_initialKills)/m_killPer))),
			int(min(m_manaCap, int((player.m_record.statisticsSession.GetStatInt("enemies-killed") - m_initialKills)/m_killPer))));
		}
	}
}