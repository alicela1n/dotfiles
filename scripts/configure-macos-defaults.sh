#!/usr/bin/env zsh
echo "DS_Store go away!..."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Showing all extensions..."
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Setting pink accent color..."
defaults write NSGlobalDomain AppleAccentColor -integer 6

echo "Setting pink highlight color..."
defaults write NSGlobalDomain AppleHighlightColor -string "1.000000 0.749020 0.823529 Pink"

echo "Disabling auto-correct..."
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Disabling auto-capitalization..."
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

echo "Disabling quote substitution..."
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Disabling dash substitution..."
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "Put drives on desktop..."
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "Making finder better..."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarMediaBrowserSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarSharedSectionDisclosedState -bool true
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarSharedSectionDisclosedState -bool true

echo "Showing transparent icons for hidden apps..."
defaults write com.apple.Dock showhidden -bool YES
killall Dock

echo "Stopping time machine from offering new disks for backup..."
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Disabling annoying pop up alerts..."
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Do not reopen previous content window on next launch please..."
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
defaults write com.apple.QuickTimePlayer NSQuitAlwaysKeepsWindows -int 0
defaults write com.apple.Preview NSQuitAlwaysKeepsWindows -int 0

echo "Disabling automatic termination of inactive apps..."
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
defaults write com.apple.iChat NSDisableAutomaticTermination -bool yes

echo "Setting status bar clock..."
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM h:mm:ss\""

echo "Showing library folder..."
chflags nohidden ~/Library/

echo "Disabling gatekeeper..."
sudo spctl --master-disable
