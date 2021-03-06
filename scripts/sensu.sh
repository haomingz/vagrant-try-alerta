#!/bin/sh

# set -x

wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
echo "deb     http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list
apt-get -y update
apt-get -y install redis-server rabbitmq-server sensu uchiwa ruby-dev

gem install sensu-plugin httparty

wget -qO /etc/sensu/config.json https://raw.github.com/alerta/sensu-alerta/master/config/config.json
wget -qO /etc/sensu/conf.d/alerta.json https://raw.github.com/alerta/sensu-alerta/master/alerta.json
wget -qO /etc/sensu/handlers/alerta.rb https://raw.github.com/alerta/sensu-alerta/master/alerta.rb
chmod +x /etc/sensu/handlers/alerta.rb

wget -qO /etc/sensu/conf.d/check-procs.json https://raw.github.com/alerta/vagrant-try-alerta/master/files/sensu.check-procs.json
wget -qO /etc/sensu/plugins/check-procs.rb https://raw.github.com/sensu/sensu-community-plugins/master/plugins/processes/check-procs.rb
chmod 755 /etc/sensu/plugins/check-procs.rb

rabbitmqctl add_vhost /sensu
rabbitmqctl add_user sensu sensu
rabbitmqctl set_permissions -p /sensu sensu ".*" ".*" ".*"

echo "LOG_LEVEL=debug" >>/etc/default/sensu

update-rc.d sensu-server defaults
update-rc.d sensu-client defaults
update-rc.d sensu-api defaults
update-rc.d uchiwa defaults

/etc/init.d/sensu-server start
/etc/init.d/sensu-client start
/etc/init.d/sensu-api start
/etc/init.d/uchiwa start

