# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html

class { 'dotnet_core':
  version   => '2.1.202',
  workspace => '/usr/local/src/go',
}
