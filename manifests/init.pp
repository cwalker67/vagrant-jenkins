class refresh {
   exec { "apt update":
       command => "/usr/bin/apt-get -y update"
   }
}

stage { pre: before => Stage[main] }
 
# Forces the repository to be configured before any other task
class { 'refresh': stage => pre }

include apt
include stdlib

include git
include java
include jenkins
