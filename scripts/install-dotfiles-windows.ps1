#!/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -File
mkdir $HOME\Documents\WindowsPowerShell
cp -v dotfiles\powershell\Microsoft.PowerShell_profile.ps1 $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
cp -v dotfiles\powershell\omp.json $HOME/Documents/WindowsPowerShell

cp -v dotfiles\vimrc $HOME\_vimrc
cp -v dotfiles\gitconfig $HOME\.gitconfig

echo "Installing vim packages..."
.\scripts\install-vim-packages.ps1