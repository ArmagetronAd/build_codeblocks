#!/bin/bash

# Complies Windows client and server from Linux with Wine set up and
# code::blocks installed therein in the default directory.
# Only works from within unpacked source zip since it skips the
# version generation step.

set -x

CODEBLOCKS="C:\Program Files\CodeBlocks\codeblocks.exe"

# copy files
echo -e "makedist.bat\nexit\nexit\n" | wine cmd

for p in Dedicated.cbp Armagetron.cbp; do 
    wine "${CODEBLOCKS}" /ns /nd $p --build --target="Win32 Release" &
done

wait

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
exit $RET



