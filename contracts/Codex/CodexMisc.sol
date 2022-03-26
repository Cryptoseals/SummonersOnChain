import "../Interfaces/GameObjects/IGameObjects.sol";
import "./Common/Rarity.sol";
// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract CodexMiscItems is Rarity {
    string constant public index = "Codex";
    string constant public class = "MiscItems";
    string constant public version = "0.0.1";

    function getAllMiscItems() external pure returns (GameObjects.MiscItem[] memory) {
        GameObjects.MiscItem[] memory result = new GameObjects.MiscItem[](66);
        for (uint i = 1; i <= 66; i++) {
            result[i - 1] = item(i);
        }
        return result;
    }

    function item(uint _id) public pure returns (GameObjects.MiscItem memory _misc) {
        if (_id == 1) {
            return MeltedCandle();
        } else if (_id == 2) {
            return BrokenSword();
        } else if (_id == 3) {
            return TrollSkull();
        } else if (_id == 4) {
            return FireflyInJar();
        } else if (_id == 5) {
            return KnifeHandle();
        } else if (_id == 6) {
            return Dirt();
        } else if (_id == 7) {
            return BrokenUrn();
        } else if (_id == 8) {
            return DeadBug();
        } else if (_id == 9) {
            return TornFabric();
        } else if (_id == 10) {
            return RustyChain();
        } else if (_id == 11) {
            return BurnedBranch();
        } else if (_id == 12) {
            return Egg();
        } else if (_id == 13) {
            return BonePowder();
        } else if (_id == 14) {
            return Leather();
        } else if (_id == 15) {
            return Flint();
        } else if (_id == 16) {
            return Nail();
        } else if (_id == 17) {
            return BoneFragments();
        } else if (_id == 18) {
            return DeerHide();
        } else if (_id == 19) {
            return Arrowhead();
        } else if (_id == 20) {
            return Fur();
        } else if (_id == 21) {
            return SilverCoin();
        } else if (_id == 22) {
            return AnimalEye();
        } else if (_id == 23) {
            return SharkTooth();
        } else if (_id == 24) {
            return FormlessGoo();
        } else if (_id == 25) {
            return TatteredRope();
        } else if (_id == 26) {
            return Sand();
        } else if (_id == 27) {
            return FishBone();
        } else if (_id == 28) {
            return FishingRod();
        } else if (_id == 29) {
            return Net();
        } else if (_id == 30) {
            return TornSail();
        } else if (_id == 31) {
            return WrecksAndFragments();
        } else if (_id == 32) {
            return MermaidHair();
        } else if (_id == 33) {
            return FlyInAJar();
        } else if (_id == 34) {
            return DryLeaf();
        } else if (_id == 35) {
            return IvySeed();
        } else if (_id == 36) {
            return OxHorn();
        } else if (_id == 37) {
            return BearPelt();
        } else if (_id == 38) {
            return SnakeScale();
        } else if (_id == 39) {
            return UnknownKey();
        } else if (_id == 40) {
            return AncientTreeBark();
        } else if (_id == 41) {
            return OwlClaw();
        } else if (_id == 42) {
            return SilverDust();
        } else if (_id == 43) {
            return MoonstonePowder();
        } else if (_id == 44) {
            return CoalPowder();
        } else if (_id == 45) {
            return Silverweed();
        } else if (_id == 46) {
            return RabbitFoot();
        } else if (_id == 47) {
            return ScaleOfDragon();
        } else if (_id == 48) {
            return GingerRoots();
        } else if (_id == 49) {
            return Alcohol();
        } else if (_id == 50) {
            return Dittany();
        } else if (_id == 51) {
            return Salvia();
        } else if (_id == 52) {
            return ValerianRoot();
        } else if (_id == 53) {
            return Cannabis();
        } else if (_id == 54) {
            return DeadScarab();
        } else if (_id == 55) {
            return Lava();
        } else if (_id == 56) {
            return FireflyCarcass();
        } else if (_id == 57) {
            return BeetRoot();
        } else if (_id == 58) {
            return Bloodbag();
        } else if (_id == 59) {
            return FishBrain();
        } else if (_id == 60) {
            return GreenSlug();
        } else if (_id == 61) {
            return Dandelion();
        } else if (_id == 62) {
            return BlackTruffle();
        } else if (_id == 63) {
            return Chanterelle();
        } else if (_id == 64) {
            return FireballFlower();
        } else if (_id == 65) {
            return PorcupineQuill();
        } else if (_id == 66) {
            return LizardTail();
        }

        revert("wrong");
    }

    function MeltedCandle() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 1;
        _misc.metadata.name = "Melted Candle";
        _misc.metadata.description = "Scented pieces of wax without a wick. They come in different shapes and sizes.";
    }

    function BrokenSword() public pure returns (GameObjects.MiscItem memory _misc) {

        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 2;
        _misc.metadata.name = "Broken Sword";
        _misc.metadata.description = "Broken sword of an old warrior, still sharp.";
    }

    function TrollSkull() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 3;
        _misc.metadata.name = "Troll Skull";
        _misc.metadata.description = "Trophy of a hairy, ape-like creature.";
    }

    function FireflyInJar() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 4;
        _misc.metadata.name = "Firefly in Jar";
        _misc.metadata.description = "Prophecy says fireflies are still carrying the essence of the ancient summoners.";
    }

    function KnifeHandle() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 5;
        _misc.metadata.name = "Knife Handle";
        _misc.metadata.description = "Can be used for crafting actual weapons.";
    }

    function Dirt() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 6;
        _misc.metadata.name = "Dirt";
        _misc.metadata.description = "Sand, silt, and clay, and it may be rocky...";
    }

    function BrokenUrn() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 7;
        _misc.metadata.name = "Broken Urn";
        _misc.metadata.description = "Can be useful if repaired with some dirt.";
    }

    function DeadBug() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 8;
        _misc.metadata.name = "Dead Bug";
        _misc.metadata.description = "Carcass of a bug, some people use these to craft elixirs.";
    }

    function TornFabric() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 9;
        _misc.metadata.name = "Torn Fabric";
        _misc.metadata.description = "An old fabric. Definitely not usable in clothes.";
    }

    function RustyChain() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 10;
        _misc.metadata.name = "Rusty Chain";
        _misc.metadata.description = "The old rusty chain. Can be useful. Worth keeping it.";
    }

    function BurnedBranch() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 11;
        _misc.metadata.name = "Burned Branch";
        _misc.metadata.description = "Burned branches that covered with ash.";
    }

    function Egg() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 12;
        _misc.metadata.name = "Egg";
        _misc.metadata.description = "Egg of an unknown animal. Is it edible?";
    }

    function BonePowder() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 13;
        _misc.metadata.name = "Bone Powder";
        _misc.metadata.description = "Can still hear the sound of the crushed bones.";
    }

    function Leather() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 14;
        _misc.metadata.name = "Leather";
        _misc.metadata.description = "Animal Leather. A crafting material.";
    }

    function Flint() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 15;
        _misc.metadata.name = "Flint";
        _misc.metadata.description = "Useful when you need a campfire.";
    }

    function Nail() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 16;
        _misc.metadata.name = "Nail";
        _misc.metadata.description = "Can be used in advanced crafting.";
    }

    function BoneFragments() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 17;
        _misc.metadata.name = "Bone Fragments";
        _misc.metadata.description = "Sharp bone fragments of an unknown creature.";
    }

    function DeerHide() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 18;
        _misc.metadata.name = "Deer Hide";
        _misc.metadata.description = "Deer Hides can be used in advanced crafting.";
    }

    function Arrowhead() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 19;
        _misc.metadata.name = "Arrowhead";
        _misc.metadata.description = "A sharp, deadly arrowhead made out of metal.";
    }

    function Fur() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 20;
        _misc.metadata.name = "Fur";
        _misc.metadata.description = "Fur can be used in advanced crafting.";
    }

    function SilverCoin() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 21;
        _misc.metadata.name = "Silver Coin";
        _misc.metadata.description = "An old, antique silver coin.";
    }

    function AnimalEye() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 22;
        _misc.metadata.name = "Animal Eye";
        _misc.metadata.description = "Eye of an unknown animal. Looks bad.";
    }

    function SharkTooth() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 23;
        _misc.metadata.name = "Shark Tooth";
        _misc.metadata.description = "Giant, sharp tooth of a deadly shark.";
    }

    function FormlessGoo() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 24;
        _misc.metadata.name = "Formless Goo";
        _misc.metadata.description = "Is it alive?";
    }

    function TatteredRope() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 25;
        _misc.metadata.name = "Tattered Rope";
        _misc.metadata.description = "Not looking very strong. Be careful when using it.";
    }

    function Sand() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 26;
        _misc.metadata.name = "Sand";
        _misc.metadata.description = "Granular material composed of finely divided rock and mineral particles.";
    }

    function FishBone() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 27;
        _misc.metadata.name = "Fish Bone";
        _misc.metadata.description = "Skeletal remains of a small fish.";
    }

    function FishingRod() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 28;
        _misc.metadata.name = "Fishing Rod";
        _misc.metadata.description = "A simple tool used to catch fish.";
    }

    function Net() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 29;
        _misc.metadata.name = "Net";
        _misc.metadata.description = "Made from fibers woven in a grid-like structure.";
    }

    function TornSail() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 30;
        _misc.metadata.name = "Torn Sail";
        _misc.metadata.description = "Very risky to travel with this junk.";
    }

    function WrecksAndFragments() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 31;
        _misc.metadata.name = "Wrecks And Fragments";
        _misc.metadata.description = "Junk metal and useful parts.";
    }

    function MermaidHair() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 32;
        _misc.metadata.name = "Wrecks And Fragments";
        _misc.metadata.description = "Junk metal and useful parts.";
    }

    function FlyInAJar() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 33;
        _misc.metadata.name = "Fly In A Jar";
        _misc.metadata.description = "A captured fly in a jar.";
    }

    function DryLeaf() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 34;
        _misc.metadata.name = "Dry Leaf";
        _misc.metadata.description = "The leaves are all falling, and they're falling like they're falling in love with the ground.";
    }

    function IvySeed() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 35;
        _misc.metadata.name = "Ivy Seed";
        _misc.metadata.description = "Ivy seeds for planting. Farmers love it.";
    }

    function OxHorn() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 36;
        _misc.metadata.name = "Ox Horn";
        _misc.metadata.description = "A good crafter can make something useful out of it.";
    }

    function BearPelt() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 37;
        _misc.metadata.name = "Bear Pelt";
        _misc.metadata.description = "Can be obtained from dead bears.";
    }

    function SnakeScale() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 38;
        _misc.metadata.name = "Snake Scale";
        _misc.metadata.description = "Scale of a deadly poisonous snake.";
    }

    function UnknownKey() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 39;
        _misc.metadata.name = "Unknown Key";
        _misc.metadata.description = "...";
    }

    function AncientTreeBark() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 40;
        _misc.metadata.name = "Ancient Tree Bark";
        _misc.metadata.description = "Obtained from Ancient Trees.";
    }

    function OwlClaw() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 41;
        _misc.metadata.name = "Owl Claw";
        _misc.metadata.description = "Obtained from Ancient Trees.";
    }

    function SilverDust() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 42;
        _misc.metadata.name = "Silver Dust";
        _misc.metadata.description = "Grinded shiny particles!";
    }

    function MoonstonePowder() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 43;
        _misc.metadata.name = "Moonstone Powder";
        _misc.metadata.description = "It's believed it was derived from solidified rays of the Moon.";
    }

    function CoalPowder() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 44;
        _misc.metadata.name = "Coal Powder";
        _misc.metadata.description = "Don't come near fight fire!";
    }

    function Silverweed() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 45;
        _misc.metadata.name = "Silverweed";
        _misc.metadata.description = "It could ward off witches and evil spirits.";
    }

    function RabbitFoot() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 46;
        _misc.metadata.name = "Rabbit Foot";
        _misc.metadata.description = "The foot of a rabbit is carried as an amulet believed to bring good luck.";
    }

    function ScaleOfDragon() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 47;
        _misc.metadata.name = "Scale of Dragon";
        _misc.metadata.description = "A scale taken from dragon. Supposedly the ability to enhance physical power and health.";
    }

    function GingerRoots() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 48;
        _misc.metadata.name = "Ginger Roots";
        _misc.metadata.description = "Roots of tasty, man looking plant.";
    }

    function Alcohol() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 49;
        _misc.metadata.name = "Alcohol";
        _misc.metadata.description = "Useful after a long day...";
    }

    function Dittany() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 50;
        _misc.metadata.name = "Dittany";
        _misc.metadata.description = "A powerful healing herb and restorative";
    }

    function Salvia() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 51;
        _misc.metadata.name = "Salvia";
        _misc.metadata.description = "Some brew, some smokes... But smells really good! ";
    }

    function ValerianRoot() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 52;
        _misc.metadata.name = "Valerian Root";
        _misc.metadata.description = "Has sedative effects.";
    }

    function Cannabis() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 53;
        _misc.metadata.name = "Cannabis";
        _misc.metadata.description = "The plant has been valued for its use for fiber and rope, as food and medicine, and for its psychoactive properties for religious.";
    }

    function DeadScarab() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 54;
        _misc.metadata.name = "Dead Scarab";
        _misc.metadata.description = "Mush have died from rolling a ball of dung.";
    }

    function Lava() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 55;
        _misc.metadata.name = "Lava";
        _misc.metadata.description = "It's too hot! How could you carry that?";
    }

    function FireflyCarcass() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 56;
        _misc.metadata.name = "Firefly Carcass";
        _misc.metadata.description = "Dead but still shiny!";
    }

    function BeetRoot() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 57;
        _misc.metadata.name = "Beet Root";
        _misc.metadata.description = "Tastes really sweet and gives energy!";
    }

    function Bloodbag() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 58;
        _misc.metadata.name = "Bloodbag";
        _misc.metadata.description = "Generally collected for rituals and potion crafting.";
    }

    function FishBrain() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 59;
        _misc.metadata.name = "Fish Brain";
        _misc.metadata.description = "It's too hot! How could you carry that?";
    }

    function GreenSlug() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 60;
        _misc.metadata.name = "Green Slug";
        _misc.metadata.description = "It has tentacles. Wow!";
    }

    function Dandelion() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 61;
        _misc.metadata.name = "Dandelion";
        _misc.metadata.description = "Don't you want to blow?";
    }

    function BlackTruffle() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 62;
        _misc.metadata.name = "Black Truffle";
        _misc.metadata.description = "Usually found in close association with tree roots.";
    }

    function Chanterelle() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 63;
        _misc.metadata.name = "Chanterelle";
        _misc.metadata.description = "The most popular of wild edible mushrooms.";
    }

    function FireballFlower() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 64;
        _misc.metadata.name = "Fireball Flower";
        _misc.metadata.description = "A plant of moist, shady habitats.";
    }

    function PorcupineQuill() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 65;
        _misc.metadata.name = "Porcupine Quill";
        _misc.metadata.description = "It's really sharp. What can you do with it?";
    }

    function LizardTail() public pure returns (GameObjects.MiscItem memory _misc) {
        _misc.metadata.baseType = GameObjects.ItemType.MISC;
        _misc.metadata.id = 66;
        _misc.metadata.name = "Lizard Tail";
        _misc.metadata.description = "Looks like a scared lizard lost its own tail.";
    }
}