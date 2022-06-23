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
    BODY_ARMORS_CODEX, //12
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
    FOCUS_STATS,
    HEAVY_HELMET_STATS,
    MEDIUM_HELMET_STATS,
    LIGHT_HELMET_STATS,
    HEAVY_ARMOR_STATS,
    MEDIUM_ARMOR_STATS,
    LIGHT_ARMOR_STATS,
    HEAVY_BOOTS_STATS,
    MEDIUM_BOOTS_STATS,
    LIGHT_BOOTS_STATS
}

describe("Weapon Codexs", () => {
    it('Should deploy navigator.', async () => {
        let Navigator;
        let navigator;
        let CodexArmorsHeavy;
        let codexArmorsHeavy;

        let CodexArmorsMedium;
        let codexArmorsMedium;

        let CodexArmorsLight;
        let codexArmorsLight;

        let CodexHelmetsHeavy;
        let codexHelmetsHeavy;
        let CodexHelmetsMedium;
        let codexHelmetsMedium;
        let CodexHelmetsLight;
        let codexHelmetsLight;

        let CodexBootsHeavy;
        let codexBootsHeavy;
        let CodexBootsMedium;
        let codexBootsMedium;
        let CodexBootsLight;
        let codexBootsLight;

        let CodexArmors;
        let codexArmors;
        let CodexHelmets;
        let codexHelmets;
        let CodexBoots;
        let codexBoots;

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

        // heavy helmet
        CodexHelmetsHeavy = await ethers.getContractFactory("CodexHelmetsHeavy")
        codexHelmetsHeavy = await upgrades.deployProxy(CodexHelmetsHeavy, [], {
            initializer: "initialize"
        });
        await codexHelmetsHeavy.deployed()
        console.log("CodexHelmetsHeavy deployed to:", codexHelmetsHeavy.address,)
        tx = await navigator.setGameContractsById(CONTRACT.HEAVY_HELMET_STATS, codexHelmetsHeavy.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        // medium  helmet
        CodexHelmetsMedium = await ethers.getContractFactory("CodexHelmetsMedium")
        codexHelmetsMedium = await upgrades.deployProxy(CodexHelmetsMedium, [], {
            initializer: "initialize"
        });
        await codexHelmetsMedium.deployed()
        console.log("CodexHelmetsMedium deployed to:", codexHelmetsMedium.address,)
        tx = await navigator.setGameContractsById(CONTRACT.MEDIUM_HELMET_STATS, codexHelmetsMedium.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        // light  helmet
        CodexHelmetsLight = await ethers.getContractFactory("CodexHelmetsLight")
        codexHelmetsLight = await upgrades.deployProxy(CodexHelmetsLight, [], {
            initializer: "initialize"
        });
        await codexHelmetsLight.deployed()
        console.log("CodexHelmetsLight deployed to:", codexHelmetsLight.address,)
        tx = await navigator.setGameContractsById(CONTRACT.LIGHT_HELMET_STATS, codexHelmetsLight.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        // heavy armor

        CodexArmorsHeavy = await ethers.getContractFactory("CodexArmorsHeavy")
        codexArmorsHeavy = await upgrades.deployProxy(CodexArmorsHeavy, [], {
            initializer: "initialize"
        });
        await codexArmorsHeavy.deployed()
        console.log("CodexArmors deployed to:", codexArmorsHeavy.address,)
        tx = await navigator.setGameContractsById(CONTRACT.HEAVY_ARMOR_STATS, codexArmorsHeavy.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        // med armor
        CodexArmorsMedium = await ethers.getContractFactory("CodexArmorsMedium")
        codexArmorsMedium = await upgrades.deployProxy(CodexArmorsMedium, [], {
            initializer: "initialize"
        });
        await codexArmorsMedium.deployed()
        console.log("CodexArmorsMedium deployed to:", codexArmorsMedium.address,)
        tx = await navigator.setGameContractsById(CONTRACT.MEDIUM_ARMOR_STATS, codexArmorsMedium.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        // light armor
        CodexArmorsLight = await ethers.getContractFactory("CodexArmorsLight")
        codexArmorsLight = await upgrades.deployProxy(CodexArmorsLight, [], {
            initializer: "initialize"
        });
        await codexArmorsLight.deployed()
        console.log("CodexArmorsLight deployed to:", codexArmorsLight.address,)
        tx = await navigator.setGameContractsById(CONTRACT.LIGHT_ARMOR_STATS, codexArmorsLight.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        // heavy boots
        CodexBootsHeavy = await ethers.getContractFactory("CodexBootsHeavy")
        codexBootsHeavy = await upgrades.deployProxy(CodexBootsHeavy, [], {
            initializer: "initialize"
        });
        await codexBootsHeavy.deployed()
        console.log("CodexBootsHeavy deployed to:", codexBootsHeavy.address,)
        tx = await navigator.setGameContractsById(CONTRACT.HEAVY_BOOTS_STATS, codexBootsHeavy.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        // medium boots
        CodexBootsMedium = await ethers.getContractFactory("CodexBootsMedium")
        codexBootsMedium = await upgrades.deployProxy(CodexBootsMedium, [], {
            initializer: "initialize"
        });
        await codexBootsMedium.deployed()
        console.log("CodexBootsMedium deployed to:", codexBootsMedium.address,)
        tx = await navigator.setGameContractsById(CONTRACT.MEDIUM_BOOTS_STATS, codexBootsMedium.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        // light boots
        CodexBootsLight = await ethers.getContractFactory("CodexBootsLight")
        codexBootsLight = await upgrades.deployProxy(CodexBootsLight, [], {
            initializer: "initialize"
        });
        await codexBootsLight.deployed()
        console.log("CodexBootsMedium deployed to:", codexBootsLight.address,)
        tx = await navigator.setGameContractsById(CONTRACT.LIGHT_BOOTS_STATS, codexBootsLight.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        // Codex Armors
        CodexArmors = await ethers.getContractFactory("CodexArmors")
        codexArmors = await upgrades.deployProxy(CodexArmors, [navigator.address], {
            initializer: "initialize"
        });
        await codexArmors.deployed()
        console.log("CodexArmors deployed to:", codexArmors.address,)
        tx = await navigator.setGameContractsById(CONTRACT.BODY_ARMORS_CODEX, codexArmors.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        // Codex Helmets
        CodexHelmets = await ethers.getContractFactory("CodexHelmets")
        codexHelmets = await upgrades.deployProxy(CodexHelmets, [navigator.address], {
            initializer: "initialize"
        });
        await codexHelmets.deployed()
        console.log("CodexHelmets deployed to:", codexHelmets.address,)
        tx = await navigator.setGameContractsById(CONTRACT.HELMETS_CODEX, codexHelmets.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")

        // Codex Boots
        CodexBoots = await ethers.getContractFactory("CodexBoots")
        codexBoots = await upgrades.deployProxy(CodexBoots, [navigator.address], {
            initializer: "initialize"
        });
        await codexBoots.deployed()
        console.log("CodexBoots deployed to:", codexBoots.address,)
        tx = await navigator.setGameContractsById(CONTRACT.BOOTS_CODEX, codexBoots.address, true)
        await tx.wait(1)
        console.log("and set in navigator.")


        fs.writeFileSync('./test/armor-codexs.json', JSON.stringify({
            Navigator: navigator.address,
            codexArmorsHeavy: codexArmorsHeavy.address,
            codexArmorsMedium: codexArmorsMedium.address,
            codexArmorsLight: codexArmorsLight.address,
            codexHelmetsHeavy: codexHelmetsHeavy.address,
            codexHelmetsMedium: codexHelmetsMedium.address,
            codexHelmetsLight: codexHelmetsLight.address,
            codexBootsHeavy: codexBootsHeavy.address,
            codexBootsMedium: codexBootsMedium.address,
            codexBootsLight: codexBootsLight.address,
            codexArmors: codexArmors.address,
            codexHelmets: codexHelmets.address,
            codexBoots: codexBoots.address,
            codexPrefixes: codexPrefixes.address,
            codexSuffixes: codexSuffixes.address,
        }));
        console.log('File saved.')
        return true
    })
})

