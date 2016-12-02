//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_BashPatch.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_BashPatch extends X2DownloadableContentInfo;
	config(BashPatch);

var config int HeatEndBurnDamage;
var config int HeatEndBurnSpread;
	
/// <summary>
/// Called after the Templates have been created (but before they are validated) while this DLC / Mod is installed.
/// </summary>
static event OnPostTemplatesCreated()
{
	local X2ItemTemplateManager			ItemTemplateManager;
	local X2WeaponTemplate				WeaponTemplate;
	local X2SchematicTemplate			SchematicTemplate;
	
	local X2AbilityTemplateManager			AbilityTemplateManager;
	local X2AbilityTemplate					AbilityTemplate;
	local X2Condition_AbilityProperty       BurningCondition;
	local X2Effect_Burning					BurningEffect;

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	//Genji Sword
	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('OWODACHI_MG'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'Sword_MG_Schematic';
		`log("BashPatch mods OWODACHI_MG");
	}

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('OWODACHI_BM'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'Sword_BM_Schematic';
		`log("BashPatch mods OWODACHI_BM");
	}

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('OWWAKIZASHI_MG'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'Sword_MG_Schematic';
		`log("BashPatch mods OWWAKIZASHI_MG");
	}

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('OWWAKIZASHI_BM'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'Sword_BM_Schematic';
		`log("BashPatch mods OWWAKIZASHI_BM");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('OWODACHI_MG_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods CombatKnife_MG_Schematic");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('OWODACHI_BM_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods CombatKnife_BM_Schematic");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('OWWAKIZASHI_MG_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods OWWAKIZASHI_MG_Schematic");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('OWWAKIZASHI_BM_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods OWWAKIZASHI_BM_Schematic");
	}

	//Throwing Knife
	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('ThrowingKnife_CV'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = '';
		WeaponTemplate.StartingItem = true;
		`log("BashPatch mods ThrowingKnife_CV");
	}
	
	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('ThrowingKnife_MG'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'Sword_MG_Schematic';
		`log("BashPatch mods ThrowingKnife_MG");
	}

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('ThrowingKnife_BM'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'Sword_BM_Schematic';
		`log("BashPatch mods ThrowingKnife_BM");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('ThrowingKnife_CV_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods ThrowingKnife_CV_Schematic");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('ThrowingKnife_MG_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods ThrowingKnife_MG_Schematic");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('ThrowingKnife_BM_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods ThrowingKnife_BM_Schematic");
	}

	//Combat Knife
	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('CombatKnife_MG'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'Sword_MG_Schematic';
		`log("BashPatch mods CombatKnife_MG");
	}

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('CombatKnife_BM'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'Sword_BM_Schematic';
		`log("BashPatch mods CombatKnife_BM");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('CombatKnife_MG_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods CombatKnife_MG_Schematic");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('CombatKnife_BM_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods CombatKnife_BM_Schematic");
	}

	//SMG
	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('SMG_MG'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'AssaultRifle_MG_Schematic';
		`log("BashPatch mods CombatKnife_MG");
	}

	WeaponTemplate = X2WeaponTemplate(ItemTemplateManager.FindItemTemplate('SMG_BM'));
	if (WeaponTemplate != none)
	{
		WeaponTemplate.CreatorTemplateName = 'AssaultRifle_BM_Schematic';
		`log("BashPatch mods CombatKnife_BM");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('SMG_MG_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods SMG_MG_Schematic");
	}

	SchematicTemplate = X2SchematicTemplate(ItemTemplateManager.FindItemTemplate('SMG_BM_Schematic'));
	if (SchematicTemplate != none)
	{
		SchematicTemplate.CanBeBuilt = false;
		`log("BashPatch mods SMG_BM_Schematic");
	}
	
	//SPARK Strike
	AbilityTemplate = AbilityTemplateManager.FindAbilityTemplate('Strike');
	if (AbilityTemplate != none)
	{
		BurningEffect = class'X2StatusEffects'.static.CreateBurningStatusEffect(default.HeatEndBurnDamage, default.HeatEndBurnSpread);
		BurningCondition = new class'X2Condition_AbilityProperty';
		BurningCondition.OwnerHasSoldierAbilities.AddItem('HeatEnd');
		BurningEffect.TargetConditions.AddItem(BurningCondition);
		AbilityTemplate.AddTargetEffect(BurningEffect);
	}
}
