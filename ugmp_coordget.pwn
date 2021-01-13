/*

	UGMP Coord Getter by markski

	https://github.com/markski1
	https://mrks.cf

	Thanks to
		- SACNR
		- The hastily made UGMP docs.

*/

#include <a_samp>
#include <core>
#include <float>
#include <ugmp>

public OnFilterScriptInit()
{
	print("\n///");
	print("UGMP Coordinate Getter is loaded\n");
	print("If this is your production server, disable this filterscript!");
	print("Otherwise players will be able to fill your disk with these commands.\n");
	print("///\n");
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	// For the sake of not spending absurd amounts of time in a filterscript just do the ol' strtok
	new idx;
	new cmd[32];

	cmd = strtok(cmdtext, idx);

	new Float:x, Float:y, Float:z, Float:angle;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);


	if (!strcmp(cmd, "/lcsave", true)) {
		if (strlen(cmdtext) < 8) {
			SendClientMessage(playerid, 0xAA0000FF, "Usage: '/lcsave [comment/description]'");
			return 1;
		}
		SaveCityCoordinate(MAPOFFSET_NEWYORK, "LibertyCity_coords.txt", x, y, z, angle, cmdtext[idx+1], playerid);
    	return 1;
	}

	if(!strcmp(cmd, "/vcsave", true)) {
		if (strlen(cmdtext) < 8) {
			SendClientMessage(playerid, 0xAA0000FF, "Usage: '/vcsave [comment/description]'");
			return 1;
		}
		SaveCityCoordinate(MAPOFFSET_MIAMI, "ViceCity_coords.txt", x, y, z, angle, cmdtext[idx+1], playerid);
    	return 1;
	}

	return 0;
}

SaveCityCoordinate(offsetConst, filename[], Float:x, Float:y, Float:z, Float:angle, const comment[], playerid) {
	new Float:offsetX, Float:offsetY, Float:offsetZ;
	// Apply the offset but inverted in order to get centered coordinates
	offsetX = 0.0;
	offsetY = 0.0;
	offsetZ = 0.0;
	ApplyMapOffsetToCoords(offsetConst, offsetX, offsetY, offsetZ);
	x -= offsetX;
	y -= offsetY;
	z -= offsetZ;
	new saveText[144];
	// Formate as 'X, Y, Z, Angle | Description'
	format(saveText, 144, "%.4f, %.4f, %.4f, %.4f | %s\n", x, y, z, angle, comment);
	// And write to file
	new File:pfile = fopen(filename, io_append);
	fwrite(pfile, saveText);
	fclose(pfile);
	// Inform user of success
	format(saveText, 144, "Saved position '%s' in: %s.", comment, filename);
	SendClientMessage(playerid, 0x00FAFAFF, saveText);
}

strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
