

node /csensu/ {

  include my-repos



  # Setup Sensu
  include sensu::repo

  sensu::client {"$::fqdn":
    rabbitmq_password => 'sensu',
    rabbitmq_port     => '5672',
    subscriptions     => 'test',
    rabbitmq_host     => '10.1.2.42',
  }


  sensu::check {'cron':
    command     => '/etc/sensu/plugins/processes/check-procs.rb -p crond -C 1',
    handlers    => 'default',
    subscribers => 'test',
  }

  package { 'sensu-community-plugins':
    ensure => 'present',
  }
  package { 'rubygem-sensu-plugin':
    ensure => 'present',
  }



}





