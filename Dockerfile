FROM node:14-alpine
RUN (curl -Ls https://cli.doppler.com/install.sh || wget -qO- https://cli.doppler.com/install.sh) | sh
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY backend/package*.json ./
USER node
RUN npm install
COPY --chown=node:node ./backend .
ENTRYPOINT ["doppler", "run", "--"]
EXPOSE 3000
CMD ["node", "src/app.js"]