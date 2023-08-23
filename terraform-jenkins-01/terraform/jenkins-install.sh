sudo yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo dnf install java-11-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins



# Wait for Jenkins service to be ready
echo "Waiting for Jenkins to start..."
until sudo test -f /var/lib/jenkins/secrets/initialAdminPassword; do
  sleep 5
done

# Retrieve the initial password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword 




