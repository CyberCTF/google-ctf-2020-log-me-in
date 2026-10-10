#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) in /ctf/flag (the app reads it for Michelle's flag page);
# without one (CI, a run by hand) the development flag.
dev='CTF{dev-google-ctf-2020-log-me-in}'
printf '%s\n' "${CTF_FLAG_MAIN:-$dev}" > /ctf/flag
chmod 444 /ctf/flag
