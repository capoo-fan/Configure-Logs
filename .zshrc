# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# turbo 模式的启动
PS1="READY > "
zinit ice wait'!0' 


# Powerlevel10k 主题
zinit ice depth=1; 
zinit light romkatv/powerlevel10k


# 语法高亮
zinit load zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-syntax-highlighting

# vim mode
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# 自动补全
zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit ice blockf

# zsh 自带的功能
setopt autocd # 更改文件夹
setopt correct # 自动更正命令
# 环境变量的设置
export EDITOR=code      # 编辑文件
export VISUAL=code      # 阅读文件
export SUDO_EDITOR=code # 设置默认编辑器为vscode
export FCEDIT=code      # 设置默认编辑器为vscode
export TERMINAL=wezterm # 设置默认终端

# 历史记录的设置
HISTSIZE=10000  #历史记录的最大值
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE  #最大存储条数
HISTDUP=erase #删除重复的记录
setopt appendhistory #追加历史记录
setopt sharehistory #共享历史记录
setopt hist_ignore_space
setopt hist_ignore_all_dups #忽略重复的记录
setopt hist_save_no_dups #不存储重复的记录
setopt hist_ignore_dups  #忽略重复的记录
setopt hist_find_no_dups #不查找重复的记录
setopt NO_CASE_GLOB #不区分大小写
##$ 其他的终端工具
# fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git" #显示隐藏文件,同时排除gitignore所忽略的文件
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"  # ctrl+t 启动fzf
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'" #ctrl+t预览文件内容,显示500行
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always{} | head -200'" #alt+t预览文件内容_fzf
_fzf_comprun(){
  local command=$1
  shift

  case "$command" in #设置预览命令,通过一个switch case语句来区分不同的命令
  cd)           fzf --preview 'eza --tree --color=always {}|head -200' "$@" ;; #会以树状结构展示文件
  export|unset) fzf --preveiw "eval 'echo \$' {}"                       "$@" ;;
  ssh)          fzf --preview 'dig {}'                                  "$@" ;;
  *)            fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
  esac
}
_fzf_compgen_path(){
  fd --hidden --exclude .git . "$1" 
}
_fzf_compgen_dir(){
  fd --type=d --hidden --exclude .git . "$1" #自动补全文件路径
}
#source ~/fzf-git.sh/fzf-git.sh

# the fuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"
# bat (better cat)
export BAT_THEME="OneHalfDark" # 设置主题
# eza (better ls)
alias ls="eza -a --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --git-ignore --git-repos-no-status"





# 快捷命令的定义
alias c='clear' # 清屏
alias q='exit'  #退出终端
# eza


# 使用zinit添加oh my zsh 插件
# zinit snippet OMZP::git

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

