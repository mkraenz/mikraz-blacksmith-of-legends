interface ScriptRegistry {
  [id: string]: Script;
}

interface Script {
  id: string;
  res_path: `res://${string}`;
}

export const scriptRegistry = {
  player_rqXkdk: {
    res_path: "res://player/Player.tscn",
    id: "player_rqXkdk",
  },
  tree_tmMrzy: {
    res_path: "res://world/resource_nodes/tree/tree.tscn",
    id: "tree_tmMrzy",
  },
  pickup_FUwDe7: {
    res_path: "res://world/pickup/pickup.tscn",
    id: "pickup_FUwDe7",
  },
  sawmill_DgFJ2E: {
    res_path: "res://world/buildings/sawmill/sawmill.tscn",
    id: "sawmill_DgFJ2E",
  },
  smithy_2IVp6B: {
    res_path: "res://world/buildings/smithy/smithy.tscn",
    id: "smithy_2IVp6B",
  },
  charcoal_kiln_gbuAXz: {
    res_path: "res://world/buildings/charcoal_kiln/charcoal_kiln.tscn",
    id: "charcoal_kiln_gbuAXz",
  },
  smelter_mx3GEc: {
    res_path: "res://world/buildings/smelter/smelter.tscn",
    id: "smelter_mx3GEc",
  },
  iron_ore_ufkPN4: {
    res_path: "res://world/resource_nodes/iron_ore/iron_ore.tscn",
    id: "iron_ore_ufkPN4",
  },
  stone_ul586x: {
    res_path: "res://world/resource_nodes/stone/stone.tscn",
    id: "stone_ul586x",
  },
} satisfies ScriptRegistry;
