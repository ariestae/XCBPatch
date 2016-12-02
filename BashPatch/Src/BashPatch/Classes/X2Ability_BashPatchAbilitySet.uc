//---------------------------------------------------------------------------------------
//  FILE:    X2Ability_BashPatchAbilitySet
//  AUTHOR:  Warat Boonyanit
//  PURPOSE: Defines ability templates
//--------------------------------------------------------------------------------------- 

class X2Ability_BashPatchAbilitySet extends X2Ability
	config(BashPatch);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(AddCenterMassAbility());
	Templates.AddItem(PurePassive('HeatEnd', "img:///UILibrary_EMG_Pugilist.UIPerk_burning_finger"));
	return Templates;
}