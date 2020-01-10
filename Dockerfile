FROM jenkins/jenkins:lts
# if we want to install via apt

USER root
# Option 1: Install docker for agents
# RUN apt update && apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
# RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add
# RUN echo "deb http://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list
# RUN apt update && apt install -y docker-ce
# RUN groupadd -g 971 archdocker
# RUN usermod -aG docker,archdocker jenkins

# Option 2: Install terraform
RUN apt update && apt install -y ca-certificates curl unzip
RUN curl -O https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip && unzip terraform_0.12.18_linux_amd64.zip && mv terraform /usr/bin/

# drop back to the regular jenkins user - good practice
USER jenkins
