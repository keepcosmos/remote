echo "Installing pyenv..."
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash >/dev/null
echo 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
source ~/.zshrc
pyenv update >/dev/null

echo "Installing python 3.6.3"
pyenv install 3.6.3 >/dev/null
pyenv global 3.6.3
source ~/.zshrc
