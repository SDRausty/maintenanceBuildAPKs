#!/bin/env bash 
# Copyright 2017-2019 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
#####################################################################
now=`date +%Y%m%d%s`
printf "\e[38;5;148m%s\n\e[0m" "$now" 
$1 https://services.gradle.org/distributions/gradle-5.1-milestone-1-bin.zip.sha256
$1 https://services.gradle.org/distributions/gradle-5.1-milestone-1-bin.zip
$1 https://maven.google.com/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar.md5
$1 https://maven.google.com/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar
$1 https://maven.google.com/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar.md5
$1 https://maven.google.com/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar
$1 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/apps-for-android/SampleSyncAdapter.zip
$1 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/apps-for-android/GesturesDemos.zip
$1 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/apps-for-android/AndroidGlobalTime_0.9.zip
$1 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/apps-for-android/AndroidGlobalTime.zip
$1 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/apps-for-android/WikiNotesForAndroid.zip
# https://developer.android.com/studio/#downloads
# sdk 92ffee5a1d98d856634e8b71132e8a95d96c83a63fde1099be3d86df3106def9
# https://developer.android.com/ndk/downloads/
# https://github.com/android-ndk/ndk
# ndk 500679655da3a86aecf67007e8ab230ea9b4dd7b
# http://central.maven.org/maven2/
