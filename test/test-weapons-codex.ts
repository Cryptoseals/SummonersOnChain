// 0xc51b2f8E24acc0164ED2a5966b36Febeb20c510C
import {ethers, upgrades} from "hardhat";
import fs from "fs";

enum CONTRACT {
    SUMMONERS, // 0
    ATTRIBUTES, // 1
    SKILLS, // 2
    EQUIPABLE_ITEMS, // 4 NFTS
    INVENTORY, // 5 EQUIP SLOTS
    EXP, // 6
    GOLD, // 7
    ESSENCE, // 8
    SCRAPS, // 9
    JOB, // 10
    HELMETS_CODEX, //11
    ARMORS_CODEX, //12
    BOOTS_CODEX, // 13
    WEAPONS_CODEX, //14
    OFF_HANDS_CODEX, //15
    AMULETS_CODEX, //16
    RINGS_CODEX, //17
    EARRINGS_CODEX, //18
    BELTS_CODEX, //19
    ARTIFACTS_CODEX, //20
    ELIXIRS_CODEX, //21
    MOUNTS_CODEX, //22
    RANDOM_CODEX, //23
    CALCULATOR, // 24
    CRYPTO_SEAL, // 25
    ARTIFACT_AND_ELIXIR_SLOTS, // 26
    ARTIFACTS,
    ELIXIRS,
    MISC_CODEX,
    MISC_ITEMS,
    PREFIX_CODEX,
    SUFFIX_CODEX,
    EXP_CARDS,
    FIRE_ENEMY_CODEX,
    COLD_ENEMY_CODEX,
    LIGHTNING_ENEMY_CODEX,
    EARTH_ENEMY_CODEX,
    DARK_ENEMY_CODEX,
    HOLY_ENEMY_CODEX,
    VOID_ENEMY_CODEX,
    PHYSICAL_ENEMY_CODEX,
    ARCANE_ENEMY_CODEX,
    SPELLS_CODEX,
    FIRE_SPELLS,
    COLD_SPELLS,
    EARTH_SPELLS,
    LIGHTNING_SPELLS,
    GADGET_SPELLS,
    PHYSICAL_SPELLS,
    ARCANE_SPELLS,
    DARK_SPELLS,
    HOLY_SPELLS,
    VOID_SPELLS,
    RANGED_SPELLS,
    BASE_ENEMY_STATS,
    CODEX_ENEMIES,
    CRAFTING,
    CRAFTING_MATERIALS,
    ORE_PROCESSING_RECIPES,
    WOOD_PROCESSING_RECIPES,
    CLOTH_PROCESSING_RECIPES,
    ORE_UPGRADING_RECIPES,
    WOOD_UPGRADING_RECIPES,
    CLOTH_UPGRADING_RECIPES,
    ARMOR_RECIPES,
    WEAPON_RECIPES,
    ELIXIR_RECIPES,
    ARTIFACT_RECIPES,
    SWORD_STATS,
    DAGGER_STATS,
    SHIELD_STATS,
    BOW_STATS,
    AXE_STATS,
    STAFF_STATS,
    FOCUS_STATS
}

