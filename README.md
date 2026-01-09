# 2Dplatformer_GODOT
A personal project to learn and master the Godot game engine by building a complete 2D platformer from scratch. The project covers player movement, animations, jumping mechanics, tile-based terrains, moving platforms, pickups, scene transitions, and an interactive HUD. 


Your Godot Platformer Project Checklist
Current Status (✅ Already Done)

[✅] Basic player movement, jumping, gravity, one-way platforms
[✅] Energy cell collection (4 per level to open portal)
[✅] Dynamic level loading (area_1 → area_2 → area_3, etc.)
[✅] Player death/respawn when falling off map (full level reset)
[✅] HUD showing energy cell count ("x 0/4") and portal messages
[✅] Main menu with Play, Help, Quit buttons working
[✅] Help screen (help.tscn) with controls/About info + Back button/Esc
[✅] Pause menu with Esc (pause/unpause) + Q to quit to menu
[✅] Background added to levels

Future Goals (To Do Next)

Design more levels (build on area_2/3/4+)
 area_4.tscn (duplicate template, customize TileMap/platforms/cells)
 area_5.tscn
 area_6.tscn (or more – aim for 6-10 total?)
Add variety: more moving platforms, spikes/hazards, tricky jumps

Add enemies/mobs
 Create enemy.tscn (patrol left/right, 16x16 sprites from free packs)
 Touch sides/bottom → player dies (triggers GameManager.die())
 Jump on top → enemy dies (stomp mechanic)
 Place in area_2/3/4+ (1-2 per level early, more later)
 Optional: animations/sounds for death

Add music & SFX
 Background music (AudioStreamPlayer, looping BGM)
 SFX: jump, cell pickup, enemy stomp, death, portal
 Volume slider (in future settings)

Game completion
 Win screen/credits after final level (modify GameManager.load_current_area() for "no more areas")
 Optional: lives system, timer/score

Polish (nice-to-have)
 Settings menu (volume, fullscreen, keybinds)
 Fade transitions between levels/death
 Particles (cell collect, enemy squash)
 Export to itch.io/HTML5/Windows
