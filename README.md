# dotfiles
My dotfiles repo and bootstrapping script for Arch (and Manjaro), and macOS currently.
This does not install desktop environments or anything, you'll still have to do that manually!
However, it does install most of the applications I use on my computer, if on Arch, macOS.

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

