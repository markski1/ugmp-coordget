# ugmp-coordget
A simple small filterscript to pick up centered coordinates from Liberty City and Vice City in the GTA: Underground modded version of SA-MP. 

## Why?

The GTA: Underground mod team has stated in numerous occasions that the possibility of cities moving in the map is not nil. This means that, if you create locations in your gamemode for these cities based off absolute coordinates, you're bound to get into a lot of tedious work if these are to change.

This filterscript allows you to get coordinates centered on these cities, so that you can then use the [correct offset natives](https://gtaundergroundmod.com/pages/ug-mp/documentation/native/ApplyMapOffsetToCoords) and have no issues when the cities move, if ever.

If you already got absolute coordinates in the gamemode, and don't want to suffer (or are already suffering) the above issue, you can use the [SACNR Coordinate Converter tool](https://devtools.undergroundcnr.com/coords.html) in order to convert them.

## Installation

Download ugmp_coordget.pwn and build it (or use the prebuilt .amx available in the repository, if you're the kind of people to run prebuilt AMX's on your server), then put it in the filterscripts folder and add it to your server.cfg's filterscript loader.

Do NOT use this filterscript in a production server. You'll have an unnecesary step sitting on top of your command processor, and players will be able to save coordinates and fill your disk.

## Usage

**/vcsave** - Saves a coordinate centered for Vice City.

**/lcsave** - Saves a coordinate centered for Liberty City.

Files are saved to the scriptfiles folder on your server.
