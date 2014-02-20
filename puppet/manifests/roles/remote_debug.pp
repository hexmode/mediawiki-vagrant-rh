# == Class: role::remote_debug
# This class enables support for remote debugging of PHP code using
# Xdebug. Remote debugging allows you to interactively walk through your
# code as executes. Remote debugging is most useful when used in
# conjunction with a PHP IDE such as PhpStorm or Emacs (with Geben).
# The IDE is installed on your machine, not the Vagrant VM.
#
# -- To use, enable this role from shell:
#    vagrant enable-role remote_debug
# -- In your IDE, enable "Start Listening for PHP Debug Connections"
# -- For Firefox, install
#    https://addons.mozilla.org/en-US/firefox/addon/the-easiest-xdebug
#    and click "Enable Debug" icon in the Add-on bar
# -- Set breakpoints
# -- Navigate to 127.0.0.1:8080/...
#
# See https://www.mediawiki.org/wiki/MediaWiki-Vagrant/Advanced_usage#MediaWiki_debugging_using_Xdebug_and_an_IDE_in_your_host
# for more information.
class role::remote_debug {
    include php

    php::ini { 'remote_debug':
        settings => {
            'xdebug.remote_connect_back' => 1,
            'xdebug.remote_enable'       => 1,
        },
        require  => Package['php5-xdebug'],
    }
}