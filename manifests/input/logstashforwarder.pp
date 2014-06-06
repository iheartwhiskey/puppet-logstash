# note the input for logstashforwarder is still called lumberjack in logstash
define logstash::input::logstashforwarder (
    $port,
    $certificate,
    $key,
    $config_order,
) {

    include logstash::config

    logstash::configfile {"input_${name}":
        content  => template('logstash/inputs/lumberjack.erb'),
        order    => $config_order
    }

    if defined( Class['firewall'] ) {
      firewall { "${port} logstash-forwarder":
         proto  => 'tcp',
         state  => 'NEW',
         dport  => $port,
         action => 'accept',
      }
    }
}
