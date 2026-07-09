# Library Management & Ingestion

## Directory Structure
Emby requires a strict hierarchy to identify media metadata correctly:

```text
/mnt/nas/media/
├── Movies/
│   └── Movie Name (Year)/
│       └── Movie Name (Year).mkv
└── TV/
    └── Show Name/
        └── Season 01/
            └── Show Name - S01E01 - Episode Title.mkv
```

## Moving to NAS
1. **Rename:** Ensure the file matches the convention above.
2. **Transfer:** Move/Copy files from local "Staging" folder to the mounted NAS drive (Z: on Windows or `/path/to/nas` on Fedora).
3. **Rescan:** In Emby Web UI, trigger a "Scan Library" task to pull metadata.

## Emby Documentation Links
* [Movie Naming](https://emby.media/support/articles/Movie-Naming.html)
* [TV Naming](https://emby.media/support/articles/TV-Naming.html)
* [Music Naming](https://emby.media/support/articles/Music-Naming.html)
* [Metadata Manager](https://emby.media/support/articles/Metadata-manager.html)