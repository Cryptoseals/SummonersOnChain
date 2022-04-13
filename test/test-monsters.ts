import {ethers, upgrades} from "hardhat";
import {expect} from "chai";
import fs from 'fs'
const ether = ethers.utils.parseEther("1");

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
    VOID_SPELLS
}

enum Element {
    PHYSICAL,
    ARCANE,
    FIRE,
    COLD,
    EARTH,
    LIGHTNING,
    DARK,
    HOLY,
    VOID
}

describe("Navigator and Enemy Codexs", () => {
    let deployer: any = {
        address: ""
    };
    let Navigator: any;
    let navigator: any;
    let CodexEnemy: any;
    let codexEnemy: any;
    let EarthMonsters: any;
    let earthMonsters: any;
    let FireMonsters: any;
    let fireMonsters: any;
    let ColdMonsters: any;
    let coldMonsters: any;
    let LightningMonsters: any;
    let lightningMonsters: any;
    let DarkMonsters: any;
    let darkMonsters: any;
    let HolyMonsters: any;
    let holyMonsters: any;
    let VoidMonsters: any;
    let voidMonsters: any;
    let PhysicalMonsters: any;
    let physicalMonsters: any;
    let ArcaneMonsters: any;
    let arcaneMonsters: any;

    let tx;

    it('Should deploy navigator.', async () => {


        Navigator = await ethers.getContractFactory("Navigator");
        navigator = await upgrades.deployProxy(Navigator, [ethers.constants.AddressZero, 30], {
            initializer: "initialize"
        });


    })

    it('Should deploy earth monster data ', async () => {


        EarthMonsters = await ethers.getContractFactory("CodexEnemiesEarth");
        earthMonsters = await upgrades.deployProxy(EarthMonsters, []);
        console.log("Earth monsters deployed.")

    })
    it('Should deploy fire monster data ', async () => {


        FireMonsters = await ethers.getContractFactory("CodexEnemiesFire");
        fireMonsters = await upgrades.deployProxy(FireMonsters, []);
        console.log("Fire monsters deployed.")


    })
    it('Should deploy cold monster data ', async () => {


        ColdMonsters = await ethers.getContractFactory("CodexEnemiesCold");
        coldMonsters = await upgrades.deployProxy(ColdMonsters, []);
        console.log("Cold monsters deployed.")


    })
    it('Should deploy lightning monster data ', async () => {


        LightningMonsters = await ethers.getContractFactory("CodexEnemiesLightning");
        lightningMonsters = await upgrades.deployProxy(LightningMonsters, []);
        console.log("Lightning monsters deployed.")


    })
    it('Should deploy dark monster data ', async () => {


        DarkMonsters = await ethers.getContractFactory("CodexEnemiesDark");
        darkMonsters = await upgrades.deployProxy(DarkMonsters, []);
        console.log("Dark monsters deployed.")


    })
    it('Should deploy holy monster data ', async () => {


        HolyMonsters = await ethers.getContractFactory("CodexEnemiesHoly");
        holyMonsters = await upgrades.deployProxy(HolyMonsters, []);
        console.log("Holy monsters deployed.")


    })
    it('Should deploy void monster data ', async () => {


        VoidMonsters = await ethers.getContractFactory("CodexEnemiesVoid");
        voidMonsters = await upgrades.deployProxy(VoidMonsters, []);
        console.log("Void monsters deployed.")


    })
    it('Should deploy physical monster data ', async () => {


        PhysicalMonsters = await ethers.getContractFactory("CodexEnemiesPhysical");
        physicalMonsters = await upgrades.deployProxy(PhysicalMonsters, []);
        console.log("Phyiscal monsters deployed.")


    })
    it('Should deploy arcane monster data ', async () => {


        ArcaneMonsters = await ethers.getContractFactory("CodexEnemiesArcane");
        arcaneMonsters = await upgrades.deployProxy(ArcaneMonsters, []);
        console.log("Arcane monsters deployed.")


    })
    it('Should set addresses on navigator.', async () => {
        tx = await navigator.setGameContractsById(CONTRACT.EARTH_ENEMY_CODEX, earthMonsters.address, true);
        await tx.wait(1);
        console.log("Earth address set.")
        tx = await navigator.setGameContractsById(CONTRACT.COLD_ENEMY_CODEX, coldMonsters.address, true);
        await tx.wait(1);
        console.log("Cold address set.")
        tx = await navigator.setGameContractsById(CONTRACT.FIRE_ENEMY_CODEX, fireMonsters.address, true);
        await tx.wait(1);
        console.log("Fire address set.")
        tx = await navigator.setGameContractsById(CONTRACT.LIGHTNING_ENEMY_CODEX, lightningMonsters.address, true);
        await tx.wait(1);
        console.log("Lightning address set.")
        tx = await navigator.setGameContractsById(CONTRACT.DARK_ENEMY_CODEX, darkMonsters.address, true);
        await tx.wait(1);
        console.log("Dark address set.")
        tx = await navigator.setGameContractsById(CONTRACT.HOLY_ENEMY_CODEX, holyMonsters.address, true);
        await tx.wait(1);
        console.log("Holy address set.")
        tx = await navigator.setGameContractsById(CONTRACT.VOID_ENEMY_CODEX, voidMonsters.address, true);
        await tx.wait(1);
        console.log("Void address set.")
        tx = await navigator.setGameContractsById(CONTRACT.PHYSICAL_ENEMY_CODEX, physicalMonsters.address, true);
        await tx.wait(1);
        console.log("Physical address set.")
        tx = await navigator.setGameContractsById(CONTRACT.ARCANE_ENEMY_CODEX, arcaneMonsters.address, true);
        await tx.wait(1);
        console.log("Arcane address set.")


        CodexEnemy = await ethers.getContractFactory("CodexEnemies");
        codexEnemy = await upgrades.deployProxy(CodexEnemy, [navigator.address], {
            initializer: "initialize"
        });


        console.log("Main codex deployed.")


    })

    it('Should deploy main enemy codex and set navigator.', async () => {

    })

    it('Should fetch enemies from main codex.', async () => {
        try {
            let monster = await codexEnemy.enemy(Element.FIRE, 1, 1)
            console.log("fire:")
            console.log(monster)
            monster = await codexEnemy.enemy(Element.COLD, 1, 1)
            console.log("cold:")
            console.log(monster)
            monster = await codexEnemy.enemy(Element.EARTH, 1, 1)
            console.log("earth:")
            console.log(monster)
            monster = await codexEnemy.enemy(Element.LIGHTNING, 1, 1)
            console.log("lightning:")
            console.log(monster)
            monster = await codexEnemy.enemy(Element.DARK, 1, 1)
            console.log("dark:")
            console.log(monster)
            monster = await codexEnemy.enemy(Element.HOLY, 1, 1)
            console.log("holy:")
            console.log(monster)
            monster = await codexEnemy.enemy(Element.VOID, 1, 1)
            console.log("void:")
            console.log(monster)
            monster = await codexEnemy.enemy(Element.PHYSICAL, 1, 1)
            console.log("physical:")
            console.log(monster)
        } catch (e) {
            console.log(e)
        }
        fs.writeFileSync('./test/last-deploy.json', JSON.stringify({
            PhysicalMonstersCodex: physicalMonsters.address,
            FireMonstersCodex: fireMonsters.address,
            ColdMonstersCodex: coldMonsters.address,
            LightningMonstersCodex: lightningMonsters.address,
            EarthMonstersCodex: earthMonsters.address,
            DarkMonstersCodex: darkMonsters.address,
            HolyMonstersCodex: holyMonsters.address,
            ArcaneMonstersCodex: arcaneMonsters.address,
            VoidMonstersCodex: voidMonsters.address,
            Codex: codexEnemy.address,
            Nav: navigator.address
        }),{});

    })
})

