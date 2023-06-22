This program, once executed, can be used to map key presses to sounds. 
It is configured using the soundboard.ini file that it generates in its current directory. 
The default prefix key combination is control+alt. To program a sound, hold down the prefix key and press a letter, number, or function key. A file selection dialog will appear. Simply select a sound, and the program will remember and play back the sound every time the key is pressed. 
In case you edit the ini file, the program will reread its config file every 2 seconds. 
To change the prefix key or other settings, change the prefix line in the general section of the config file. 
Two special values are supported, quit, which unloads the program from memory, and reload, which stops all currently playing sounds and force rereads the config file. 
By default, quit is bound to prefix+q, and reload is bound to prefix+r.
Since the program can be activated using standard key presses, it can be used as a communication aid for those with physical disabilities using alternative input devices that can be programmed to mimic key presses. A caretaker can record and assign sounds for commonly used phrases or other messages.
