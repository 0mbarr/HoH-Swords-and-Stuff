namespace Upgrades
{
	class sas_DungeonShop : DungeonShop
	{	
		sas_DungeonShop(SValue& params)
		{
			super(params);

			@m_sval = params;
		}

		void OnOpenMenu(int shopLevel, PlayerRecord@ record) override
		{
			m_maxItems += 2;
		}
	}
}