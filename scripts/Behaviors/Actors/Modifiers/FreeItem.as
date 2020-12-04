namespace Modifiers
{
	class FreeItem : Modifier
	{
		int m_items;
		int m_initialBought;
		
		FreeItem (UnitPtr unit, SValue& params)
		{
			m_items = GetParamInt(unit, params, "items", false, 0);
	
		}
		
		/*float ShopCostMul(float ShopCostMul(PlayerBase@ player, Upgrades::UpgradeStep@ step) override
		{
			
		}*/
	}
}