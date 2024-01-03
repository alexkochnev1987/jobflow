module.exports = {
    apps: [
        {
            name: 'jobflow',
            exec_mode: 'cluster',
            instances: 1,
            max_memory_restart: '500M',
            script: 'node_modules/next/dist/bin/next',
            args: 'start',
            watch: true,
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