import type { NeededItem } from "./crafting-recipes";

interface BuildingData {
  [id: string]: Building;
}

interface Building {
  label: string;
  id: string;
  icon:
    | { type: "Texture2D"; res_path: `res://${string}` }
    | {
        type: "AtlasTexture";
        region: {
          x: number;
          y: number;
          width: number;
          height: number;
        };
        res_path: `res://${string}`;
      };
  /** building costs */
  needs: NeededItem[];
}

export const buildingData = {
  sawmill: {
    label: "Sawmill",
    id: "sawmill",
    icon: {
      type: "Texture2D",
      res_path: "res://assets/images/buzzsaw.png",
    },
    needs: [{ id: "log", amount: 5 }],
  },
  smelter: {
    label: "Smelter",
    id: "smelter",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_IronBar.png",
    },
    needs: [{ id: "plank", amount: 10 }],
  },
  mint: {
    label: "Mint",
    id: "mint",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_GoldCoin.png",
    },
    needs: [{ id: "plank", amount: 200 }],
  },
  smithy: {
    label: "Smithy",
    id: "smithy",
    icon: {
      type: "AtlasTexture",
      res_path: "res://assets/images/smithy.png",
      region: {
        x: 48,
        y: 0,
        width: 48,
        height: 48,
      },
    },
    needs: [
      { id: "plank", amount: 5 },
      { id: "iron_ore", amount: 3 },
    ],
  },
  charcoal_kiln: {
    label: "Charcoal Kiln",
    id: "charcoal_kiln",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_Coal.png",
    },
    needs: [{ id: "plank", amount: 4 }],
  },
} satisfies BuildingData;
