# Sample Dockerfile for the AppDynamics Database Visibility Agent
# This is provided for illustration purposes only, for full details 
# please consult the product documentation: https://docs.appdynamics.com/

FROM ubuntu:16.04

# Install required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y unzip default-jre && \
    apt-get clean

# Install AppDynamics Database Agent
ENV DB_AGENT_HOME /opt/appdynamics/db-agent/
ADD db-agent.zip /tmp/ 
RUN mkdir -p ${DB_AGENT_HOME} && \
    unzip -oq /tmp/db-agent.zip -d ${DB_AGENT_HOME} && \
    rm /tmp/db-agent.zip

# Include start script to configure and start agent at runtime
ADD start-docker-dbagent ${DB_AGENT_HOME}
RUN chmod 744 ${DB_AGENT_HOME}/start-docker-dbagent

# Configure and Run AppDynamics Database Agent
CMD "${DB_AGENT_HOME}/start-docker-dbagent"
