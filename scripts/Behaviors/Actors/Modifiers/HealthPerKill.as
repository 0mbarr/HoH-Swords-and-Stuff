namespace Modifiers
{
	class HealthPerKill : Modifier
	{
		int m_killPer;
		int m_healthCap;
	
		HealthPerKill(UnitPtr unit, SValue& params)
		{
			m_killPer = GetParamInt(unit, params, "kills", false, 100);
			m_healthCap = GetParamInt(unit, params, "health-cap", false, 300);
		}	

		bool HasStatsAdd() override { return true; }
		ivec2 StatsAdd(PlayerBase@ player) override { 
		return ivec2((min(m_healthCap,(player.m_record.statisticsSession.GetStatInt("enemies-killed")/m_killPer))),0);}
	}
}