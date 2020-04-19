#!/bin/bash

# Complies Windows client and server from Linux with Wine set up and
# code::blocks installed therein in the default directory.
# Only works from within unpacked source zip since it skips the
# version generation step.

set -x

if test -r ~/.wine/drive_c/Program\ Files\ \(x86\)/CodeBlocks/codeblocks.exe; then
    CODEBLOCKS="C:\Program Files (x86)\CodeBlocks\codeblocks.exe"
else
    CODEBLOCKS="C:\Program Files\CodeBlocks\codeblocks.exe"
fi

# copy files
echo -e "makedist.bat\nexit\nexit\n" | wine cmd

#for p in Dedicated.cbp Armagetron.cbp; do 
#    wine "${CODEBLOCKS}" /ns /nd $p --build --target="Win32 Release" &
#done

#wait

# batch build sans master
grep -v Master.cbp < Armagetron.workspace > ArmagetronAdNoMaster.workspace
timeout=5
while test $timeout -gt 0; do
    timeout=$(( $timeout - 1 ))
    wine "${CODEBLOCKS}" /ns /nd ArmagetronAdNoMaster.workspace --build --target="Win32 Release"
    RET=$?
    if test $RET = 0; then
        timeout=0
    else
        for f in  ../dist/*.dll.a; do mv $f $(echo $f | sed -e 's,\.dll,,'); done
    fi
done
wait

# those are unwanted/useless
rm -f ../dist/*.a ../dist/SDL ../dist/SDL_image ../dist/SDL_mixer

exit $RET



