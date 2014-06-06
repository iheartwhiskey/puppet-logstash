define logstash::output::elasticsearch(
    $embedded,
    $embedded_http_port,
    $host,
    $config_order,
) {

    include logstash::config

    logstash::configfile {"output_${name}":
        content  => template('logstash/outputs/elasticsearch.erb'),
        order    => $config_order
    }

    if defined( Class['firewall'] ) {
      
	  ##### these ports are the default ones for listening to logstash
	  ##### and kibana. will be changed later if moving to non-embedded
      firewall {"9200 ElasticSearch": 
          proto  => 'tcp',
          state  => 'NEW',
          dport  => 9200,
          action => 'accept',
      }
      firewall {"9300 ElasticSearch": 
          proto  => 'tcp',
          state  => 'NEW',
          dport  => 9300,
          action => 'accept',
      }
      firewall {"9301 Logstash": 
          proto  => 'tcp',
          state  => 'NEW',
          dport  => 9301,
          action => 'accept',
      }
      firewall {"9302 Logstash": 
          proto  => 'tcp',
          state  => 'NEW',
          dport  => 9301,
          action => 'accept',
      }
    }

}
