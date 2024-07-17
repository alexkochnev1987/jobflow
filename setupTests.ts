import { DockerComposeEnvironment } from "testcontainers";
async function setupContainers() {
  const composeFilePath = "./";
  const composeFile = "docker-compose.yml";

  const environment = await new DockerComposeEnvironment(composeFilePath, composeFile)
    .withEnvironmentFile(".env")
    .up();


    // TODO: Seed data into the MySQL container

  return environment;
}



beforeAll(async () => {
  console.debug('test')
  const environment = await setupContainers();

  console.debug('environment', environment);
}, 100000)