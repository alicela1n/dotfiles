# dotfiles
My dotfiles repo and bootstrapping script for Arch (and Manjaro), macOS, and Fedora currently.
This does not install desktop environments or anything, you'll still have to do that manually!
However, it does install most of the applications I use on my computer, if on Arch, macOS, or Fedora.

I use Gentoo Linux as my main currently, however I don't feel like it's necessary to add my package list,
since I stage4 tar and unpack my Gentoo install!

**Most of this script is distro/desktop environment independent and parts that aren't will be
skipped if you're not on a supported distro.**

I tried keeping package lists fairly consistent across distros but I might have missed things, I'll
add them later.

# installation of everything
You will be asked for your root password throughout the install!
```
$ ./install.sh
```

# installation of ONLY dotfiles
```
$ scripts/install-dotfiles.sh
```

