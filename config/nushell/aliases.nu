alias nopen = open
alias open = ^open


alias grep = rg
alias skim = /Applications/Skim.app/Contents/MacOS/Skim
alias be = bundle exec
alias l = ls --all
alias c = clear
alias ll = ls -l
alias lt = eza --tree --level=2 --long --icons --git
alias v = nvim
alias vi = nvim
alias more = less
alias as = aerospace

def ff [] {
    aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}

alias .. = cd ..

# Git
alias gs = git status
alias gd = git diff
alias gcm = git commit -m
alias gpom = git push origin main
alias gp = git push origin HEAD
alias gpu = git pull origin
alias glog = git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit
alias gco = git checkout
alias gb = git branch
alias gba = git branch -a
alias gadd = git add
# alias ga = git add -p
alias ga = git add
alias gcoall = git checkout -- .
alias gr = git remote
alias gre = git reset

alias da = dirs add
alias dn = dirs next
alias dp = dirs prev
alias ds = dirs
alias dg = dirs goto
