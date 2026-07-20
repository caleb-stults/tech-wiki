# Movie Pipeline Documentation

This is my how-to-guide on getting started ripping, compressing, and watching your movie collection. I chose MakeMKV for ripping (this appears to be the standard but there are other options like DVDFab), Handbrake for compression (also the standard), and Emby for my media server. I have also recently added some scripts to automate my pipeline process that you can find in this [Github repo](https://github.com/caleb-stults/media-center-pipeline).

## Which Media Server do I choose?
Emby isn't always talked about between it, Plex, and Jellyfin, but I find it to be a nice balance of features that actually work while being accessible and customizable. I think love for Plex is fading, but I know a lot of people really like Jellyfin. If you prefer true open source, Jellyfin is the way to go. I think the reasonable cost of a lifetime license for Emby is worth it for the features and the stability that appears to be lacking in Jellyfin. Plex still does work, but for self-hosting it's a high barrier to entry, and they are pushing their streaming service hard. I can't recommend Plex in good conscience. This guide was done with Emby in mind, so some of these steps may change if you use Jellyfin, but the MakeMKV and Handbrake articles will still be relevant.

## How To Get Started

This documentation is organized by the stages of the media workflow:

1.  **Ripping ([MakeMKV](movie-pipeline/makemkv/ripping.md))**:
    This is what allows you to get the file off of your disc unencrypted and uncompressed. You will also find instructions on how to flash your drive for 4k discs if desired.

2.  **Compressing ([Handbrake](movie-pipeline/handbrake/compression.md))**:
    Raw files are transcoded to optimize how much storage is used. This step can be skipped if you want to store the raw files. Be warned though, with 4k files the storage adds up quickly.

3.  **Watching ([Emby Setup](movie-pipeline/emby/setup.md))**:
    This details how to set up your Emby server so you can actually watch these files on your phone, computer, or TV.
    *   **[Library Management](movie-pipeline/emby/library-management.md)**: Metadata, naming conventions, and file organization strategies.
    *   **[Remote Access](movie-pipeline/emby/tailscale.md)**: Secure remote streaming via Tailscale, ensuring your media is accessible without exposing services to the public internet.