FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y ca-certificates jq

RUN echo "deb [trusted=yes] https://packages.cloudfoundry.org/debian stable main" > /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update

# Install CF CLI v6 because MTA plugin is not compatible with v7 so far
RUN apt-get install -y cf-cli

#RUN ["cf", "add-plugin-repo" , "CF-Community", "https://plugins.cloudfoundry.org"]
#RUN ["cf", "install-plugin", "-f" ,"-r", "CF-Community", "multiapps"]

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"] 