interface ItemData {
  [itemName: string]: Item;
}

interface Item {
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

// idea: multiple materials of the same type that get tracked when crafting other items. E.g. Spruce wood logs get turned into spruce wood planks, which then gets used to build an axe with a spruce wood
export const itemsData = {
  log: {
    label: "Log",
    id: "log",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/kenney-tiny-town/log.png",
    },
  },
  plank: {
    label: "Plank",
    id: "plank",
    icon: {
      type: "Texture2D",
      res_path: "res://assets/images/gui/plank.png",
    },
  },
  sawdust: {
    label: "Sawdust",
    id: "sawdust",
    icon: {
      type: "Texture2D",
      res_path: "res://assets/images/gui/sawdust.png",
    },
  },
  stone: {
    label: "Stone",
    id: "stone",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_Rock01.png",
    },
  },
  ironOre: {
    label: "Iron ore",
    id: "ironOre",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_IronOre.png",
    },
  },
  ironIngot: {
    label: "Iron ingot",
    id: "ironIngot",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_IronBar.png",
    },
  },
  coal: {
    label: "Coal",
    id: "coal",
    icon: {
      type: "Texture2D",
      res_path: "res://third-party/henry_lazarini/I_Coal.png",
    },
  },
} satisfies ItemData;
