define logstash::output::stdout(
    $config_order
) {

    include logstash::config

    logstash::configfile {"output_${name}":
        content  => template('logstash/outputs/stdout.erb'),
        order    => $config_order
    }
}
