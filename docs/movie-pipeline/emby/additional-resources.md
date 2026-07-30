# Additional Tools & Community Ecosystem

Here are some additional tools that I've found very helpful over my years of setting up my media pipeline. These aren't really necessary for 99% of use cases, but they help handle the fringe issues whenever they crop up.

## MKVToolNix

MKVToolNix is a piece of software I've found very helpful in dealing with troublesome files and discs. I primarily use it to splity or append files together (typical example, appending the two files for the Lord of the Rings Extended Editions). I have also found use in this to convert files to mkv easily, such as an issue I ran into where I use MakeMKV to backup the whole disc and convert the M2TS files over to MKV for easy handling. This tool doesn't require a GUI to use but since I use it for edge cases I find the GUI very helpful.

* [MKVToolNix Link For Windows](https://mkvtoolnix.download/downloads.html#windows)
  * This includes the GUI
* MKVToolNix command for Fedora: `sudo dnf install mkvtoolnix mkvtoolnix-gui`

## TheDiscDB

I use this for finding the correct file in MakeMKV in instances of playlist obfuscation. Also can be helpful for getting more info about a disc such as exact runtime for certain episodes of TV shows to help with the ordering.

* [TheDiscDB Link](https://thediscdb.com/)
* It is important to note for playlist obfuscation that having Java installed can help, which is detailed in the [makemkv page](../makemkv/ripping.md).

## FindVUK Online Database

This is helpful when you can't decrypt a disc from the KEYDB.cfg that MakeMKV is provisioning (or if you don't want to open the software to the internet). You simply download the file and add it to your MakeMKV configuration to utilize it. Very helpful for new releases.

* [FindVUK Online Database Link](https://fvonline-db.bplaced.net/)

## MakeMKV Forums

The official community board for MakeMKV. Usually these posts come up when you're searching for something, but you'll find a lot of answers to your ripping questions in here.

* [MakeMKV Forums Link](https://forum.makemkv.com/)

## Emby Community Forums

The official support and discussion hub for Emby Server. Usually these posts come up when you're searching for something, but you'll find a lot of answers to your media server questions in here.

* [Emby Forums Link](https://emby.media/community/)
