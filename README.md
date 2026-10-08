# Google CTF 2020: Log-Me-In

[Log-Me-In](https://github.com/google/google-ctf/tree/4a8f8d7808254d40f226ac2ab4604601e0e57d57/2020/quals/web-log-me-in), a web challenge from [Google CTF](https://capturetheflag.withgoogle.com/) 2020
(the official archive [google/google-ctf](https://github.com/google/google-ctf), by Google): an Express login page that passes the parsed request body straight to the mysql library, so a field can be an object instead of a string.
This repository runs it with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines.
The database is built by upstream's MySQL Dockerfile (pinned) in [`build/db/`](build/db), and the Node app by a
Dockerfile in [`build/log-me-in/`](build/log-me-in) that runs it the way upstream's README does locally (each header says how).

| Machine | Service |
| --- | --- |
| log-me-in | the Express app on port 8088, published on 8088 |
| db | MySQL 8.0 on port 3306 (not published) |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:8088/. The same spec runs as Docker on a local VM (`docker-vm`), on a
cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: the archive keeps the solution's request body in
[`exploit.txt`](https://github.com/google/google-ctf/blob/4a8f8d7808254d40f226ac2ab4604601e0e57d57/2020/quals/web-log-me-in/exploit.txt); public write-ups are listed on CTFtime.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

Apache-2.0, as the Google CTF archive ([LICENSE](LICENSE)). The third-party software inside the images keeps its own
licence. This challenge is deliberately vulnerable: keep it isolated.
