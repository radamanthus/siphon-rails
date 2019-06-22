# README

rails-siphon is a [Heroku Log Drain](https://devcenter.heroku.com/articles/log-drains) application that forwards the logs to a [AWS Kinesis Data Stream](https://aws.amazon.com/kinesis/data-streams).

## Deployment

rails-siphon uses the following environment variables:

| Variable name | Description |
--- | ---
| `AWS_ACCESS_ID` | access ID for your AWS IAM user|
| `AWS_SECRET_ACCESS_KEY` | secret access key for your AWS IAM user |
| `AWS_KINESIS_REGION` | AWS region where for the Kinesis stream |
| `AWS_KINESIS_STREAM_NAME` | the AWS Kinesis stream name|
| `LOGDRAIN_PASSWORD` | The Heroku log drain password |
| `LOGDRAIN_USERNAME` | The Heroku log drain username |
| `LOGPLEX_DRAIN_TOKEN` | The Heroku log drain token |

TODO:

* Deploying to Heroku
* AWS Setup
* Setting up Heroku Log Drain