#notrayicon
func init()
global $config=@scriptdir&"\soundboard.ini"
local $keys[55]
$keys[0]="a"
$keys[1]="b"
$keys[2]="c"
$keys[3]="d"
$keys[4]="e"
$keys[5]="f"
$keys[6]="g"
$keys[7]="h"
$keys[8]="i"
$keys[9]="j"
$keys[10]="k"
$keys[11]="l"
$keys[12]="m"
$keys[13]="n"
$keys[14]="o"
$keys[15]="p"
$keys[16]="q"
$keys[17]="r"
$keys[18]="s"
$keys[19]="t"
$keys[20]="u"
$keys[21]="v"
$keys[22]="w"
$keys[23]="x"
$keys[24]="y"
$keys[25]="z"
$keys[26]="`"
$keys[27]="1"
$keys[28]="2"
$keys[29]="3"
$keys[30]="4"
$keys[31]="5"
$keys[32]="6"
$keys[33]="7"
$keys[34]="8"
$keys[35]="9"
$keys[36]="0"
$keys[37]="{backspace}"
$keys[38]="{enter}"
$keys[39]="{home}"
$keys[40]="{end}"
$keys[41]="{pgup}"
$keys[42]="{pgdn}"
$keys[43]="{f1}"
$keys[44]="{f2}"
$keys[45]="{f3}"
$keys[46]="{f4}"
$keys[47]="{f5}"
$keys[48]="{f6}"
$keys[49]="{f7}"
$keys[50]="{f8}"
$keys[51]="{f9}"
$keys[52]="{f10}"
$keys[53]="{f11}"
$keys[54]="{f12}"
$numkeys=ubound($keys)
global $prefix=iniread($config,"general","prefix","^!")
if not fileexists($config) then
iniwrite($config,"general","prefix",$prefix)
for $i=0 to $numkeys-1
if $keys[$i]="q" then
iniwrite($config,"keys",$keys[$i],"quit")
elseif $keys[$i]="r" then
iniwrite($config,"keys",$keys[$i],"reload")
else
iniwrite($config,"keys",$keys[$i],"nosound")
endif
next
endif
reload()
endfunc
func quit()
exit
endfunc
func reload()
global $prefix=iniread($config,"general","prefix","^!")
local $defkeys=inireadsection($config,"keys")
local $numdefkeys=ubound($defkeys)
for $i=1 to $numdefkeys-1
hotkeyset($prefix&$defkeys[$i][0],"sound")
next
endfunc
func sound()
if not $prefix="" then
$keyname=stringreplace(@hotkeypressed,$prefix,"")
else
$keyname=@hotkeypressed
endif
$sound=iniread($config,"keys",$keyname,"")
if $sound="quit" then
quit()
endif
if $sound="reload" then
reload()
endif
if $sound="nosound" then
$sound=fileopendialog("select a sound file for "&$keyname,@desktopdir,"sound files (*.mp3;*.wav)",3)
iniwrite($config,"keys",$keyname,$sound)
endif
if $sound="quit" then
quit()
endif
if $sound="reload" then
reload()
$sound="c:\"
endif
if fileexists($sound) then
soundplay($sound)
reload()
else
$newsound=fileopendialog("The configured sound file cannot be found. Please select a sound file for "&$keyname,@desktopdir,"sound files (*.wav;*.mp3)",3)
iniwrite($config,"keys",$keyname,$newsound)
soundplay($newsound)
reload()
endif
endfunc
init()
while 1
reload()
sleep(2000)
wend
