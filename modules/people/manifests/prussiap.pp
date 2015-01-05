#my project file
class people::prussiap {
  #include foo
  notify { 'hello world': }
  include sparrow # requires sparrow module in Puppetfile
  include spotify
  include vlc
  include virtualbox
  include adium
  include memcached

  $my_homedir = "/Users/${::luser}"

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"


  repository { $dotfiles:
    source  => 'prussiap/dotfiles',
    require => File[$my]
  }

  file { "${my_homedir}/.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/tmux.conf",
    require => Repository["${my_homedir}/dotfiles"],
  }

  file { "/Users/${my_username}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/zshrc",
    require => Repository["${my_homedir}/dotfiles"],
  }

  file { "/Users/${my_username}/.gitconfig":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/gitconfig",
    require => Repository["${my_homedir}/dotfiles"],
  }

  file { "/Users/${my_username}/.profile":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/profile",
    require => Repository["${my_homedir}/dotfiles"],
  }
  
  file { "/Users/${my_username}/.bashrc:
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/bashrc",
    require => Repository["${my_homedir}/dotfiles"],
  }
  
  file { "/Users/${my_username}/.bash_profile":
    ensure  => link,
    mode    => '0644',
    target  => "${my_homedir}/dotfiles/bash_profile",
    require => Repository["${my_homedir}/dotfiles"],
  }
  
  file { "/Users/${my_username}/.vimrc":
    ensure => link,
    mode   => '0644',
    target => "${my_homedir}/dotfiles/vimrc",
    require => Repository["${my_homedir}/dotfiles"],
  }

}