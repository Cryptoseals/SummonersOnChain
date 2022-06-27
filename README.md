# Advanced Sample Hardhat Project

This project demonstrates an advanced Hardhat use case, integrating other tools commonly used alongside Hardhat in the ecosystem.

The project comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts. It also comes with a variety of other tools, preconfigured to work with the project code.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
npx hardhat help
REPORT_GAS=true npx hardhat test
npx hardhat coverage
npx hardhat run scripts/deploy.ts
TS_NODE_FILES=true npx ts-node scripts/deploy.ts
npx eslint '**/*.{js,ts}'
npx eslint '**/*.{js,ts}' --fix
npx prettier '**/*.{json,sol,md}' --check
npx prettier '**/*.{json,sol,md}' --write
npx solhint 'contracts/**/*.sol'
npx solhint 'contracts/**/*.sol' --fix
```

# Etherscan verification

To try out Etherscan verification, you first need to deploy a contract to an Ethereum network that's supported by Etherscan, such as Ropsten.

In this project, copy the .env.example file to a file named .env, and then edit it to fill in the details. Enter your Etherscan API key, your Ropsten node URL (eg from Alchemy), and the private key of the account which will send the deployment transaction. With a valid .env file in place, first deploy your contract:

```shell
hardhat run --network ropsten scripts/deploy.ts
```

Then, copy the deployment address and paste it in to replace `DEPLOYED_CONTRACT_ADDRESS` in this command:

```shell
npx hardhat verify --network ropsten DEPLOYED_CONTRACT_ADDRESS "Hello, Hardhat!"
```

# Performance optimizations

For faster runs of your tests and scripts, consider skipping ts-node's type checking by setting the environment variable `TS_NODE_TRANSPILE_ONLY` to `1` in hardhat's environment. For more details see [the documentation](https://hardhat.org/guides/typescript.html#performance-optimizations).



TREE:

contracts
├── Adventures <br/>
│   ├── AdventureControls.sol <br/>
│   └── Adventures.sol <br/>
├── Attributes <br/>
│   └── Attributes.sol <br/>
├── BattleEngine <br/>
│   ├── 1V1 <br/>
│   └── GuildWars <br/>
├── Boss <br/>
├── Chests <br/>
│   └── Chests.sol <br/>
├── Codex <br/>
│   ├── Adventures <br/>
│   │   ├── CodexArea1.sol <br/>
│   │   ├── CodexArea10.sol <br/>
│   │   ├── CodexArea11.sol <br/>
│   │   ├── CodexArea2.sol <br/>
│   │   ├── CodexArea3.sol <br/>
│   │   ├── CodexArea4.sol <br/>
│   │   ├── CodexArea5.sol <br/>
│   │   ├── CodexArea6.sol <br/>
│   │   ├── CodexArea7.sol <br/>
│   │   ├── CodexArea8.sol <br/>
│   │   └── CodexArea9.sol <br/>
│   ├── CodexAdventures.sol <br/>
│   ├── CodexArtifacts.sol <br/>
│   ├── CodexElixirRecipes.sol <br/>
│   ├── CodexElixirs.sol <br/>
│   ├── CodexExpCards.sol <br/>
│   ├── CodexJobs.sol <br/>
│   ├── CodexMisc.sol <br/>
│   ├── CodexMounts.sol <br/>
│   ├── CodexPrefixes.sol <br/>
│   ├── CodexRandom.sol <br/>
│   ├── CodexSuffixes.sol <br/>
│   ├── Common <br/>
│   │   ├── Rarity.sol <br/>
│   │   └── UpgradeableCodex.sol <br/>
│   ├── Enemies <br/>
│   │   ├── BaseEnemyStats.sol <br/>
│   │   ├── CodexEnemies.sol <br/>
│   │   ├── CodexEnemiesArcane.sol <br/>
│   │   ├── CodexEnemiesCold.sol <br/>
│   │   ├── CodexEnemiesDark.sol <br/>
│   │   ├── CodexEnemiesEarth.sol <br/>
│   │   ├── CodexEnemiesFire.sol <br/>
│   │   ├── CodexEnemiesHoly.sol <br/>
│   │   ├── CodexEnemiesLightning.sol <br/>
│   │   ├── CodexEnemiesPhysical.sol <br/>
│   │   └── CodexEnemiesVoid.sol <br/>
│   ├── Items <br/>
│   │   ├── Accessories <br/>
│   │   │   ├── CodexAmulets.sol <br/>
│   │   │   ├── CodexBelts.sol <br/>
│   │   │   ├── CodexEarrings.sol <br/>
│   │   │   └── CodexRings.sol <br/>
│   │   ├── Armors <br/>
│   │   │   ├── CodexArmorHeavy.sol <br/>
│   │   │   ├── CodexArmorLight.sol <br/>
│   │   │   ├── CodexArmorMedium.sol <br/>
│   │   │   ├── CodexBootsHeavy.sol <br/>
│   │   │   ├── CodexBootsLight.sol <br/>
│   │   │   ├── CodexBootsMedium.sol <br/>
│   │   │   ├── CodexHelmetHeavy.sol <br/>
│   │   │   ├── CodexHelmetLight.sol <br/>
│   │   │   └── CodexHelmetMedium.sol <br/>
│   │   ├── CodexArmors.sol <br/>
│   │   ├── CodexBoots.sol <br/>
│   │   ├── CodexHelmets.sol <br/>
│   │   ├── CodexWeapons.sol <br/>
│   │   └── Weapons <br/>
│   │       ├── CodexAxes.sol <br/>
│   │       ├── CodexBows.sol <br/>
│   │       ├── CodexDaggers.sol <br/>
│   │       ├── CodexFocus.sol <br/>
│   │       ├── CodexShield.sol <br/>
│   │       ├── CodexStaff.sol <br/>
│   │       └── CodexSwords.sol <br/>
│   └── Spells <br/>
│       ├── CodexSpells.sol <br/>
│       ├── CodexSpellsArcane.sol <br/>
│       ├── CodexSpellsCold.sol <br/>
│       ├── CodexSpellsDark.sol <br/>
│       ├── CodexSpellsEarth.sol <br/>
│       ├── CodexSpellsFire.sol <br/>
│       ├── CodexSpellsGadgets.sol <br/>
│       ├── CodexSpellsHoly.sol <br/>
│       ├── CodexSpellsLightning.sol <br/>
│       ├── CodexSpellsPhysical.sol <br/>
│       ├── CodexSpellsRanged.sol <br/>
│       └── CodexSpellsVoid.sol <br/>
├── Core <br/>
│   ├── Calculator <br/>
│   │   └── Calculator.sol <br/>
│   ├── Common <br/>
│   │   └── Errors.sol <br/>
│   ├── GameState <br/>
│   │   └── GameState.sol <br/>
│   ├── Navigator <br/>
│   │   ├── InitNavigator.sol <br/>
│   │   ├── Navigator.sol <br/>
│   │   └── RewardNonce.sol <br/>
│   └── Security <br/>
│       └── Guard.sol <br/>
├── Crafting <br/>
│   ├── AccessoriesRecipes <br/>
│   │   ├── AmuletRecipes.sol <br/>
│   │   ├── BeltRecipes.sol <br/>
│   │   ├── EarringsRecipes.sol <br/>
│   │   └── RingRecipes.sol <br/>
│   ├── ArmorRecipes <br/>
│   │   ├── ArmorHeavyRecipes.sol <br/>
│   │   ├── ArmorLightRecipes.sol <br/>
│   │   ├── ArmorMediumRecipes .sol <br/>
│   │   ├── ArmorRecipes.sol <br/>
│   │   ├── BootsHeavyRecipes.sol <br/>
│   │   ├── BootsLightRecipes.sol <br/>
│   │   ├── BootsMediumRecipes.sol <br/>
│   │   ├── BootsRecipes.sol <br/>
│   │   ├── HelmetHeavyRecipes.sol <br/>
│   │   ├── HelmetLightRecipes.sol <br/>
│   │   ├── HelmetMediumRecipes.sol <br/>
│   │   └── HelmetRecipes.sol <br/>
│   ├── Crafting.sol <br/>
│   ├── MaterialRecipes <br/>
│   │   ├── ProcessingClothRecipes.sol <br/>
│   │   ├── ProcessingGemstoneRecipes.sol <br/>
│   │   ├── ProcessingLeatherRecipes.sol <br/>
│   │   ├── ProcessingOreRecipes.sol <br/>
│   │   ├── ProcessingWoodRecipes.sol <br/>
│   │   ├── UpgradingClothRecipes.sol <br/>
│   │   ├── UpgradingGemstoneRecipes.sol <br/>
│   │   ├── UpgradingLeatherRecipes.sol <br/>
│   │   ├── UpgradingOreRecipes.sol <br/>
│   │   └── UpgradingWoodRecipes.sol <br/>
│   └── WeaponRecipes <br/>
│       ├── AxeRecipes.sol <br/>
│       ├── BowRecipes.sol <br/>
│       ├── DaggerRecipes.sol <br/>
│       ├── FocusRecipes.sol <br/>
│       ├── ShieldRecipes.sol <br/>
│       ├── StaffRecipes.sol <br/>
│       ├── SwordRecipes.sol <br/>
│       └── WeaponRecipes.sol <br/>
├── Fishing <br/>
├── Fungibles <br/>
│   ├── Common <br/>
│   │   ├── FungibleAndClaimableInGameToken.sol <br/>
│   │   └── FungibleInGameToken.sol <br/>
│   ├── Essence <br/>
│   │   └── Essence.sol <br/>
│   └── Gold <br/>
│       └── Gold.sol <br/>
├── Guilds <br/>
│   └── Castles <br/>
├── Interfaces <br/>
│   ├── Adventures <br/>
│   ├── Artifacts <br/>
│   ├── Attributes <br/>
│   │   └── IAttributes.sol <br/>
│   ├── BattleEngine <br/>
│   │   ├── 1V1 <br/>
│   │   └── GuildWars <br/>
│   ├── Boss <br/>
│   ├── Chests <br/>
│   ├── Codex <br/>
│   │   ├── IAllCodexViews.sol <br/>
│   │   ├── IBaseEnemyStats.sol <br/>
│   │   ├── ICodexAdventures.sol <br/>
│   │   ├── ICodexAmulets.sol <br/>
│   │   ├── ICodexArmors.sol <br/>
│   │   ├── ICodexArtifacts.sol <br/>
│   │   ├── ICodexBelts.sol <br/>
│   │   ├── ICodexBoots.sol <br/>
│   │   ├── ICodexEarrings.sol <br/>
│   │   ├── ICodexElixirRecipes.sol <br/>
│   │   ├── ICodexElixirs.sol <br/>
│   │   ├── ICodexEnemies.sol <br/>
│   │   ├── ICodexExpCards.sol <br/>
│   │   ├── ICodexHelmets.sol <br/>
│   │   ├── ICodexJobs.sol <br/>
│   │   ├── ICodexMisc.sol <br/>
│   │   ├── ICodexPrefixAndSuffix.sol <br/>
│   │   ├── ICodexRandom.sol <br/>
│   │   ├── ICodexRings.sol <br/>
│   │   ├── ICodexSpells.sol <br/>
│   │   └── ICodexWeapons.sol <br/>
│   ├── Core <br/>
│   │   ├── Calculator <br/>
│   │   │   └── ICalculator.sol <br/>
│   │   ├── Constants <br/>
│   │   │   └── Constants.sol <br/>
│   │   ├── GameState <br/>
│   │   │   └── IGameState.sol <br/>
│   │   ├── Navigator <br/>
│   │   │   └── INavigator.sol <br/>
│   │   └── Security <br/>
│   │       └── IGuard.sol <br/>
│   ├── Crafting <br/>
│   │   ├── ICraftingRecipe.sol <br/>
│   │   └── Processing <br/>
│   │       └── IProcessingMaterialRecipes.sol <br/>
│   ├── Elixirs <br/>
│   ├── Fishing <br/>
│   ├── Fungibles <br/>
│   │   └── Common <br/>
│   │       └── IFungibleInGameToken.sol <br/>
│   ├── GameObjects <br/>
│   │   ├── IAdventure.sol <br/>
│   │   ├── ICrafting <br/>
│   │   │   └── ICraftingMaterials.sol <br/>
│   │   ├── IGameEntities.sol <br/>
│   │   ├── IGameObjects.sol <br/>
│   │   ├── IGameRewards.sol <br/>
│   │   ├── IGenericMetadata.sol <br/>
│   │   ├── IJob.sol <br/>
│   │   ├── IMonster.sol <br/>
│   │   └── ISpell.sol <br/>
│   ├── Guilds <br/>
│   │   └── Castles <br/>
│   ├── Inventory <br/>
│   │   ├── EquipableLibrary.sol <br/>
│   │   ├── IElixirAndArtifactSlots.sol <br/>
│   │   └── IEquipable.sol <br/>
│   ├── Jobs <br/>
│   ├── Lands <br/>
│   ├── NonFungibles <br/>
│   │   ├── Common <br/>
│   │   │   ├── ERC721A.sol <br/>
│   │   │   └── IRewardNonFungible.sol <br/>
│   │   ├── CraftingMaterials <br/>
│   │   │   └── ICraftingMaterialsToken.sol <br/>
│   │   ├── EXP <br/>
│   │   │   ├── EXPCardLib.sol <br/>
│   │   │   └── IExpCards.sol <br/>
│   │   ├── ElixirsAndArtifacts <br/>
│   │   │   └── IElixirsAndArtifacts.sol <br/>
│   │   └── EquipableItems <br/>
│   │       └── IEquipableItems.sol <br/>
│   ├── Profile <br/>
│   │   └── IProfile.sol <br/>
│   ├── Reward <br/>
│   │   └── IReward.sol <br/>
│   ├── Skills <br/>
│   │   └── ISkills.sol <br/>
│   └── Summoners <br/>
│       └── ISummoners.sol <br/>
├── Inventory <br/>
│   ├── Equipable.sol <br/>
│   └── EquipableUtils.sol <br/>
├── Jobs <br/>
│   └── Jobs.sol <br/>
├── Lands <br/>
├── Lib <br/>
│   ├── Base64.sol <br/>