# PinkSoulLibrary Remake
![Static Badge](https://img.shields.io/badge/version-0.5-orange)
![Static Badge](https://img.shields.io/badge/by-jp222343-purple)![Static Badge](https://img.shields.io/badge/credits-u%2FKayakazan-green)

# The Pink Soul Library Remake
**"Pink Soul : Defend yourself...in rhythm ! (Kinda)" - u/Kayakazan, 2015.**
- This library is a remake of the first Pink Soul library created back in __2015__. The original owner is **u/Kayakazan**, so all the credits should be given to him.

## Why did i make this library?
- I made it due to the original library being removed from its uploaded page, so i decided to recreate it based on the [video](https://www.youtube.com/watch?v=6WUHM1Ck5j4&t=22s) that was left on youtube about it.

# Preview
[![Preview](https://jp222343.github.io/PinkSoulLibrary/assets/preview/video.mp4)]
---

# How to use the library
- 1 - Download the library on the releases tab. (Make sure to download the latest version)
- 2 - Extract the zip file and put all the folders on the desired place of your mod
- 3 - Follow the next instructions:

## Arena Size
- In your ``encounter.lua`` file, make sure that the ``arenasize`` for the pink soul wave is **{1, 100}** because it's recommended for the best experience.

## Inserting the library on a new wave
If you want to put the library on a new wave, follow these instructions:
**If you don't know how to install libraries, i recommend searching before doing these.**

- 1 - Import the library by placing this at the top of your wave script:
```local PinkSoulLibrary = require("Libraries/pinksoul")```
If you get an error, it might be because the library isn't on the correct folder (Libraries) or because you renamed the library lua file.

- 2 - Call the library by inserting this line somewhere in your script (DON'T INSERT IT INSIDE AN Update() FUNCTION):
  ```PinkSoulLibrary.PinkSoul()``` -- Parameters (Optional): mainy, lettery, maxrandomspeed, delay
    - The Parameters are explained [here]([https://example.com](https://github.com/jp222343/PinkSoulLibrary/blob/main/README.md#the-attack-function-1) (Scroll down to find them)
- 3 - Add these blocks to make the library work correctly, or else you will get an **error**.

```
-- DO NOT Remove this. If you need to use the Update() function, just add your code under the 'PinkSoulLibrary.Update()' line.
function Update()
    PinkSoulLibrary.Update()
end

-- DO NOT Remove this. If you need to use the OnHit() function, just add your code under the 'PinkSoulLibrary.OnHit(bullet)' line.
function OnHit(bullet)
    PinkSoulLibrary.OnHit(bullet)
end
```
**After that, you're ready to go! But before that, read the next instructions:**

## The attack function
- In the library example waves folder (if you're using it), you'll see a file called ``pinkattack.lua``, and it has many important functions.

  ### The attack function
  The attack function is the main function, and you can insert __optional__ **parameters** on it. The parameters needs to be put in this order:
  ```PinkSoulLibrary.PinkSoul(mainy, lettery, maxrandomspeed, delay)```

  **Here is the explanation of the parameters:**

| Parameter  | Explanation |
| ------------- | ------------- |
| mainy  | It's the **y** level of the Main Bullet (The pink thingy) - Default value is __70__  |
| lettery  | This is the **y** level of where the letters are going to spawn - Default value is __200__  |
| maxrandomspeed | The letters spawn at different speeds, going from **1** to **maxrandomspeed** - Default value is __3__ |
| delay | Delay for the letter spawning. (⚠️ **IT'S NOT IN SECONDS**) - Default value is __50__ (recommended) |

---

### And that's it! Feel free to edit or improve this library.
### All credits go to u/Kayakazan



  
