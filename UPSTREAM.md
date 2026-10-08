# Upstream

| | |
| --- | --- |
| Project | Google CTF (official archive of challenges) |
| Repository | https://github.com/google/google-ctf |
| Challenge | `2020/quals/web-log-me-in` (Google CTF 2020) |
| Version | master (the archive has no releases) |
| Commit | 4a8f8d7808254d40f226ac2ab4604601e0e57d57 |
| Licence | Apache-2.0 |

| Here | google-ctf path |
| --- | --- |
| `build/log-me-in/app/` | [`2020/quals/web-log-me-in`](https://github.com/google/google-ctf/tree/4a8f8d7808254d40f226ac2ab4604601e0e57d57/2020/quals/web-log-me-in): `app/`, `attachments/`, `README.md`, `exploit.txt` |
| `build/db/app/` | the same folder: `Dockerfile`, `sql/` |

The vendored files are that commit's challenge folder, unchanged, without its Git history, split between the two
build contexts so that each machine's build sees the files it needs (every file is vendored once). The flag is
upstream's own: `flagValue` in `app/app.js`.

Upstream ran the app on App Engine (`app/app.yaml`, `nodejs12`) with Cloud SQL, and ships a Dockerfile only for
the local MySQL (`FROM mysql/mysql-server:latest`). Here:

- `build/db/Dockerfile` is upstream's MySQL Dockerfile pinned to `mysql/mysql-server:8.0.21`;
- `build/log-me-in/Dockerfile` runs the app as upstream's README does locally (`DEV=1`, which connects to MySQL on
  localhost as user `ctf`), on `node:12.22.12` with `npm ci` from upstream's `package-lock.json`, plus a small
  Node TCP relay from 127.0.0.1:3306 to the `db` machine.

To update, replace the vendored files with a newer google-ctf commit, then change this file.
