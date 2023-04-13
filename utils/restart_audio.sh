systemctl --user restart pulseaudio
rm -r ~/.config/pulse
pulseaudio -k