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
  crate_tmMrzy: {
    res_path: "res://world/crate/crate.tscn",
    id: "crate_tmMrzy",
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
  ginventory_GVwfHU: {
    res_path: "res://global/GInventory.gd",
    id: "ginventory_GVwfHU",
  },
} satisfies ScriptRegistry;