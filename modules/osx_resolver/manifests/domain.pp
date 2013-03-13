define osx_resolver::domain(
  $content
) {
  include ::osx_resolver

  file { "/etc/resolver/${title}":
    ensure      => present,
    content     => $content,
    require     => Class['osx_resolver'],
  }
}
