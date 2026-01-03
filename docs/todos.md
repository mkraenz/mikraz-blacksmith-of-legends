# Todos

## v0.1.0 production sim

- [x] redo smithy with HOFMC\_'s images
- [x] redo sawmill with HOFMC\_'s images
- [x] Bug: on load, notifications don't get reset
- [x] Bug: click Continue -> Pause -> exit to title -> New game. Then the quest log is duplicated
- [x] Bug: cancelling an order does not hide the progress bar and doesn't stop the animation
- [x] Bug: cant see the required building materials for other buildings when requirements arent met. Thus dont know what to collect.
- [x] Bug: floats display as `1.0` instead of `1` breaking crafting and build menu. introduced in godot 4.4 ([PR](https://github.com/godotengine/godot-proposals/issues/7894))
- [x] refactor: extract more stuff from Production
- [x] close menus with ESC, only pause on P
- [ ] without any windows open, the ESC button should open the pause menu after all - but not when there are any windows like the crafting menu open
- [ ] interact should only trigger once
- [ ] options menu
  - [ ] key rebinding
    - [ ] choose controller ps or controller xbox or keyboard+mouse
  - [ ] graphics: toggle order details (e.g. Alt key to show order details, otherwise only show when in action radius)
- [ ] controller support
- [ ] ps
  - [ ] xbox
- [x] localization:
  - [x] how to localize content?
  - [x] localize
    - [x] items
    - [x] buildings
    - [x] quests
- [ ] some polish
  - [x] death anim for beehive
  - [x] when hitting resource node, face the resource node
    - [x] when facing left away from any resource nodes and then hitting E, the anim plays the strike to the right
  - [ ] player strikes when building sth
  - [x] quest log spacing of description and requirements
  - [ ] build menu icons
  - [ ] shadows -> <https://www.youtube.com/watch?v=nAZGUds9vnc>
  - [ ] sfx
    - [ ] on build
    - [ ] on craft
    - [ ] menu sounds
      - [x] title menu
      - [x] pause menu
      - [ ] crafting menu
      - [ ] inventory menu
      - [ ] building menu
    - [ ] on order accepted
  - [ ] charcoal kiln
    - [ ] replace placeholder sprite
    - [ ] animations
  - [x] automated testing
  - [ ] win screen with image
- [ ] demo: production sim
  - [x] progression:
    - [x] logs -> sawmill -> planks -> stone -> charcoal kiln -> coal -> iron ore -> smelter -> iron ingots -> smithy -> battle axe
  - [x] rename game and all occurrences of previous name
    - [x] in code
    - [x] repo
    - [x] directory + all pathes
    - [x] itch io
    - [x] itch io page

## v0.2.0 upgrade system

- [ ] upgrade: player has attack damage
- [ ] upgrade: resources have armor
- [ ] upgrade: player / tech upgrades / talents
- [ ] automation: collector building that autocollects outputs
- [ ] unlock new building recipes when having seen every needed item for that building
- [ ] everything gets an entity id
