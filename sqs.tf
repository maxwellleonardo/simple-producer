resource "aws_sqs_queue" "simple_queue_deadletter" {
  name                      = "simple_queue_deadletter"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

resource "aws_sqs_queue" "simple_queue" {
  name                      = "simple-queue1"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.simple_queue_deadletter.arn
    maxReceiveCount     = 4
  })
}

output "simple_queue_url" {
  value = aws_sqs_queue.simple_queue.arn
}
