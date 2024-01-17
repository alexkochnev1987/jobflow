const execSync = require('child_process').execSync

function fetchSecrets() {
  try {
    return JSON.parse(
      execSync("doppler secrets download --no-file --format json"),
    )
  } catch (error) {
    process.exit(1)
  }
}

fetchSecrets()

module.exports = {
  apps: [
    {
      name: "jobflow",
      exec_mode: "cluster",
      instances: 2,
      max_memory_restart: "500M",
      script: "node_modules/next/dist/bin/next",
      args: "start",
      watch: false,
      env_local: {
        APP_ENV: "local", // APP_ENV=local
      },
      env_development: {
        APP_ENV: "dev", // APP_ENV=dev
      },
      env_production: {
        APP_ENV: "prod", // APP_ENV=prod
      },
    },
  ],
}
