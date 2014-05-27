# Deps for credential store within deployment repo.
class projects::deployment::creds inherits projects::deployment {
  ensure_packages([
    'encfs',
    'gnupg',
    'pwgen',
    ])
}
