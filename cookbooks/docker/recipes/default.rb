require_recipe "apt"

bash "install docker" do
  code %{
    apt-get update
    apt-get install -y docker.io
    curl -sL https://deb.nodesource.com/setup | sudo bash -
    apt-get install -y nodejs
    apt-get install -y build-essential
    usermod -a -G docker vagrant
  }
  not_if "dpkg -l | grep docker.io"
end
