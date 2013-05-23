# HMRC Exemplar definition
# Devops™ - not splitting this out into hmrc-dev and hmrc-ops classes
class teams::hmrc {

  repo::gds { 'hmrc': }  
  repo::gds { 'hmrc-deployment': }
  repo::gds { 'hmrc-mytax-services': }
  repo::gds { 'hmrc-mytax-application': }
  repo::gds { 'hmrc-puppet': }
}
