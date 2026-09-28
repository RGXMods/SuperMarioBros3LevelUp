# <span style="color: #c24e37;">🔷 </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #c24e37;">| </span> <span style="color: #c24e37;">S</span><span style="color: #ffffff;">uper </span><span style="color: #c24e37;">M</span><span style="color: #ffffff;">ario </span><span style="color: #c24e37;">B</span><span style="color: #ffffff;">ros 3 </span><span style="color: #c24e37;">L</span><span style="color: #ffffff;">evel-</span><span style="color: #c24e37;">U</span><span style="color: #ffffff;">p</span><span style="color: #c24e37;">!</span>

![SMB3LU Logo](media/logo.png)

## ![](media/kiwi.gif) <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods</span> <span style="color: #3598db;">-</span> <span style="color: #8b4b5c;">R</span><span style="color: #6b8fb0;">ealm</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #6b8fb0;">Community Project</span>

***

## <span style="color: #c24e37;">🎯 Overview</span>

**Super Mario Bros. 3 Level-Up! (SMB3LU)** replaces World of Warcraft's configured default level-up sound with a Super Mario Bros. 3-inspired "POWER UP!" chime whenever the player gains a level. It is a small, automatic sound addon built on RGX-Framework.

![RealmGX Kiwi](media/kiwi.gif) **<span style="color: #2dc26b;">The Kiwi Says:</span>** <span style="color: #b96ad9;">"It's-a me! Bwwiiiee."</span>

***

## <span style="color: #c24e37;">⚠️ Deprecation Notice</span>

<span style="color: #ff6b6b;">**This addon is no longer receiving updates.**</span> Its functionality and Super Mario Bros. 3 sound are available in [BLU | Better Level Up!](https://www.curseforge.com/wow/addons/blu-better-level-up) and [BLU Classic | Better Level Up!](https://www.curseforge.com/wow/addons/blu-classic), which combine this sound with a larger sound collection.

Existing standalone users may continue to use this repository as-is, but new installations should prefer the appropriate BLU addon.

***

## <span style="color: #c24e37;">✨ Behavior and Features</span>

- Plays the selected Super Mario Bros. 3-inspired sound on `PLAYER_LEVEL_UP`.
- Provides high, medium, and low OGG variants; medium is selected by default.
- Plays through the Master sound channel by default.
- Requests that RGX-Framework mute the configured default level-up sound while SMB3LU is enabled.
- Persists enablement and sound-variant choices in `SMB3LUSettings`.
- Shows a welcome message on login while that saved preference remains enabled.
- Includes a test command for checking playback immediately.

SMB3LU does not alter leveling, experience gains, UI frames, or game data. It only handles the sound associated with the player's level-up event.

***

## <span style="color: #c24e37;">🎮 Requirements and Compatibility</span>

`RGX-Framework` is a required dependency and must be installed and enabled. The current TOCs declare these game interfaces:

| WoW flavor | TOC | Interface |
|---|---|---:|
| Retail | `SuperMarioBros3LevelUp.toc` | `120007` |
| Wrath Classic | `SuperMarioBros3LevelUp_Wrath.toc` | `30403` |
| Burning Crusade Classic | `SuperMarioBros3LevelUp_TBC.toc` | `20504` |
| Classic Era | `SuperMarioBros3LevelUp_Vanilla.toc` | `11500` |

These values describe the preserved release metadata. The addon is deprecated, so they are not a promise of compatibility with later game clients.

***

## <span style="color: #c24e37;">🌍 Language Support</span>

SMB3LU ships complete in-game text for all 12 WoW client locales: **enUS** (base), **deDE**, **esES**, **esMX**, **frFR**, **itIT**, **koKR**, **ptBR**, **ptPT**, **ruRU**, **zhCN**, and **zhTW**. Chat output, command feedback, and the login welcome message are translated for each locale, and every `## X-Localizations` entry in the shipped TOCs lists exactly this set. Clients in any other or unmatched locale fall back to the enUS strings without errors.

***

## <span style="color: #c24e37;">📥 Installation</span>

1. Download a packaged release of SuperMarioBros3LevelUp and install RGX-Framework.
2. Extract both addon folders into the WoW client's `Interface/AddOns` directory.
3. Confirm that the folder is named `SuperMarioBros3LevelUp` rather than a source-archive name.
4. Enable `RGX-Framework` and `Super Mario Bros. 3 Level-Up!` at the character-selection AddOns screen.

For the consolidated replacement, install BLU or BLU Classic instead of the standalone addon.

***

## <span style="color: #c24e37;">⌨️ Usage and Configuration</span>

SMB3LU works automatically once enabled. It has no graphical configuration panel; use `/smb3lu` commands in chat:

| Command | Result |
|---|---|
| `/smb3lu` or `/smb3lu help` | List available commands. |
| `/smb3lu test` | Play the selected sound variant. |
| `/smb3lu enable` | Enable replacement playback. |
| `/smb3lu disable` | Disable replacement playback. |
| `/smb3lu high` | Select the high-quality file. |
| `/smb3lu med` or `/smb3lu medium` | Select the medium-quality file. |
| `/smb3lu low` | Select the low-quality file. |

The initial defaults are enabled, medium quality, Master-channel playback, default-sound muting, and the welcome message. Settings persist between sessions in `SMB3LUSettings`.

***

## <span style="color: #c24e37;">🧩 Files and Runtime</span>

- `data/locales.lua` defines chat and welcome text.
- `data/core.lua` registers the sound set, events, saved settings, and `/smb3lu` command.
- `sounds/super_mario_bros_3_{high,med,low}.ogg` are the active playback files.
- `media/icon.tga`, `media/logo.png`, and `media/kiwi.gif` provide addon and project artwork.

At addon load, SMB3LU initializes its RGX-Framework sound handle. At login it displays the optional welcome message. Each later `PLAYER_LEVEL_UP` event plays the selected variant when the addon is enabled, and logout allows the framework handle to finalize its state.

***

## <span style="color: #c24e37;">🛠️ Troubleshooting</span>

- If WoW marks SMB3LU as missing a dependency, install or enable `RGX-Framework`.
- If no custom sound plays, run `/smb3lu test`, then `/smb3lu enable` and select a variant again.
- If the default sound also plays, verify that SMB3LU and RGX-Framework both loaded without Lua errors.
- If WoW cannot find the addon, verify the exact `Interface/AddOns/SuperMarioBros3LevelUp` folder name.

Because the standalone project is retired, migrate to BLU or BLU Classic when you prefer the consolidated sound addon.

***

## <span style="color: #c24e37;">🔗 Project Links</span>

- [Repository](https://github.com/RGXMods/SuperMarioBros3LevelUp)
- [Releases](https://github.com/RGXMods/SuperMarioBros3LevelUp/releases)
- [Issues](https://github.com/RGXMods/SuperMarioBros3LevelUp/issues)
- [Author: DonnieDice](https://github.com/donniedice)
- [Support development](https://www.buymeacoffee.com/donniedice)

This repository is retained for existing users and historical context. Issue reports and contributions should account for the deprecation notice and the migration path above.

***

## <span style="color: #4ecdc4;">🌟 Thank you for choosing </span> <span style="color: #8b4b5c;">R</span><span style="color: #8b4b5c;">G</span><span style="color: #8b4b5c;">X</span> <span style="color: #4ecdc4;">Mods! 🌟</span>
