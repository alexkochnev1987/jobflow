module.exports = {
    apps: [
        {
            name: 'jobflow',
            exec_mode: 'cluster',
            instances: 2,
            max_memory_restart: '250M',
            script: 'node_modules/next/dist/bin/next',
            args: 'start',
            watch: false,
            env_local: {
                APP_ENV: 'local' // APP_ENV=local
            },
            env_development: {
                APP_ENV: 'dev' // APP_ENV=dev
            },
            env_production: {
                APP_ENV: 'prod' // APP_ENV=prod
            }
        }
    ]
}