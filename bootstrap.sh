# make in case they aren't already there
mkdir -p "/usr/local/lib"
mkdir -p "/usr/local/bin"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install and use latest bash
brew install bash
chsh -s /usr/local/bin/bash

# Install git
brew install git

# Some git defaults
git config --global color.ui true
git config --global push.default simple

# global ignore some common files
echo -e 'node_modules\n.code\n.idea' > .gitignore_global
git config --global core.excludesfile ~/.gitignore_global


# Install nodejs
brew install nodejs
echo "prefix = /usr/local" > ~/.npmrc

# Install Node modules
modules=(
  jest
  starz
)

echo "installing node modules..."
npm install -g ${modules[@]}

# Install Brew Cask
echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

# Apps
apps=(
  iterm2
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}


# Make some commonly used folders
mkdir ~/github

# Install fish
brew install fish
curl -L https://get.oh-my.fish | fish

## Install autojump 
brew install autojump
echo '[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish' > ~/.config/fish/config.fish