AppDynamics DB Agent in a Docker container (v4.5.7)

Steps to deploy:

- Clone this repo
- Download the AppDynamics Database Visibility Agent from download.appdynamics.com
- Rename as db-agent.zip and place in cloned dir
- Edit your variables in docker-compose.yml
- docker-compose up

Todo:
Fix escaped characters for heap dump startup parameters.
