import type { ItemId } from "./items";

interface CraftingData {
  [building_id: string]: Recipe[];
}

interface Recipe {
  id: string;
  item_id: ItemId;
  needs: NeededItem[];
  /** batch size. how many items of id get crafted in a single batch? */
  batch_size: number;
  /** a tick is an ingame time duration given by a global timer (the ProductionTakt) */
  duration_in_ticks: number;
}

export interface NeededItem {
  id: ItemId;
  amount: number;
}

export const craftingData = {
  sawmill: [
    {
      id: "planks",
      item_id: "plank",
      needs: [{ id: "log", amount: 1 }],
      batch_size: 2,
      duration_in_ticks: 5,
    },
    {
      id: "planks2",
      item_id: "plank",
      needs: [{ id: "log", amount: 4 }],
      batch_size: 10,
      duration_in_ticks: 17,
    },
    {
      id: "sawdust",
      item_id: "sawdust",
      needs: [
        { id: "log", amount: 2 },
        { id: "stone", amount: 1 },
      ],
      batch_size: 5,
      duration_in_ticks: 8,
    },
  ],
  smelter: [
    {
      id: "iron_ingot",
      item_id: "iron_ingot",
      needs: [
        { id: "iron_ore", amount: 2 },
        { id: "coal", amount: 1 },
      ],
      batch_size: 2,
      duration_in_ticks: 10,
    },
  ],
  smithy: [
    {
      id: "battle_axe",
      item_id: "battle_axe",
      needs: [
        { id: "iron_ingot", amount: 4 },
        { id: "coal", amount: 2 },
        { id: "plank", amount: 1 },
      ],
      batch_size: 1,
      duration_in_ticks: 15,
    },
  ],
  charcoal_kiln: [
    {
      id: "charcoal",
      item_id: "coal",
      needs: [{ id: "log", amount: 1 }],
      batch_size: 1,
      duration_in_ticks: 4,
    },
  ],
} satisfies CraftingData;
