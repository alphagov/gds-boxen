class teams::efg {
  include projects::development

  # Devops™
  include projects::alphagov-deployment
  include projects::puppet

  include projects::efg
  include projects::efg-private

  # we write tests, m'kay?
  include projects::smokey
}
