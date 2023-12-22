## mg-drugrobbery
A drug warehouse robbery script for QBCore. 

*This is a work in progress, as I add more locations and a random job trigger.*

## Support the Dev
If this script was useful, please consider <a href = "https://www.buymeacoffee.com/mrgamesdevelopment">buying me a coffee</a>.

## Preview Video
*Coming soon*
<!-- - [Video](https://youtu.be/TODO) -->

## Features
- Customisable prop models & Items found
- An item can be used in another script mg-boatdelivery **coming soon**

## Installation

1) Download the script and place it in the [resource] folder of your project.

2) Add this in to qb-core/Shared/items.lua
```
jar_ak47                     = { name = 'jar_ak47', label = 'Jar of AK47', weight = 1000, type = 'item', image = 'ak47-oz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'An ounce of AK47 in a fancy jar!' },
jar_amnesia                  = { name = 'jar_amnesia', label = 'Jar of Amnesia Haze', weight = 1000, type = 'item', image = 'amnesia-oz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'An ounce of Amnesia Haze in a fancy jar!' },
jar_ogkush                   = { name = 'jar_ogkush', label = 'Jar of OG Kush', weight = 1000, type = 'item', image = 'og-kush-oz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'An ounce of OG Kush in a fancy jar!' },
jar_purps                    = { name = 'jar_purps', label = 'Jar of Purple Haze', weight = 1000, type = 'item', image = 'purple-haze-oz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'An ounce of Purple Haze in a fancy jar!' },
jar_skunk                    = { name = 'jar_skunk', label = 'Jar of Skunk #1', weight = 1000, type = 'item', image = 'skunk-oz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'An ounce of Skunk #1 in a fancy jar!' },
jar_whitewidow               = { name = 'jar_whitewidow', label = 'Jar of White Widow', weight = 1000, type = 'item', image = 'white-widow-oz.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'An ounce of White Widow in a fancy jar!' },
```
3) Open the "images" folder included and copy the images to qb-inventory/html/images

4) Add the following code to your server.cfg/resouces.cfg file:
```
ensure mg-gangwarehouserobbery
```

## Dependencies
* [qb-target](https://github.com/qbcore-framework/qb-target)
* [qb-menu](https://github.com/qbcore-framework/qb-menu)
* [qb-input](https://github.com/qbcore-framework/qb-input)
* [ps-ui](https://github.com/Project-Sloth/ps-ui)
* [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)

## Preview 
[mg-boats]**coming soon**

##
<img src="https://github.com/WJR1986/FiveM-Image-Pack/blob/main/professor.png" width="100" height="100"/>
Mr Games (Will)

## This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg