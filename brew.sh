#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# xcode-select --install

# install homebrew. uncomment this line on system that haven't installed brew yet
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/versions
brew tap caskroom/cask

# Make sure we’re using the latest Homebrew.
echo "update brew"
brew update

# Upgrade any already-installed formulae.
echo "upgrade all installed package"
brew upgrade --all

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
echo "install coreutils"
brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install Java
brew install Caskroom/cask/java

echo "install another useful utilities ..."

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
brew install ctags

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install more recent versions of some macOS tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
echo "install CTF - security research tools"
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install homebrew/x11/xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode

#brew install exiv2
brew install git
brew install git-lfs
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli

# personal tools for work - hqthao
echo "install hqthao working utilities ..."

# Node
brew install node
npm install -g nodemon
npm install -g express

# android
brew install gradle
brew install android-sdk
brew install dex2jar

# tmux
brew install tmux
brew install reattach-to-user-namespace --wrap-pbcopy-pbpaste && brew link reattach-to-user-namespace
gem install tmuxinator

# vim
brew install vim --with-python --with-override-system-vi
brew install macvim
brew linkapps macvim
git clone https://github.com/powerline/fonts.git ~/powerline && cd ~/powerline && ./install.sh && rm -r -f ~/powerline
git clone https://github.com/hqt/dotfile.git ~/dotfile && cd ~/dotfile && \
                  cp ~/dotfile/.vimrc ~/ \
                  cp ~/dotfile/.tmux.conf ~/ \
                  cp ~/dotfile/.ideavimrc ~/ \
                  cp ~/dotfile/.vifmrc ~/ \
                  cp ~/dotfile/.zshrc ~/


brew install neovim/neovim/neovim --with-python
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

brew install ag

brew install mongodb
brew install redis

" copy all dotfile to home folder
echo "Copy dotfile ..."

# Remove outdated versions from the cellar.
#brew cleanup