describe("Weapon Codexs", () => {
    it('Should deploy navigator.', async () => {
        let Navigator;
        let navigator;
        let CodexStaves;
        let codexStaves;
        let CodexAxes;
        let codexAxes;
        let CodexSwords;
        let codexSwords;
        let CodexShields;
        let codexShields;
        let CodexFocuses;
        let codexFocuses;
        let CodexBows;
        let codexBows;
        let CodexDaggers;
        let codexDaggers;
        let CodexWeapons;
        let codexWeapons;
        let CodexPrefixes;
        let codexPrefixes;
        let CodexSuffixes;
        let codexSuffixes;
        let tx
        Navigator = await ethers.getContractFactory("Navigator");
        navigator = await upgrades.deployProxy(Navigator, [ethers.constants.AddressZero, 30], {
            initializer: "initialize"
        });
        await navigator.deployed()

        console.log("Navigator:", navigator.address)
        CodexPrefixes = await ethers.getContractFactory("CodexPrefixes")
        codexPrefixes = await upgrades.deployProxy(CodexPrefixes);
        await codexPrefixes.deployed()
        console.log("Prefix deployed to:", codexPrefixes.address,)
        tx = await navigator.setGameContractsById(CONTRACT.PREFIX_CODEX, codexPrefixes.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        CodexSuffixes = await ethers.getContractFactory("CodexSuffixes")
        codexSuffixes = await upgrades.deployProxy(CodexSuffixes);
        await codexSuffixes.deployed()
        console.log("Suffix deployed to:", codexSuffixes.address,)
        tx = await navigator.setGameContractsById(CONTRACT.SUFFIX_CODEX, codexSuffixes.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        CodexStaves = await ethers.getContractFactory("CodexStaves")
        codexStaves = await upgrades.deployProxy(CodexStaves, [], {
            initializer: "initialize"
        });
        await codexStaves.deployed()
        console.log("Staves deployed to:", codexStaves.address,)
        tx = await navigator.setGameContractsById(CONTRACT.STAFF_STATS, codexStaves.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        CodexDaggers = await ethers.getContractFactory("CodexDaggers")
        codexDaggers = await upgrades.deployProxy(CodexDaggers, [], {
            initializer: "initialize"
        });
        await codexDaggers.deployed()
        console.log("Daggers deployed to:", codexDaggers.address,)
        tx = await navigator.setGameContractsById(CONTRACT.DAGGER_STATS, codexDaggers.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        CodexAxes = await ethers.getContractFactory("CodexAxes")
        codexAxes = await upgrades.deployProxy(CodexAxes, [], {
            initializer: "initialize"
        });
        await codexAxes.deployed()
        console.log("Axes deployed to:", codexAxes.address,)
        tx = await navigator.setGameContractsById(CONTRACT.AXE_STATS, codexAxes.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        CodexBows = await ethers.getContractFactory("CodexBows")
        codexBows = await upgrades.deployProxy(CodexBows, [], {
            initializer: "initialize"
        });
        await codexBows.deployed()
        console.log("Bows deployed to:", codexBows.address,)
        tx = await navigator.setGameContractsById(CONTRACT.BOW_STATS, codexBows.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        CodexFocuses = await ethers.getContractFactory("CodexFocuses")
        codexFocuses = await upgrades.deployProxy(CodexFocuses, [], {
            initializer: "initialize"
        });
        await codexFocuses.deployed()
        console.log("Focuses deployed to:", codexFocuses.address,)
        tx = await navigator.setGameContractsById(CONTRACT.FOCUS_STATS, codexFocuses.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        CodexSwords = await ethers.getContractFactory("CodexSwords")
        codexSwords = await upgrades.deployProxy(CodexSwords, [], {
            initializer: "initialize"
        });
        await codexSwords.deployed()
        console.log("Swords deployed to:", codexSwords.address,)
        tx = await navigator.setGameContractsById(CONTRACT.SWORD_STATS, codexSwords.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        CodexShields = await ethers.getContractFactory("CodexShields")
        codexShields = await upgrades.deployProxy(CodexShields, [], {
            initializer: "initialize"
        });
        await codexShields.deployed()
        console.log("Shields deployed to:", codexShields.address,)
        tx = await navigator.setGameContractsById(CONTRACT.SHIELD_STATS, codexShields.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        CodexWeapons = await ethers.getContractFactory("CodexWeapons")
        codexWeapons = await upgrades.deployProxy(CodexWeapons, [navigator.address], {
            initializer: "initialize"
        });
        await codexWeapons.deployed()
        console.log("CodexWeapons deployed to:", codexWeapons.address,)
        tx = await navigator.setGameContractsById(CONTRACT.WEAPONS_CODEX, codexWeapons.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        fs.writeFileSync('./test/weapon-codexs.json', JSON.stringify({
            Navigator: navigator.address,
            CodexStaves: codexStaves.address,
            CodexAxes: codexAxes.address,
            CodexSwords: codexSwords.address,
            CodexShields: codexShields.address,
            CodexFocuses: codexFocuses.address,
            CodexBows: codexBows.address,
            CodexDaggers: codexDaggers.address,
            CodexWeapons: codexWeapons.address,
            CodexPrefixes: codexPrefixes.address,
            CodexSuffixes: codexSuffixes.address,
        }), {});

        console.log('File saved.')
        return true
    })
})

