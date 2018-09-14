# == Class: dotnet_core
#
# Installs the go language allowing you to
# execute and compile go.
#
# === Examples
#
#  class { "dotnet_core":}
#
# === Authors
#
# Pawel Niemczyk <pniemczyk.info@gmail.com>
#
class dotnet_core (
  $version      = '2.1',
  $workspace    = '/vagrant',
  $download_dir = '/usr/local/src',
  $download_url = undef,
  $download_timeout = 900,
) {

  if ($download_url) {
    $download_location = $download_url
  } else {
    $download_location = "https://dot.net/v1/dotnet-install.sh"
  }

  Exec {
    path => 'usr/local/dotnet:/usr/local/src:/usr/local/src/dotnet:/usr/local/src/dotnet/bin:/usr/bin:/usr/local/bin:/bin',
  }

  $package_prereqs = [
    'curl',
    'wget',
    'liblttng-ust0',
    'libcurl3',
    'libssl1.0.0',
    'libkrb5-3',
    'zlib1g',
    'libicu55'
  ]

  ensure_packages($package_prereqs)

  exec { 'download':
    command => "curl -o ${download_dir}/dotnet-install.sh ${download_location}",
    creates => "${download_dir}/dotnet-install.sh",
    unless  => "which dotnet && dotnet --version | grep '${version}'",
    require => Package['curl'],
    timeout => $download_timeout,
  } ->
  exec { 'install':
    command => "chmod +x ${download_dir}/dotnet-install.sh && ${download_dir}/dotnet-install.sh -i /usr/local/src/dotnet/bin -c ${version}",
    onlyif  => "test -f ${download_dir}/dotnet-install.sh",
  }

  file { '/etc/profile.d/dotnet_core.sh':
    content => template('dotnet_core/dotnet_core.sh.erb'),
    owner   => root,
    group   => root,
    mode    => 'a+x',
  }

}
