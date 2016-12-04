//---------------------------------------------------------------------------------------
//  FILE:    X2Effect_OverdriveMobility.uc
//  AUTHOR:  Warat Boonyanit
//  DATE:    03/DEC/2016
//  PURPOSE: Mobility boost effect.
//---------------------------------------------------------------------------------------

class X2Effect_OverdriveMobility extends X2Effect_ModifyStats
	config(BashPatch);

var config int OverdriveMobility_Increase;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local StatChange MobilityChange;
	
	MobilityChange.StatType = eStat_Mobility;
	MobilityChange.StatAmount = default.OverdriveMobility_Increase;
	NewEffectState.StatChanges.AddItem(MobilityChange);

	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}
