homeslice
=========

Clone into your home directory (maybe with a dot prefix to hide)

```bash
git clone git@github.com:tedslittlerobot/homeslice.git .homeslice
```

then add

```bash
source ~/.homeslice/homeslice.sh
```

to your zshrc, bashrc or whatever rc you use

If you choose a different directory to install homeslice to, assign its full path to `HOMESLICE_DIR`. So, for say, `~/somewhere/homeslice`:

```bash
HOMESLICE_DIR=~/somewhere/homeslice
source ~/somewhere/homeslice/homeslice.sh
```

Or, if you're a serious bash ninja, you can condense the source and variable into one line:

```bash
source ${HOMESLICE_DIR:=~/somewhere/homeslice}/homeslice.sh
```
