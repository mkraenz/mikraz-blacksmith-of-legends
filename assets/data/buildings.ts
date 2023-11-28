import type { NeededItem } from "./crafting-recipes";

interface BuildingData {
  [id: string]: Building;
}

interface Building {
  label: { en: string; de: string };
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
    label: { en: "Sawmill", de: "Sägemühle" },
    id: "sawmill",
    icon: {
      type: "Texture2D",
      res_path: "res://assets/images/buzzsaw.png",
    },
    needs: [{ id: "log", amount: 5 }],
  },
  smelter: {
    label: { en: "Smelter", de: "Schmelzer" },
    id: "smelter",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_IronBar.png",
    },
    needs: [
      { id: "plank", amount: 10 },
      { id: "stone", amount: 15 },
    ],
  },
  mint: {
    label: { en: "Mint", de: "Münzanstalt" },
    id: "mint",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_GoldCoin.png",
    },
    needs: [{ id: "plank", amount: 200 }],
  },
  smithy: {
    label: { en: "Smithy", de: "Schmiede" },
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
      { id: "plank", amount: 10 },
      { id: "iron_ingot", amount: 4 },
      { id: "stone", amount: 20 },
    ],
  },
  charcoal_kiln: {
    label: { en: "Charcoal Kiln", de: "Köhler" },
    id: "charcoal_kiln",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_Coal.png",
    },
    needs: [
      { id: "plank", amount: 4 },
      { id: "stone", amount: 10 },
    ],
  },
} satisfies BuildingData;
