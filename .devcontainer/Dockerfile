
FROM mcr.microsoft.com/devcontainers/typescript-node:1-20-bullseye

################################
# Install Terraform (https://developer.hashicorp.com/terraform/tutorials/docker-get-started/install-cli)
################################

# Install the HashiCorp GPG key.
RUN \
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Verify the key's fingerprint.
RUN \
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

# Add the official HashiCorp repository to your system
RUN \
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
tee /etc/apt/sources.list.d/hashicorp.list

# Download the package information from HashiCorp.
RUN apt update

# Install Terraform from the new repository.
RUN apt-get install terraform

################################
# Install Azure CLI
################################

# Get packages needed for the installation process
# RUN apt-get update
# RUN apt-get install apt-transport-https ca-certificates curl gnupg lsb-release 

# Download and install the Microsoft signing key:
RUN mkdir -p /etc/apt/keyrings
RUN curl -sLS https://packages.microsoft.com/keys/microsoft.asc | \
  gpg --dearmor -o /etc/apt/keyrings/microsoft.gpg && \
  chmod go+r /etc/apt/keyrings/microsoft.gpg

# Add the Azure CLI software repository
RUN AZ_DIST=$(lsb_release -cs) && \
  echo "Types: deb" > /etc/apt/sources.list.d/azure-cli.sources && \
  echo "URIs: https://packages.microsoft.com/repos/azure-cli/" >> /etc/apt/sources.list.d/azure-cli.sources && \
  echo "Suites: ${AZ_DIST}" >> /etc/apt/sources.list.d/azure-cli.sources && \
  echo "Components: main" >> /etc/apt/sources.list.d/azure-cli.sources && \
  echo "Architectures: $(dpkg --print-architecture)" >> /etc/apt/sources.list.d/azure-cli.sources && \
  echo "Signed-By: /etc/apt/keyrings/microsoft.gpg" >> /etc/apt/sources.list.d/azure-cli.sources

# Install the Azure CLI
RUN apt-get update && apt-get install azure-cli