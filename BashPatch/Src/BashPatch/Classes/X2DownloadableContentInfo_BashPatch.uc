//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_BashPatch.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_BashPatch extends X2DownloadableContentInfo
	config(BashPatch);

var config int HeatEndBurnDamage;
var config int HeatEndBurnSpread;
//var config int ElbowRocket_Damage;
//var config int ElbowRocket_Pierce;
	
/// <summary>
/// Called after the Templates have been created (but before they are validated) while this DLC / Mod is installed.
/// </summary>
static event OnPostTemplatesCreated()
{
	updateWeapons();
	updateSchematic();
	updateAbilities();
}

static function updateWeapons()
{
    local X2ItemTemplateManager			ItemTemplateMan;
    local array<X2WeaponTemplate>		AllWeaponTemplates, WeaponDifficultyTemplates;
    local X2WeaponTemplate				WeaponTemplate, DifficultyTemplate;

    ItemTemplateMan = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
    AllWeaponTemplates = ItemTemplateMan.GetAllWeaponTemplates();

    foreach AllWeaponTemplates(WeaponTemplate)
    {
		WeaponDifficultyTemplates = FindWeaponDifficultyTemplates(WeaponTemplate.DataName);
        foreach WeaponDifficultyTemplates(DifficultyTemplate)
        {
			//Genji Sword
			if (DifficultyTemplate.Dataname == 'OWODACHI_MG')
			{
				DifficultyTemplate.CreatorTemplateName = 'Sword_MG_Schematic';
				`log("BashPatch mods OWODACHI_MG");
			}

			if (DifficultyTemplate.Dataname == 'OWODACHI_BM')
			{
				DifficultyTemplate.CreatorTemplateName = 'Sword_BM_Schematic';
				`log("BashPatch mods OWODACHI_BM");
			}

			if (DifficultyTemplate.Dataname == 'OWWAKIZASHI_MG')
			{
				DifficultyTemplate.CreatorTemplateName = 'Sword_MG_Schematic';
				`log("BashPatch mods OWWAKIZASHI_MG");
			}

			if (DifficultyTemplate.Dataname == 'OWWAKIZASHI_BM')
			{
				DifficultyTemplate.CreatorTemplateName = 'Sword_BM_Schematic';
				`log("BashPatch mods OWWAKIZASHI_BM");
			}

			//Throwing Knife
			if (DifficultyTemplate.Dataname == 'ThrowingKnife_CV')
			{
				DifficultyTemplate.CreatorTemplateName = '';
				DifficultyTemplate.StartingItem = true;
				`log("BashPatch mods ThrowingKnife_CV");
			}

			if (DifficultyTemplate.Dataname == 'ThrowingKnife_MG')
			{
				DifficultyTemplate.CreatorTemplateName = 'Sword_MG_Schematic';
				`log("BashPatch mods ThrowingKnife_MG");
			}

			if (DifficultyTemplate.Dataname == 'ThrowingKnife_BM')
			{
				DifficultyTemplate.CreatorTemplateName = 'Sword_BM_Schematic';
				`log("BashPatch mods ThrowingKnife_BM");
			}

			//Combat Knife
			if (DifficultyTemplate.Dataname == 'CombatKnife_MG')
			{
				DifficultyTemplate.CreatorTemplateName = 'Sword_MG_Schematic';
				`log("BashPatch mods CombatKnife_MG");
			}

			if (DifficultyTemplate.Dataname == 'CombatKnife_BM')
			{
				DifficultyTemplate.CreatorTemplateName = 'Sword_BM_Schematic';
				`log("BashPatch mods CombatKnife_BM");
			}

			//SMG
			if (DifficultyTemplate.Dataname == 'SMG_MG')
			{
				DifficultyTemplate.CreatorTemplateName = 'AssaultRifle_MG_Schematic';
				`log("BashPatch mods SMG_MG");
			}

			if (DifficultyTemplate.Dataname == 'SMG_BM')
			{
				DifficultyTemplate.CreatorTemplateName = 'AssaultRifle_BM_Schematic';
				`log("BashPatch mods SMG_BM");
			}
		}
	}
}

static function updateSchematic()
{
    local X2ItemTemplateManager			ItemTemplateMan;
    local array<X2SchematicTemplate>	AllSchematicTemplates, SchematicDifficultyTemplates;
    local X2SchematicTemplate			SchematicTemplate, DifficultyTemplate;

    ItemTemplateMan = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
    AllSchematicTemplates = ItemTemplateMan.GetAllSchematicTemplates();

    foreach AllSchematicTemplates(SchematicTemplate)
    {
		SchematicDifficultyTemplates = FindSchematicDifficultyTemplates(SchematicTemplate.DataName);
        foreach SchematicDifficultyTemplates(DifficultyTemplate)
        {
			//Genji Sword
			if (DifficultyTemplate.Dataname == 'OWODACHI_MG_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods OWODACHI_MG_Schematic");
			}

			if (DifficultyTemplate.Dataname == 'OWODACHI_BM_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods OWODACHI_BM_Schematic");
			}

			if (DifficultyTemplate.Dataname == 'OWWAKIZASHI_MG_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods OWWAKIZASHI_MG_Schematic");
			}

			if (DifficultyTemplate.Dataname == 'OWWAKIZASHI_BM_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods OWWAKIZASHI_BM_Schematic");
			}

			//Throwing Knife
			if (DifficultyTemplate.Dataname == 'ThrowingKnife_CV_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods ThrowingKnife_CV_Schematic");
			}

			if (DifficultyTemplate.Dataname == 'ThrowingKnife_MG_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods ThrowingKnife_MG_Schematic");
			}

			if (DifficultyTemplate.Dataname == 'ThrowingKnife_BM_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods ThrowingKnife_BM_Schematic");
			}

			//Combat Knife
			if (DifficultyTemplate.Dataname == 'CombatKnife_MG_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods CombatKnife_MG_Schematic");
			}

			if (DifficultyTemplate.Dataname == 'CombatKnife_BM_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods CombatKnife_BM_Schematic");
			}

			//SMG
			if (DifficultyTemplate.Dataname == 'SMG_MG_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods SMG_MG_Schematic");
			}

			if (DifficultyTemplate.Dataname == 'SMG_BM_Schematic')
			{
				DifficultyTemplate.CanBeBuilt = false;
				`log("BashPatch mods SMG_BM_Schematic");
			}
		}
	}
}

