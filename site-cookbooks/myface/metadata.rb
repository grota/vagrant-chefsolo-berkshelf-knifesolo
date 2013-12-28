name             'myface'
maintainer       'Giuseppe Rota'
maintainer_email 'rota.giuseppe@gmail.com'
license          'All rights reserved'
description      'Installs/Configures site-cookbooks/myface'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends 'artifact', '~> 0.10.7'
depends "tomcat", "~> 0.11.0"
