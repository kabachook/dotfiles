set GOPATH $HOME/go
set PATH $PATH $HOME/.local/bin $GOPATH/bin $HOME/.yarn/bin

function rscp
	command rsync -rtXx --numeric-ids --progress -e "ssh -T -c aes128-ctr -o Compression=no -x" $argv
end

function pubkey
    command more ~/.ssh/id_ed25519.pub | xclip -selection clipboard | echo '=> Public key copied to pasteboard.'
end

function privkey
    command more ~/.ssh/id_ed25519 | xclip -selection clipboard | echo '=> Private key copied to pasteboard.'
end