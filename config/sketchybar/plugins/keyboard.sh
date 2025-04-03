#!/usr/bin/env bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.USExtended') LABEL='ex' ;;
'com.apple.keylayout.Russian-Phonetic') LABEL='ру' ;;
'com.apple.keylayout.Urdu') LABEL='ٓا' ;;
'org.sil.ukelele.keyboardlayout.yiddishklal.yiddishklal') LABEL='אַ' ;;
esac

sketchybar --set keyboard label="$LABEL"
