define logstash::input::collectd(
    $port,
    $host,
    $config_order,
) {

    include logstash::config

    logstash::configfile {"input_${name}":
        content  => template('logstash/inputs/collectd.erb'),
        order    => $config_order
    }

    if defined( Class['firewall'] ) {
      firewall { "${port} collectd": 
        proto  => 'udp',
        dport  => $port,
        action => 'accept'
      }
    }


