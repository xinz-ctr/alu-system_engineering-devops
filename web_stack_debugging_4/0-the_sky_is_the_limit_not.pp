# Increase nginx open file limit and restart nginx

exec { 'fix-nginx':
  command => "sed -i '/worker_processes/a worker_rlimit_nofile 4096;' /etc/nginx/nginx.conf && service nginx restart",
  path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  unless  => "grep -q '^worker_rlimit_nofile 4096;' /etc/nginx/nginx.conf",
}
