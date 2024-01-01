#!/bin/bash

osascript -e 'tell application "System Preferences" to quit'

defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
defaults write "com.apple.menuextra.clock" ShowDate -int 2
defaults write "com.apple.menuextra.clock" ShowDayOfWeek -bool false
defaults write -g "KB_DoubleQuoteOption" -string '\\"abc\\"'
defaults write -g "KB_SingleQuoteOption" -string "'abc'"
defaults write -g "com.apple.sound.beep.feedback" -int 1
defaults write -g AppleKeyboardUIMode -int 3
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g AppleShowAllExtensions -bool true
defaults write -g AppleWindowTabbingMode -string "always"
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 5
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true
defaults write -g WebKitDeveloperExtras -bool true
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
defaults write com.apple.Safari HomePage -string "about:blank"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
defaults write com.apple.Safari ShowFavoritesBar -bool false
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari ShowSidebarInTopSites -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
defaults write com.apple.commerce AutoUpdate -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.find ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.find ShowHardDrivesOnDesktop -bool false
defaults write com.apple.find ShowMountedServersOnDesktop -bool false
defaults write com.apple.find ShowPathbar -bool true
defaults write com.apple.find ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.find ShowSidebar -bool true
defaults write com.apple.find ShowStatusBar -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location -string "${HOME}/Pictures/screenshots"
defaults write com.apple.screencapture type -string "png"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library
sudo chflags nohidden /Volumes

killall mds > /dev/null 2>&1
sudo mdutil -i on / > /dev/null
sudo mdutil -E / > /dev/null

for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done
