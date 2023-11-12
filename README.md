# TypeScriptTeatime's Dwarves of Mikraz I

- [itch.io](https://mkraenz.itch.io/dwarves-of-mikraz)
- [github repo](https://github.com/mkraenz/dwarves-of-mikraz-1)

## BHAG

Dwarf Fortress-infused Forager.

## Assets

- check `./third-party/`
- [Dwarven Font generation](https://www.fontspace.com/category/dwarven) - Anglo-Saxon Runes by Dan Smith's Fantasy Fonts - free for personal use
- [PressStart2P font](https://fonts.google.com/specimen/Press+Start+2P) - OFL
- [The Essential Retro Sound Effects Collection](https://opengameart.org/content/512-sound-effects-8-bit-style) - CC0 1.0
- files in `./assets/` created by mkraenz

## Build and Export to itch.io

- Create new project on itch.io
- Build the Godot project using HTML template
  - `echo .build/ >> .gitignore`
  - `rm -r .build && mkdir .build`
  - Project -> Export... -> Add Preset -> Web -> (if not already installed, download the HTML template) -> Set output path to `.build/` -> Export Project... -> filename `index.html` -> disable `Export with Debug` -> Export
    - or, as a command (once initial setup is done)
    - `/home/mirco/programming/gamedev/godot4/Godot_v4.1.2-stable_linux.x86_64 --export-release Web .build/index.html`
- upload the build to itch.io `/home/mirco/programming/gamedev/itchio-butler/butler push .build mkraenz/dwarves-of-mikraz:web`
- enable the build in the itch.io project page
- In itch.io, edit project -> Uploads -> enable `This file will be played in the browser`
- enable `SharedArrayBuffer support — (Experimental)`
  - Fixes error message on game load: `The following features required to run Godot projects on the Web are missing: ...`
  - Note: if you create the itch.io project and set SharedArrayBuffer support at that time, itch seems to forget your config for the newly uploaded build artifacts.

Release script

```sh
./shipit.sh
```

## Start game from command line

```sh
/home/mirco/programming/gamedev/godot4/Godot_v4.1.1-stable_linux.x86_64 .
```

### Features

#### Persistence

check `persistence.gd`. Note that JSON does not support `INF` so we added a custom parser `JSONX`. To persist floats that can be `INF` use `JSONX.stringify_float(my_float)`.

#### Pausing

following [docs](https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html)

summary:

- set the `root/Main/Gui/PauseMenu` node's `Process.mode` to `When Paused` (in code: `Node.PROCESS_MODE_PAUSABLE`)
- call `get_tree().paused = true # or false`
- `pause_menu.hide()`

## Todos

- [x] crates usability
  - [x] via keyboard and mouse by distance
  - [x] which key
- [x] try to use groups to destroy the level
- [x] refactor: rename Persist to persist
- [x] how to open inventory
- [x] exit button crafting menu
- [x] exit button inventory menu
- [x] howtoplay unmark not working
- [x] when changing crafting recipes, emit the current resources
- [x] disallow space bar to call new game on exported game
- [x] image for building -> take the anvil from tiny-dungeon asset pack
- [x] select a building to build
  - [x] have a button that opens the build menu
  - [x] build menu design
  - [x] building icon
  - [x] select building
  - [x] build button inside the building menu
- [ ] buildings cost resources
- [x] build the building at mouse position
  - [x] show a blueprint of the building on hover
  - [x] on click build the build
- [x] interact with the building
  - [x] learn how to interact
  - [x] open craft menu
  - [x] select recipe
  - [x] show icon of recipe
  - [x] display recipe details
  - [x] select number (default 1)
    - [x] select number (default 1)
    - [x] update recipe requirements
    - [x] check requirements are fulfilled
    - [x] show warning on building when requirements not fulfilled
  - [x] click craft
  - [x] take resources from inventory
  - [x] on click, close craft menu
  - [x] opening the craft menu after it was closed resets the crafting amounts and selected recipe
- [x] after cooldown finishes, spawn finished product
  - [x] cooldown timer
  - [x] get order
  - [x] process order
  - [x] make batch size Max and Inf work
  - [ ] progress indicator for one batch
    - [ ] progress indicator changes from red to green (within the same circle?)
      - idea: interpolate from Red Color(1,0,0) at 0 degrees to Green Color(0,1,0) at 360 degrees
  - [ ] cancel current order
  - [x] spawn finished products
  - [x] show current order
    - forager displays it additionally on the workshop with an "x20" for the amount
  - [x] show overall progress of current order
    - [x] currently shows number of batches, but on Craft button it shows `batches * units_per_batch` -> use total amount
- [x] can collect finished product
- [x] block player movement + actions while in crafting/building/inventory menu
- [ ] collector building that autocollects outputs

## Data generation

We are using a data-driven approach to define items and crafting recipes. Corresponding files you need to change are the `.ts` files in `./assets/data/`. Then, simply run the export script to generate the corresponding json files that get automatically loaded into the game via `GData.gd`.

```sh
yarn datagen
```

## Deployment

Automatically bumps version, builds project, and pushes it to itch.io.

```sh
yarn deploy
```

## Learnings

- set the default theme via Project -> Theme (under GUI subheading) -> Custom -> select default theme

## Other Resources

- [must-see godot 4 ui tutorial](https://www.youtube.com/watch?v=1_OFJLyqlXI)
