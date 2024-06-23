FROM debian:bookworm

RUN apt-get update -y && apt-get install -y \
  curl \
  wget \
  git \
  zsh \
  zip \
  neovim \
  jq \
  yq \
  dnsutils \
  iputils-ping \
  tcpdump \
  awscli \
  && rm -rf /var/lib/apt/lists/*

# Install AWS session manager
# https://docs.aws.amazon.com/systems-manager/latest/userguide/install-plugin-debian-and-ubuntu.html
RUN curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_arm64/session-manager-plugin.deb" -o "session-manager-plugin.deb"

RUN dpkg -i session-manager-plugin.deb
RUN rm -f session-manager-plugin.deb

# Install ohmyzsh
RUN sh -c \
  "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN chsh -s $(which zsh)

RUN sed -i 's/robbyrussell/ys/' $HOME/.zshrc

RUN curl -LO https://raw.githubusercontent.com/zeddee/dotfiles/master/vim_config/vimrc

RUN mkdir -p $HOME/.config/nvim && mv vimrc $HOME/.config/nvim/init.vim

ENTRYPOINT zsh


