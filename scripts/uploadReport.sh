#!/usr/bin/env bash

URL=https://nextcloud.kaminsky.me/remote.php/webdav/android-integrationTests
ID=$3
USER=$1
PASS=$2
TYPE=$4

if [ $TYPE = "IT" ]; then
    cd build/reports/androidTests/connected/flavors/GPLAY
else
    cd build/reports/tests/testGplayDebugUnitTest
fi

find . -type d -exec curl -u $USER:$PASS -X MKCOL $URL/$ID/$(echo {} | sed s#\./##) \;
find . -type f -exec curl -u $USER:$PASS -X PUT $URL/$ID/$(echo {} | sed s#\./##) --upload-file {} \;

echo "Uploaded failing tests to https://www.kaminsky.me/nc-dev/android-integrationTests/$ID"
exit 1
