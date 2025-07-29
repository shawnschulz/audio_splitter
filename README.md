# audio_splitter

## Usage

Clone the repo:

```
git clone https://github.com/shawnschulz/audio_splitter.git
```

Make sure ffmpeg is installed:

```
sudo apt install ffmpeg
```

Next, it's easier to use the script through an alias (you can put in .bashrc or PATH if you'd like)

```
cd audio_splitter
alias audio_splitter=$(pwd)/auto_splitter.sh
alias mkv_to_aac=$(pwd)/mkv_to_aac.sh
```

Take your .mkv file from an obs download and convert it to an aac, then run the audio_splitter script

```
touch junk
mkv_to_aac filename.mkv
# When done a number of audio files will appear in your folder
audio_splitter filename.aac
```
