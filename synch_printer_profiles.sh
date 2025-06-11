#!/bin/bash
#  file to copy the orca slicer profiles from their base locations to my synology
#	drive to make sure I have a backup of all the profiles created in the app
#	
#	CDW 12/01/2024


rsync -avh --progress ~/Library/'Application Support'/OrcaSlicer/user/3054054929/ ~/SynologyDrive/'Neptune 3D profiles'
