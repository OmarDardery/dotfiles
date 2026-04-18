# --- 1. Environment Variables ---
export EDITOR='micro'
export VISUAL='micro'

# Bun setup
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# --- 2. Starship Prompt ---
eval "$(starship init zsh)"

# --- 3. Completion System ---
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# --- 4. Plugins ---
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- 5. History Settings ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Bun completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
export ELECTRON_OZONE_PLATFORM_HINT=x11


. "$HOME/.local/bin/env"
# PDF to Editable Formats (Note: Results may vary)
alias pdf2docx='libreoffice --headless --convert-to docx'
alias pdf2pptx='libreoffice --headless --convert-to pptx'

# Office to PDF
alias docx2pdf='libreoffice --headless --convert-to pdf'
alias pptx2pdf='libreoffice --headless --convert-to pdf'
alias txt2pdf='libreoffice --headless --convert-to pdf'
