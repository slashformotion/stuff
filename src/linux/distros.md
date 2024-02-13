# Distributions Linux

Sur cette page vous allez trouver des notes sur différentes distributions linux. 

## Fedora 

Un des meilleurs guide d'after install pour fedora par [*Willi Mutschler*](https://mutschler.dev/): [Fedora Workstation: Things to do after installation (Apps, Settings, and Tweaks)](https://mutschler.dev/linux/fedora-post-install/)

Notes à moi-même: 
*Fix DNF*
```
sudo dnf install -y  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo 'fastestmirror=1' | sudo tee -a /etc/dnf/dnf.conf
echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
cat /etc/dnf/dnf.conf
# [main]
# gpgcheck=1
# installonly_limit=3
# clean_requirements_on_remove=True
# best=False
# skip_if_unavailable=True
# fastestmirror=1
# max_parallel_downloads=10
# deltarpm=true
```


*NVIDIA **WITH XORG***
```
modinfo -F version nvidia
sudo dnf update -y # and reboot if you are not on the latest kernel
sudo dnf install -y akmod-nvidia # rhel/centos users can use kmod-nvidia instead
sudo dnf install -y xorg-x11-drv-nvidia-cuda #optional for cuda/nvdec/nvenc support
sudo dnf install -y xorg-x11-drv-nvidia-cuda-libs
sudo dnf install -y vdpauinfo libva-vdpau-driver libva-utils
sudo dnf install -y vulkan
modinfo -F version nvidia
```

```
sudo dnf upgrade --refresh
sudo dnf check
sudo dnf autoremove
sudo fwupdmgr get-devices
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update
sudo reboot now

```

zsh 

```
sudo dnf install -y zsh
chsh -s /usr/bin/zsh
```

flatpak

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
flatpak install -y flatseal
```

git 
```
sudo dnf install -y git gitui

# Sublim merge
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-merge

```

Vscode
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install -y code
```

hugo 
```
sudo dnf install -y golang #dependency I need

export HUGOVER=`curl --silent "https://api.github.com/repos/gohugoio/hugo/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")'`
wget https://github.com/gohugoio/hugo/releases/download/v${HUGOVER:1}/hugo_extended_${HUGOVER:1}_Linux-64bit.tar.gz
tar -xvf hugo_extended_${HUGOVER:1}_Linux-64bit.tar.gz hugo
rm hugo_extended_${HUGOVER:1}_Linux-64bit.tar.gz
mv hugo ~/.local/bin/hugo
hugo version
```

Tex
```
sudo dnf install -y texlive-scheme-full
```

MS fonts
```
sudo dnf install -y curl cabextract xorg-x11-font-utils fontconfig
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
```

Vids
```
sudo dnf groupupdate sound-and-video
sudo dnf install -y libdvdcss
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,ugly-\*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg 
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264 mpv
```

LibreWolf

<https://librewolf.net/installation/fedora/>
```
sudo dnf config-manager --add-repo https://rpm.librewolf.net/librewolf-repo.repo
sudo dnf install librewolf
```

Git subtree <https://packages.fedoraproject.org/pkgs/git/git-subtree/>

```sh
sudo dnf install git-subtree
```




### Dev tools

### Gitui

repo <https://github.com/extrawurst/gitui>
```sh
cargo install --locked --git https://github.com/extrawurst/gitui
```

### Zellij

repo <https://github.com/zellij-org/zellij>
```sh
cargo install --locked zellij
```

### Lazydocker

repo <https://github.com/extrawurst/gitui>
```sh
go install github.com/jesseduffield/lazydocker@latest
```

### zellij

```sh
sudo dnf install pkg-config openssl-devel perl # needed to compile
cargo install zellij # gitui
```
