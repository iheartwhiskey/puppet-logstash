# note the input for logstashforwarder is still called lumberjack in logstash
define logstash::input::file(
    $type,
    $path,
    $sincedb_path,
    $config_order,
    $start_position
) {

    include logstash::config

    logstash::configfile {"input_${name}":
        content  => template('logstash/inputs/file.erb'),
        order    => $config_order
    }
}
