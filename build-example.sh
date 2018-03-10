#!/bin/bash
# example of how to use this docker image to build for serranoveltexx

if test ! -f docker-id; then
  cd docker
  docker build --iidfile=../docker-id .
  cd ..
fi

docker run \
-e "USER_NAME=T4b" \
-e "USER_MAIL=nobody@t4b.me" \
-e "WITH_SU=true" \
-e "RELEASE_TYPE=microG-su-UNOFFICIAL" \
-e "DEVICE_LIST=serranoveltexx" \
-e "BRANCH_NAME=cm-14.1" \
-e "CRONTAB_TIME=now" \
-e "SIGNATURE_SPOOFING=restricted" \
-e "INCLUDE_PROPRIETARY=false" \
-e "CUSTOM_PACKAGES=GmsCore GsfProxy FakeStore FDroid FDroidPrivilegedExtension MozillaNlpBackend NominatimNlpBackend com.google.android.maps.jar" \
-e "SIGN_BUILDS=true" \
-v "/home/t4b/.ccache:/srv/ccache" \
-v "/home/t4b/android/lineageos/system:/srv/src" \
-v "/home/t4b/android/docker/zips:/srv/zips" \
-v "/home/t4b/android/docker/local_manifests:/srv/local_manifests" \
-v "/home/t4b/android/docker/userscripts:/srv/userscripts" \
-v "/home/t4b/android/docker/keys:/srv/keys" \
-v "/home/t4b/android/docker/logs:/srv/logs" \
$(cat docker-id)
