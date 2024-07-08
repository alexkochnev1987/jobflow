FROM node:20.15.0
WORKDIR /usr/src/app
ENV CI=true

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

EXPOSE 3000

RUN rm .env.*

RUN npm run build

CMD ["npm", "start"]