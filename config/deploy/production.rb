# Change example.com to your server hostname and 'deploy' to the user name of your server
# that you can use to login to the server from your workstation

server 'v11.opendrops.com', user: 'deployer', roles: %w{web app db}

# Change myapp.com to the domain name intended for accessing your app by public
set :domain_name, 'sales.5starstoves.com'
