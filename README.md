homeslice
=========

## Installing

Clone into your home directory (maybe with a dot prefix to hide)

```bash
git clone git@github.com:tedslittlerobot/homeslice.git .homeslice
```

then add

```bash
source ~/.homeslice/homeslice.sh
```

to your zshrc, bashrc or whatever rc you use

## Custom Install

If you choose a different directory to install homeslice to, assign its full path to `HOMESLICE_DIR`. So, for say, `~/somewhere/homeslice`:

```bash
HOMESLICE_DIR=~/somewhere/homeslice
source ~/somewhere/homeslice/homeslice.sh
```

Or, if you're a serious bash ninja, you can condense the source and variable into one line:

```bash
source ${HOMESLICE_DIR:=~/somewhere/homeslice}/homeslice.sh
```

## Updating

`cd` into your homeslice dir, and git pull

or use a handy command that does all that for you...

```bash
upslice
```

## Commands

### Git

#### `clonestream`

```bash
clonestream repo-name [folder origin upstream url suffix]
```

This command is a mix of a few common git commands. In short, it clones a forked repo, and adds the upstream repo.

`CLONESTREAM_UPSTREAM` and `CLONESTREAM_ORIGIN` (if they are set) are default values for the origin and upstream arguments. They should be the github upstream (original) and working (forked) accounts for the repo you are using.

They should be defined **AFTER** sourcing homeslice

### Vagrant

- `stead` SSH into Homestead
- `hsup` Homestead `up`
- `hssr` Homestead soft reset (`halt` + `up`)
- `hshr` Homestead hard reset (`destroy` + `up`)
- `hsp` Homestead `provision`
- `hsdown` Homestead `halt`
- `sth` Edit Homestead settings in Sublime
