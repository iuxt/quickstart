apt update

# 安装常用工具和配置
apt install -y vim git git-lfs
cp .gitconfig ~

# oh my zsh
apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .zshrc ~
plugins_list="$(cat ~/.zshrc | grep -E "^plugins=(.*)" | sed 's/)//g')"

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's#^ZSH_THEME=.*#ZSH_THEME="powerlevel10k/powerlevel10k"#g' ~/.zshrc
cp .p10k.zsh ~

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
plugins_list="$plugins_list zsh-autosuggestions"


# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins_list="$plugins_list zsh-syntax-highlighting"

# 替换plugins list on zshrc
sed -i "s/^plugins=(.*)$/$plugins_list)/g" ~/.zshrc
mkdir ~/.termux
cp font.ttf ~/.termux/
