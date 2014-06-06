define logstash::output::file(
    $path,
    $config_order
) {

    include logstash::config

    logstash::configfile {"output_${name}":
        content  => template('logstash/outputs/file.erb'),
        order    => $config_order
    }
}
