" let g:tmuxline_preset = {
"         \ 'a': '#S',
"         \ 'win': '#I #W',
"         \ 'cwin': '#I #W',
"         \ 'y': [
"           \ '  #(~/.tmux/plugins/tmux-spotify/scripts/spotify_status.sh)',
"           \ '#(~/.tmux/plugins/tmux-spotify/scripts/spotify_artist.sh)',
"           \ '#(~/.tmux/plugins/tmux-spotify/scripts/spotify_track.sh)',
"         \ ],
"         \ 'z': ['%b %d', '%R'],
"         \ 'options': {
"         \'status-justify': 'left'}
"         \}

let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'win': '#I #W',
        \ 'cwin': '#I #W',
        \ 'z': ['%b %d', '%R'],
        \ 'options': {
        \'status-justify': 'left'}
        \}
