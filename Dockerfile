
FROM node:20.14.0

# Install Doppler CLI
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg && \
    curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | gpg --dearmor -o /usr/share/keyrings/doppler-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/doppler-archive-keyring.gpg] https://packages.doppler.com/public/cli/deb/debian any-version main" | tee /etc/apt/sources.list.d/doppler-cli.list && \
    apt-get update && \
    apt-get -y install doppler

ARG DOPPLER_TOKEN
ENV DOPPLER_TOKEN $DOPPLER_TOKEN
WORKDIR /usr/src/app
RUN doppler secrets download --no-file --format env > .env

ENV CI=true
ENV NODE_ENV=production

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

EXPOSE 3000

RUN npm run build

CMD ["npm", "start"]