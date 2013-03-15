class teams::performance-platform {
  include projects::development

  # Devops™
  include projects::alphagov-deployment
  include projects::puppet

  # Frontend
  #include projects::datainsight-frontend
  #include projects::limelight

  # Backend
  #include projects::backstory
}
