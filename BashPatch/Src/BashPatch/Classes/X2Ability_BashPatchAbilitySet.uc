//---------------------------------------------------------------------------------------
//  FILE:    X2Ability_BashPatchAbilitySet
//  AUTHOR:  Warat Boonyanit
//  PURPOSE: Defines ability templates
//--------------------------------------------------------------------------------------- 

class X2Ability_BashPatchAbilitySet extends XMBAbility
	config(BashPatch);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(PurePassive('HeatEnd', "img:///UILibrary_PerkIcons.UIPerk_bigbooms"));
	Templates.AddItem(PurePassive('ElbowRocket', "img:///UILibrary_PerkIcons.UIPerk_coupdegrace"));
	Templates.AddItem(Rocketeer());
	Templates.AddItem(Blitz());
	return Templates;
}

// Perk name:		Rocketeer
// Perk effect:		Your equipped heavy weapon gets an additional use.
// Localized text:	"Your equipped heavy weapon gets an additional use."
// Config:			(AbilityName="Rocketeer")
static function X2AbilityTemplate Rocketeer()
{
	local XMBEffect_AddItemChargesBySlot Effect;
	local X2AbilityTemplate Template;

	// Create an effect that adds a charge to the equipped heavy weapon
	Effect = new class'XMBEffect_AddItemChargesBySlot';
	Effect.ApplyToSlots.AddItem(eInvSlot_HeavyWeapon);
	Effect.PerItemBonus = 1;

	// The effect isn't an X2Effect_Persistent, so we can't use it as the effect for Passive(). Let
	// Passive() create its own effect.
	Template = Passive('Rocketeer', "img:///UILibrary_PerkIcons.UIPerk_rocketeer", false);

	// Add the XMBEffect_AddItemChargesBySlot as an extra effect.
	AddSecondaryEffect(Template, Effect);

	return Template;
}

// Perk name:		Blitz
// Perk effect:		Overdrive add mobility.
// Localized text:	"Activate overdrive now increase mobility."
// Config:			(AbilityName="Blitz")
static function X2AbilityTemplate Blitz()
{
	local X2AbilityTemplate			Template;

	Template = PurePassive('Blitz', "img:///UILibrary_PerkIcons.UIPerk_sprinter", false, 'eAbilitySource_Perk', true);
	Template.RemoveTemplateAvailablility(Template.BITFIELD_GAMEAREA_Multiplayer);

	return Template;
}

// Perk name:		Overclocking
// Perk effect:		Reduce Overdrive ability's cooldown by one turn whenever you take damage.
// Localized text:	"Reduce Overdrive ability's cooldown by one turn whenever you take damage."
// Config:			(AbilityName="Overclocking")
static function X2AbilityTemplate Overclocking()
{
	local X2Effect_ReduceCooldowns	Effect;
	local X2AbilityTemplate			Template;

	// Create an effect that completely resets the Bull Rush cooldown
	Effect = new class'X2Effect_ReduceCooldowns';
	Effect.AbilitiesToTick.AddItem('Overdrive');

	// Create a triggered ability that activates when the unit takes damage
	Template = SelfTargetTrigger('Overclocking', "img:///UILibrary_PerkIcons.UIPerk_dazed", false, Effect, 'UnitTakeEffectDamage');

	AddIconPassive(Template);

	return Template;
}