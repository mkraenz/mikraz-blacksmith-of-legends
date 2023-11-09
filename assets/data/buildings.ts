interface BuildingData {
  [buildingName: string]: Building;
}

interface Building {
  label: string;
  id: string;
  icon:
    | { type: "Texture2D"; res_path: `res://${string}` }
    | {
        type: "AtlasTexture";
        regionX: number;
        regionY: number;
        res_path: `res://${string}`;
      };
}

export const buildingData = {
  sawmill: {
    label: "Sawmill",
    id: "sawmill",
    icon: {
      type: "Texture2D",
      res_path: "res://assets/images/buzzsaw.png",
    },
  },
  smelter: {
    label: "Smelter",
    id: "smelter",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_IronBar.png",
    },
  },
  mint: {
    label: "Mint",
    id: "mint",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_GoldCoin.png",
    },
  },
  forge: {
    label: "Forge",
    id: "forge",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_IronOre.png",
    },
  },
  charcoal_kiln: {
    label: "Charcoal Kiln",
    id: "charcoal_kiln",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_Coal.png",
    },
  },
} satisfies BuildingData;