static function updateAbilities()
{
	local X2AbilityTemplateManager			AbilityTemplateManager;
	local X2AbilityTemplate					AbilityTemplate;
	local X2Condition_AbilityProperty       BurningCondition;
	local X2Effect_Burning					BurningEffect;
	local X2Condition_AbilityProperty		AbilityCondition;
	local X2Effect_ApplyWeaponDamage		WeaponDamageEffect;
	local X2Effect_OverdriveMobility		OverdriveMobility;

	AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	//SPARK Strike
	AbilityTemplate = AbilityTemplateManager.FindAbilityTemplate('Strike');
	if (AbilityTemplate != none)
	{
		BurningEffect = class'X2StatusEffects'.static.CreateBurningStatusEffect(default.HeatEndBurnDamage, default.HeatEndBurnSpread);
		BurningCondition = new class'X2Condition_AbilityProperty';
		BurningCondition.OwnerHasSoldierAbilities.AddItem('HeatEnd');
		BurningEffect.TargetConditions.AddItem(BurningCondition);
		AbilityTemplate.AddTargetEffect(BurningEffect);

		//WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
		//WeaponDamageEffect.bIgnoreBaseDamage = true;
		//WeaponDamageEffect.EffectDamageValue.Damage = default.ElbowRocket_Damage;
		//WeaponDamageEffect.EffectDamageValue.Pierce = default.ElbowRocket_Pierce;
		//AbilityCondition = new class'X2Condition_AbilityProperty';
		//AbilityCondition.OwnerHasSoldierAbilities.AddItem('ElbowRocket');
		//WeaponDamageEffect.TargetConditions.AddItem(AbilityCondition);
		//AbilityTemplate.AddTargetEffect(WeaponDamageEffect);
	}

	//SPARK Overdrive
	AbilityTemplate = AbilityTemplateManager.FindAbilityTemplate('Overdrive');
	if (AbilityTemplate != none)
	{
		OverdriveMobility = new class'X2Effect_OverdriveMobility';
		OverdriveMobility.EffectName = 'BlitzPerk';
		OverdriveMobility.BuildPersistentEffect( 1, false, true, false, eGameRule_PlayerTurnEnd );
		AbilityCondition = new class'X2Condition_AbilityProperty';
		AbilityCondition.OwnerHasSoldierAbilities.AddItem('Blitz');
		OverdriveMobility.TargetConditions.AddItem(AbilityCondition);
		AbilityTemplate.AddTargetEffect(OverdriveMobility);
	}
}

static function array<X2WeaponTemplate> FindWeaponDifficultyTemplates(name DataName)
{
    local X2ItemTemplateManager ItemTemplateMan;
    local array<X2DataTemplate> DataTemplates;
    local X2DataTemplate DataTemplate;
    local array<X2WeaponTemplate> WeaponTemplates;
    local X2WeaponTemplate WeaponTemplate;

    ItemTemplateMan = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
    ItemTemplateMan.FindDataTemplateAllDifficulties(DataName, DataTemplates);

    foreach DataTemplates(DataTemplate)
    {
        WeaponTemplate = X2WeaponTemplate(DataTemplate);
        if( WeaponTemplate != none )
        {
           WeaponTemplates.AddItem(WeaponTemplate);
        }
    }

    return WeaponTemplates;
}

static function array<X2SchematicTemplate> FindSchematicDifficultyTemplates(name DataName)
{
    local X2ItemTemplateManager ItemTemplateMan;
    local array<X2DataTemplate> DataTemplates;
    local X2DataTemplate DataTemplate;
    local array<X2SchematicTemplate> SchematicTemplates;
    local X2SchematicTemplate SchematicTemplate;

    ItemTemplateMan = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
    ItemTemplateMan.FindDataTemplateAllDifficulties(DataName, DataTemplates);

    foreach DataTemplates(DataTemplate)
    {
        SchematicTemplate = X2SchematicTemplate(DataTemplate);
        if( SchematicTemplate != none )
		{
			SchematicTemplates.AddItem(SchematicTemplate);
		}
	}

	return SchematicTemplates;
}