# JobFlow
[![DigitalOcean](https://web-platforms.sfo2.digitaloceanspaces.com/WWW/Badge%203.svg)](https://www.digitalocean.com/?refcode=038b4c02978c&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)


## Current Tasks

```mermaid
mindmap
    JobFlow
      Result page
        Result calculation https://github.com/guluarte/jobflow/issues/35
          Fix wrong percentages by narrowing down the prompt to sorting careers https://github.com/guluarte/jobflow/issues/35
          Generate random match numbers between 95% and 5% https://github.com/guluarte/jobflow/issues/41
          Adapt results page to show the first 5 careers for free https://github.com/guluarte/jobflow/issues/34
      Billing
        Require full payment for subpages https://github.com/guluarte/jobflow/issues/42
      User Quiz
        Smoothly jump between question groups https://github.com/guluarte/jobflow/issues/38
        x - No arrows for slider on mobile
          x - Limit arrows to desktop view only https://github.com/guluarte/jobflow/issues/31
        fix error accessing the window object https://github.com/guluarte/jobflow/issues/44
      Login Page
        Reset password link https://github.com/guluarte/jobflow/issues/32
        Improve user flow https://github.com/guluarte/jobflow/issues/43
      Development
        Testing
          x - Setup testcontainers
            x - Fix js-dom
            x - Seed initial data
            x - Configure jest
```

## Testing 
### Company users
user@example.com ^1234567890$

### Premium user:
casdsfdsf@guluarte.com ^1234567890$

## Billing

Open a new browser window in incognito mode and go to https://app.quereinstieg.com/

Test cards for billing see [Stripe docs](https://stripe.com/docs/testing?testing-method=card-numbers#visa )

4242 4242 4242 4242

## Prerequisites

Doppler https://docs.doppler.com/docs/cli

Node 18.16.1

NVM

Docker

## Tech Stack

Programming Languages:
  - TypeScript

Frontend Frameworks:
  - React

Backend Frameworks:
  - Next.js
  
Database:
  - MySQL

External APIs:
  - OpenAI

Secret Managment:
  - Doppler

Content Managment System:
  - Directus

Design Systems:
  - Radix

**Setup Ubuntu VPS with Docker Compose**

**Step 1: Install Docker and Docker Compose and NGIX**

1. Connect to your Ubuntu VPS via SSH.
2. Install Docker: `sudo apt-get update && sudo apt-get install docker.io -y`
3. Install Docker Compose: `sudo apt-get install docker-compose -y`

**Step 2: Configure Doppler**

1. Install Doppler: `sudo apt-get install doppler -y`
2. Add the `www` user: `sudo useradd -m -s /bin/false www`
3. Configure Doppler to use the `www` user: `sudo doppler configure --user www`

**Step 3: Configure Nginx**

1. Copy the `nginx.conf` file from the project repository to the `/etc/nginx/sites-available/` directory: `sudo cp nginx/nginx.conf /etc/nginx/sites-available/default`
2. Create a symbolic link to enable the Nginx configuration: `sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/`

**Step 5: Start Docker Compose**

1. Navigate to the project repository directory: `cd <repository-directory>`
2. Start Docker Compose: `sudo docker-compose up -d`

**Step 6: Pull app image**

1. Pull the app image `./start.sh`

**Step 7: Open ports**

1. ufw allow 443, ufw allow 80, ufw allow 3306

**Step 7: Verify the setup**

1. Verify that Docker Compose is running: `sudo docker-compose ps`
2. Verify that Nginx is running: `sudo service nginx status`

