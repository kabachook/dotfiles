set GOPATH $HOME/go
set PATH $PATH $HOME/.local/bin $GOPATH/bin $HOME/.yarn/bin

set PATH $PATH (ruby -e 'puts Gem.user_dir')/bin

set EDITOR vim

function rscp
	command rsync -rtXx --numeric-ids --progress -e "ssh -T -c aes128-ctr -o Compression=no -x" $argv
end

function pubkey
    command more ~/.ssh/id_ed25519.pub | xclip -selection clipboard | echo '=> Public key copied to pasteboard.'
end

function privkey
    command more ~/.ssh/id_ed25519 | xclip -selection clipboard | echo '=> Private key copied to pasteboard.'
end

# Apparently doesn't work with gnome/nautilus/telegram/etc
function clipfile
    set fullpath (readlink -f $argv)
    command echo -e "x-special/nautilus\ncopy\nfile://$fullpath" | xclip -sel clip
end

function dredis
    command docker run -d --name redis -p 127.0.0.1:6379:6379 -v $HOME/.redis_data:/data redis:alpine redis-server --appendonly yes
end

function dredis-cli
    command docker run -ti --rm --net=host redis:alpine redis-cli $argv
end
