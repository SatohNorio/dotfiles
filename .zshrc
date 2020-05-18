# ----- プロンプトのカスタマイズ ----- 
PROMPT='
%F{magenta}%B%n%b%f@%F{blue}%U%m%u%f %F{green}[%~]%f
%* %# '

# ----- ディレクトリ移動 -----
setopt share_history		# 他のターミナルと履歴を共有
setopt histignorealldups	# 履歴に重複を表示しない
# setopt auto_cd			# cd コマンドを省略して、ディレクトリ名のみで移動
setopt auto_pushd		# 自動で pushd を実行
setopt pushd_ignore_dups	# pushd から重複を削除
# setopt correct			# コマンドミスを修正
cdpath=(~)			# どこからでも参照できる

# ----- 色の使用 -----
autoload -Uz colors
colors

# ----- 補完 -----
autoload -Uz compinit
compinit
zstyle ':completion:*:default' menu select=2			# 補完後メニュー選択モードになり左右キーで移動ができる
zstyle ':completion:*:default' match-list 'm:{a-z}={A-Z}'	# 大文字小文字を区別しない
# bindkey -M menuselect 'h' vi-backward-char			# 補完時にhjklで選択
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char

# ----- 補完の色設定 -----
# 参考: 漢のzsh - https://news.mynavi.jp/article/zsh-9/
# export LSCOLORS=exfxcxdxbxegedabagacad
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ----- 予測入力 -----
# autoload predict-on
# zle -N predict-on
# zle -N predict-off
# bindkey '^X^P' predict-on
# bindkey '^O' predict-off
# zstyle ':predict' verbose true

# ----- ls コマンドカスタマイズ -----
chpwd() { ls -lAGF }		# 更新時間の降順にソートしてカラーでリスト表示
alias la='ls -lAGF'

# ----- ファイル一括リネーム -----
autoload -Uz zmv
alias zmv='noglob zmv -W'

export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

