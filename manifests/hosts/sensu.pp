

node /sensu/ {

  include my-repos

  # Setup RabbitMQ
  class {'rabbitmq::params':
    plugins => 'yes',
  }

  include rabbitmq
  #include rabbitmq::stomp

  rabbitmq::enableplugins{'rabbitmq_management':
    plugin => 'rabbitmq_management',
  }
  include rabbitmq::ssl

  rabbitmq::vhost {'/sensu':}
  rabbitmq::user {'sensu':
    password => 'sensu';
  }

  # Not sure if setting passwords works ..


  rabbitmq::permission {'sensu':
    vhostpath => '/sensu',
    conf      => '.*',
    write     => '.*',
    read      => '.*',
  }

  # Get SSL Stuff included
  include rabbitmq::sslgenerate

  # Setup Redis
  require redis::params
  $redis_interface = 'eth1'
  include redis::package
  include redis::config
  include redis::service


  # Setup Sensu
  include sensu::repo
  sensu::server {'localhost':
    rabbitmq_password => 'sensu',
  }



  # sensu::handler

  # sensu::server
}




