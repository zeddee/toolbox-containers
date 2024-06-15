FROM debian:bookworm

RUN apt-get update -y && apt-get install -y \
  curl \
  git \
  zsh \
  neovim \
  && rm -rf /var/lib/apt/lists/*

# Install ohmyzsh
RUN sh -c \
  "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN chsh -s $(which zsh)

RUN sed -i 's/robbyrussell/ys/' $HOME/.zshrc

RUN curl -LO https://raw.githubusercontent.com/zeddee/dotfiles/master/vim_config/vimrc

RUN mkdir -p $HOME/.config/nvim && mv vimrc $HOME/.config/nvim/init.vim

ENTRYPOINT zsh


