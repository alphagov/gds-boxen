# Installs all the alphagov repos from github.com
#
# The default list can be easily overridden in hiera/users/username.yaml
# with something like:
#       alphagov::repos:
#           - spotlight
#           - backdrop
#
class alphagov (
  $repos   = [],
) {

  validate_array($repos)

  if !(empty($repos)) {
    repo::alphagov { $repos: }
  }
}
