SnsSender.configure do |config|
    config.aws_region = 'us-east-1'                    # Required
    config.aws_access_key_id = ENV['SQS_AWS_ACCESS_KEY_ID']
    config.aws_secret_access_key = ENV['SQS_AWS_SECRET_ACCESS_KEY']   # Required
    config.default_topic_arn = 'arn:aws:sns:us-east-1:348674388966:message-fanout' # Optional
  end