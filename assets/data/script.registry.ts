interface ScriptRegistry {
  [id: string]: Script;
}

interface Script {
  id: string;
  res_path: `res://${string}`;
}

/** This script registry allows us to rename resources and still be able to load old save files.
 * Since Godot v4.4 this is now inbuilt with the introduction of `.uid` files for scripts.
 * TODO probably worth switching to godots way.
 */
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
  beehive_5869a0e9: {
    res_path: "res://world/resource_nodes/stone/stone.tscn",
    id: "beehive_5869a0e9",
  },
} satisfies ScriptRegistry;
