#! /bin/bash

apt-get update -qq
apt-get upgrade -qq
apt-get install -qq --no-install-recommends \
    curl \
    zsh \
    git \

# Install oh-my-zsh with prompts removed.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh) --unattended"

# Install oh-my-zsh autosuggestion plugin (needs to be done in a different way than other plugins
# As it is developed by users.). Same for syntax-highlighting. The debian packages
# did not work.
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions && \
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting && \
git clone https://github.com/tymm/zsh-directory-history ~/.oh.my-zsh/plugins/zsh-directory-history

# Copy the preprepared zsh file to the zshrc file of the container.
cp .devcontainer/.zshrc ~/.zshrc

nitrile update
nitrile fetch
nitrile global install eastwood
