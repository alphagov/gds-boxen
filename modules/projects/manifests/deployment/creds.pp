# Deps for credential store within deployment repo.
class projects::deployment::creds inherits projects::deployment {
  include gnupg
  include encfs
  ensure_packages(['pwgen'])
}
