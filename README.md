# Hello World SQS Sender

This application demonstrates how to send messages to an AWS SNS topic using the `sns_sender` gem.

## Prerequisites

Before running the application, you need to configure the following environment variables:

```bash
export SQS_AWS_ACCESS_KEY_ID=your_access_key_id
export SQS_AWS_SECRET_ACCESS_KEY=your_secret_access_key
export SNS_TOPIC_ARN=your_sns_topic_arn
```

Example SNS topic ARN:
```bash
export SNS_TOPIC_ARN=arn:aws:sns:us-east-1:348674388966:message-fanout
```

These credentials should have permissions to publish messages to the SNS topic.

## Running Rails Console

To start the Rails console:

```bash
bin/rails console
```

## Sending Messages to SNS

Once in the Rails console, you can send messages to SNS in two ways:

### 1. Using the User Model

If you have a User record, you can use the `sync_data` method to send a message:

```ruby
# Find or create a user
user = User.first

# Send the message
user.sync_data
```

This will send a message in the following format:
```ruby
{
  "type" => "user_sync",
  "data" => {
    "guid" => "...",
    "name" => "...",
    "email" => "...",
    "age" => "..."
  }
}
```

### 2. Directly Using SnsSender

You can also send messages directly using the SnsSender:

```ruby
SnsSender.publish(message: {
  type: "custom_type",
  data: {
    # your custom data here
  }
})
```

## Configuration

The SNS sender is configured in `config/initializers/sns_sender.rb` with the following settings:

- AWS Region: us-east-1
- AWS Access Key ID: From SQS_AWS_ACCESS_KEY_ID environment variable
- AWS Secret Access Key: From SQS_AWS_SECRET_ACCESS_KEY environment variable
- SNS Topic ARN: From SNS_TOPIC_ARN environment variable

Make sure your AWS credentials have the necessary permissions to publish to the specified SNS topic.
