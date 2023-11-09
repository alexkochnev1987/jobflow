# JobFlow

## [Requeriments](./docs/requeriments.md)

## [Architecture](./docs/architecrure.drawio)

## [High Level Design](./docs/high-level-design.md)

## [Schema](./prisma/schema.prisma)

## Prerequisites

Doppler https://docs.doppler.com/docs/cli

Node 18.16.1

NVM


## Available Scripts

In the project directory, you can run the following scripts using npm or yarn:

### `npm run dev`

Starts the development server using Next.js and binds it to the necessary resources using Doppler.

### `npm run build`

Builds the project by generating Prisma models, pushing the database schema, and building the Next.js application. Doppler is used to manage environment variables.

### `npm run format:write`

Formats the code using Prettier and writes the changes to the specified file types: css, js, json, jsx, ts, tsx.

### `npm run format`

Formats the code using Prettier without writing changes.

### `npm start`

Starts the production server using Next.js. Doppler is used to manage environment variables.

### `npm run lint`

Lints the project using Next.js linting tools.

### `npm run deploy`

Deploys the project to the specified stage (prod in this case) using Serverless Toolkit (SST) and Doppler for environment variable management.

## Prisma Seed

To seed the database, you can run the following command:

### `npm run prisma:seed`

This command uses ts-node with specified compiler options to run the Prisma seed script located in `prisma/seed.ts`.

Please ensure you have the required dependencies and configurations set up before running these scripts. For any additional information or specific requirements, refer to the project documentation or reach out to the project maintainers.
