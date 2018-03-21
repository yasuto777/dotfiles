# bashrc
# Yasuto Souma

# Environment variables
export DOT_DIR="${HOME}/dotfiles"
export BDOT_DIR="${HOME}/dotfiles/.bash"

# Load ${BDOT_DIR}/*.bash
for i in ${BDOT_DIR}/*.bash;do
  source ${i}
done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
