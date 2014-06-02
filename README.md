# chef-logstash cookbook

Basic Logstash cookbook for Chef that installs Logstash from the official [package repositories](http://logstash.net/docs/1.4.1/repositories).

# Requirements

Tested on Ubuntu/Debian but should work on other platforms as well.

# Usage

Just include the default recipe `logstash::default`.

## Server

Put the following in your logstash server attributes:

```json
{
    "logstash": {
        "version": "1.4",

        "server": {
            "enabled": true,
            "inputs": [
                {
                    "rabbitmq": {
                        "exchange": "rawlogs",
                        "user": "username",
                        "password": "verysecret",
                        "host": "rabbitmq.example.com",
                        "type": "all"
                    }
                }
            ],
            "outputs": [
                {
                    "elasticsearch": {
                        "host": "elasticsearch.example.com",
                        "cluster": "logstash"
                    }
                }
            ]
        },

        "agent": {
            "inputs": [
                {
                    "file": {
                        "path": ["/var/log/*.log"],
                        "exclude": ["*.gz"],
                        "type": "syslog"
                    }
                }
            ],

            "outputs": [
                {
                    "rabbitmq": {
                        "host": "rabbitmq.example.com",
                        "port": "5672",
                        "user": "username",
                        "password": "verysecret",
                        "exchange": "logstash",
                        "exchange_type": "fanout"
                    }
                }
            ]
        }
    }
}

```

## Agent

And put this in your agents' attributes:


```json
{
    "logstash": {
        "version": "1.4",

        "agent": {
            "inputs": [
                {
                    file {
                        "path": ["/var/log/*.log"],
                        "exclude": ["*.gz"],
                        "type": "syslog"
                    }
                }
            ],

            "outputs": [
                {
                    "rabbitmq": {
                        "host": "rabbitmq.example.com",
                        "port": "5672",
                        "user": "username",
                        "password": "verysecret",
                        "exchange": "logstash",
                        "exchange_type": "fanout"
                    }
                }
            ]
        }
    }
}
```

# Attributes

## Default

```ruby
node[:logstash][:version] = "1.4"            # The version to install.
```

## Agent

```ruby
node[:logstash][:agent][:enabled] = true    # Enable agent.
node[:logstash][:agent][:inputs]  = []      # Inputs configuration, see http://logstash.net/docs/1.4.1/
node[:logstash][:agent][:outputs] = []      # Outputs configuration, see http://logstash.net/docs/1.4.1/
```

## Server

```ruby
node[:logstash][:server][:enabled] = false   # Enable server (default: false, agent only).
node[:logstash][:server][:inputs]  = []      # Inputs configuration, see http://logstash.net/docs/1.4.1/
node[:logstash][:server][:outputs] = []      # Outputs configuration, see http://logstash.net/docs/1.4.1/
```

# Recipes

## Default

Meta recipe to install the packages and configure the server and/or agent.

## Apt

Installs Logstash from the Debian packages.

## Yumrepo

Installs Logstash from the Yum repo packages.

## Agent

Configures the agent.

## Server

Configures the server.

# Thanks to

- https://github.com/lusis/chef-logstash where I borrowed the idea and even some code from.


# Author

Author:: Wouter de Vos - [Springest](http://www.springest.com) (oss@rein.io)
