# The Log-Me-In web app. Upstream ships no Dockerfile for it: it ran on App Engine (app/app.yaml,
# runtime nodejs12) against Cloud SQL, and the README runs it locally with
# `DEV=1 npm start --prefix ./app/ ./app/app.js` next to the MySQL container. This Dockerfile does that:
# - Node.js 12 (App Engine's nodejs12 runtime), dependencies from upstream's package-lock.json (`npm ci`);
# - DEV=1, upstream's local mode, in which the app connects to MySQL on localhost:3306 as user ctf;
# - a small Node TCP relay on 127.0.0.1:3306 to the `db` machine, since the database is its own machine.
FROM node:12.22.12

WORKDIR /srv/app
COPY app/app/package.json app/app/package-lock.json ./
RUN npm ci --production
COPY app/app/ ./

ENV DEV=1 PORT=8088
EXPOSE 8088
CMD node -e "const n=require('net');n.createServer(c=>{const s=n.connect(3306,'db');c.on('error',()=>s.destroy());s.on('error',()=>c.destroy());c.pipe(s).pipe(c)}).listen(3306,'127.0.0.1')" & exec node app.js
