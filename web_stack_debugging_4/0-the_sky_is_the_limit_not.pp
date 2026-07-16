# Increase nginx open file limit

exec { 'fix-nginx-ulimit':
  command => "sed -i 's/^ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/' /etc/default/nginx && service nginx restart",
  unless  => "grep '^ULIMIT=\"-n 4096\"' /etc/default/nginx",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
}
