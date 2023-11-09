# JobFlow Platform Requirements


## Introduction

The goal of this platform is to provide AI-powered career guidance and matching for users seeking direction and clarity in their professional journeys. The platform is intended for a few key audiences:

- Recent graduates looking to identify rewarding career paths aligned with their strengths and interests. The platform will help guide their initial career choice based on personalized assessments.

- Mid-career professionals evaluating potential career changes or advancement. The platform will provide actionable recommendations to help them pivot into more fulfilling roles. 

- Job seekers wanting to improve their search and application success. The platform can connect them with viable opportunities suited to their backgrounds.

- Career coaches and human resources professionals needing an additional tool to evaluate and advise clients. The AI-powered platform can provide data-driven career insights.

At its core, this career counseling platform aims to analyze users' unique combination of skills, personality traits, values, and interests to suggest actionable career options and pathways most likely to lead to engagement and success. By pairing AI algorithms with interactive career exploration tools, the platform provides a customized experience to match users' strengths to optimal careers. This empowers users with self-knowledge and clarity to confidently pursue professional goals aligned with their attributes.


## User Personas

### Persona 1: 

Alex, 24 years old
Recent college graduate with general business degree
Unsure which career path to pursue 
Frustrated by job search, lacks direction
Goals:
- Identify ideal career options matched to his strengths 
- Gain clarity on next steps to start chosen career path
- Find actionable job opportunities to apply for
- Increase confidence in career decision making

### Persona 2:

Sarah, 32 years old

Marketing professional feeling stuck in her career
Interested in exploring new potential career pivots
Overwhelmed by options, unsure which direction is best

Goals: 
- Gain insights into careers well-suited for her abilities
- Evaluate new career paths aligned to her interests
- Feel confident in making a big career change
- Get structured guidance on how to pivot careers


## Feature Requirements

### AI-Powered Career Assessment

- Quizzes to identify users' strengths, personality, values, interests
    - Personal attributes quiz with questions to determine personality traits based on standard models like Myers-Briggs, Holland Codes, etc.
    - Skills and interests inventory allowing users to rate their proficiency and enthusiasm for various activities
    - Work values checklist to rank the importance of factors like work-life balance, creativity, helping others, etc.

- ML algorithms to analyze assessment results and map to potential careers
    - Feed user's assessment data into proprietary machine learning model to identify career categories with the highest affinity score
    - Output top recommended career categories along with confidence scores 

- Provide list of suggested career options with descriptions
    - Display a personalized list of potential career paths for the user based on assessment results
    - Include short description for each recommended career with typical responsibilities and skills needed

- Ability to save assessment results and recommendations
    - Allow user to create account and log in to save their assessment results
    - Store results linked to user profile for future access and updates

### Personalized Career Recommendations

- Take users' assessment data, backgrounds, preferences into account
  - Leverage career assessment data along with user inputs on background, education, location pref
  - Feed these attributes into model to tune results 

- Return sorted list of ideal career options with match score
  - Display recommended careers ranked by match score customized to the user
  - Present top 3-5 suggestions by default, allow expanding list

- Provide actionable steps user can take for each (skills, courses, certs to obtain)
  - For each recommended career path, show specific guidance on skills to develop, relevant certifications, educational programs to consider
  - Provide tailored roadmap to pursue career suggestion based on user's background

## Non-Functional Requirements

- Desktop website 
  - Optimize experience for 1920x1080 resolution
  - Ensure core features work on 1366x768 resolution

- Secure user accounts and data privacy
  - User passwords encrypted and salted for storage
  - Sensitive user data transmitted over HTTPS
  - Access controls to protect personal data
  - Validation to prevent XSS, SQL injection attacks
  
- Fast performance for career matching algorithms
  - Return career recommendations within 15 seconds for registered users
  - Optimize algorithms to return results in real-time
 
- Ability to scale to thousands of users
  - Infrastructure allows for large user base growth
  - Load balancing and autoscaling capabilities
 
- 99% uptime service level
  - Ensure maximum reliable uptime for career platform
  - Deploy redundancy and failover solutions
  
- Analytics and admin portal
  - Track key metrics like user engagement, conversion rates
  - Provide insights through analytics dashboard
  - Admin interface to manage users, content, system config
  
- Accessibility standards compliance
  - Accommodate users with disabilities
  - Follow WCAG 2.1 guidelines and standards

- Compliance with European privacy laws
    - Follow regulations including GDPR for data privacy
    - Allow EU users to access, delete, or export their personal data
    - Confirm valid legal basis for data processing activities
    - Document procedures for handling data subject requests
    - Conduct DPIAs to identify and mitigate privacy risks
    - Implement privacy by design and default principles
    - Clearly communicate privacy practices and consent needs

    - The platform will be designed to comply with European data protection and privacy laws regarding the collection, processing, security, and rights around user data. Relevant regulations like GDPR will be followed to ensure lawful handling of EU user personal information.


## Constraints

- Budget limitations
  - Work within $1,000 development budget
  - Prioritize core features over nice-to-haves
  - Leverage cost-effective technologies and infrastructure

- Supported browsers and devices
  - Target latest versions of Chrome, Firefox, Safari
  - Gracefully degrade experience for older browsers

- Third party integrations needed for career data
  - Rely on public datasets for career info

- Short timeline 
  - Deliver first working version within 2 months
  - Focus on rapid iteration and continuous deployment

- Limited engineering team
  - Architect system for efficient development with small team
  - Automate tasks where possible
  - Modular design and code reuse


## Milestones / Release Plan

  - Week 1:
    - Kickoff meeting to finalize requirements
    - Create user stories and high-level technical design
    - Detailed system architecture design
    - Finalize tech stack and frameworks
    - Set up development environment and repositories
    - Start building out core infrastructure and configs
  - Week 2:
    - Build out user authentication and account management features
    - Create admin portal for managing courses, quizzes and content
  - Week 3:
    - Implementing analytics tools
    - Implement user authentication and account management
    - Develop backend APIs for core platform features
    - Build admin portal for content and course management
  - Weeks 4-5:
    - Develop frontend views for all main pages like home, profile, career lab, etc.
    - Develop interactive quizzes, assessments, tasks and simulations
    - Build user profile management and tracking features
    - Create content management system for career resources
    - Implement frontend views, components and business logic
    - Ensure full mobile optimization across platforms
  - Weeks 6-8:
    - Generating reports and insights
    - Perform system testing, load testing, and security audits
    - Fix bugs and optimize performance
    - Prepare documentation for launch
    - Conduct user demos and collect feedback
    - Deploy to production environment

## Technologies

- Programming Languages:
  - TypeScript
  - JavaScript

- Frontend Frameworks:
  - React

- Backend Frameworks:
  - Next.js
  - Node.js
      
- Database:
  - DynamoDB

- Hosting:
  - Amazon Web Services

- External APIs:
  - OpenAI

- Performance Monitoring:
  - AWS CloudWatch

- Design Systems:
  -  Radix

This stack utilizes TypeScript and React for efficient frontend development, with DynamoDB for flexible NoSQL storage. AWS provides a robust hosting platform to scale the product. 


## Open Questions 

Capture any outstanding questions, assumptions, risks.



