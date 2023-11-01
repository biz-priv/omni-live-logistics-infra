# Create an API Gateway Rest API
resource "aws_api_gateway_rest_api" "sightline-api" {
  name        = "sightline-api"
  description = "API for flask app"
}

# Create a resource
resource "aws_api_gateway_resource" "sightline" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_rest_api.sightline-api.root_resource_id
  path_part   = "sightline"
}

# Create an integration with the VPC link
resource "aws_api_gateway_integration" "sightline-integration" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  resource_id = aws_api_gateway_resource.sightline.id
  http_method = "GET"
  type        = "HTTP_PROXY"
  integration_http_method = "ANY"
  uri        = "http://${aws_lb.flask_lb.dns_name}"
}

# Create a method for the resource
resource "aws_api_gateway_method" "home" {
  rest_api_id   = aws_api_gateway_rest_api.sightline-api.id
  resource_id   = aws_api_gateway_resource.sightline.id
  http_method   = "GET"
  authorization = "NONE"
}

# Deploy the API to a stage
resource "aws_api_gateway_deployment" "sightline" {
  depends_on = [aws_api_gateway_integration.sightline-integration]

  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  stage_name = "dev"
}

#formstack_webhook
resource "aws_api_gateway_resource" "formstack_webhook" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_rest_api.sightline-api.root_resource_id
  path_part   = "formstack_webhook"
}
resource "aws_api_gateway_method" "post_formstack" {
  rest_api_id   = aws_api_gateway_rest_api.sightline-api.id
  resource_id   = aws_api_gateway_resource.formstack_webhook.id
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "formstack_webhook-integration" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  resource_id = aws_api_gateway_resource.formstack_webhook.id
  http_method = "POST"
  type        = "HTTP_PROXY"
  integration_http_method = "ANY"
  uri        = "http://${aws_lb.flask_lb.dns_name}/formstack_webhook"
}

# Formstack Webhook Flatbed route
resource "aws_api_gateway_resource" "formstack_webhook_flatbed" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_resource.formstack_webhook.id
  path_part   = "flatbed"
}

# Create a method for the "POST" HTTP method for Formstack Webhook Flatbed
resource "aws_api_gateway_method" "post_formstack_flatbed" {
  rest_api_id   = aws_api_gateway_rest_api.sightline-api.id
  resource_id   = aws_api_gateway_resource.formstack_webhook_flatbed.id
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "formstack_webhook_flatbed" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  resource_id = aws_api_gateway_resource.formstack_webhook_flatbed.id
  http_method = "POST"
  type        = "HTTP_PROXY"
  integration_http_method = "ANY"
  uri        = "http://${aws_lb.flask_lb.dns_name}/formstack_webhook/flatbed"
}

# Formstack Webhook Flatbed-test route
resource "aws_api_gateway_resource" "formstack_webhook_flatbed_test" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_resource.formstack_webhook.id
  path_part   = "flatbed-test"
}

# Create a method for the "POST" HTTP method for Formstack Webhook Flatbed
resource "aws_api_gateway_method" "post_formstack_flatbed_test" {
  rest_api_id   = aws_api_gateway_rest_api.sightline-api.id
  resource_id   = aws_api_gateway_resource.formstack_webhook_flatbed_test.id
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "webhook_flatbed_test" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  resource_id = aws_api_gateway_resource.formstack_webhook_flatbed_test.id
  http_method = "POST"
  type        = "HTTP_PROXY"
  integration_http_method = "ANY"
  uri        = "http://${aws_lb.flask_lb.dns_name}/formstack_webhook/flatbed-test"
}

# Text Locate Pings route
resource "aws_api_gateway_resource" "text_locate_pings" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_rest_api.sightline-api.root_resource_id
  path_part   = "text_locate_pings"
}

# Create a method for the "POST" HTTP method for Text Locate Pings
resource "aws_api_gateway_method" "post_text_locate_pings" {
  rest_api_id   = aws_api_gateway_rest_api.sightline-api.id
  resource_id   = aws_api_gateway_resource.text_locate_pings.id
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "text_locate_pings_integration" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  resource_id = aws_api_gateway_resource.text_locate_pings.id
  http_method = "POST"
  type        = "HTTP_PROXY"
  integration_http_method = "ANY"
  uri        = "http://${aws_lb.flask_lb.dns_name}/text_locate_pings"
}

# Text Locate Webhook route
resource "aws_api_gateway_resource" "text_locate_webhook" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_rest_api.sightline-api.root_resource_id
  path_part   = "text_locate_webhook"
}

# Create a method for the "POST" HTTP method for Text Locate Webhook
resource "aws_api_gateway_method" "post_text_locate_webhook" {
  rest_api_id   = aws_api_gateway_rest_api.sightline-api.id
  resource_id   = aws_api_gateway_resource.text_locate_webhook.id
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "text_locate_webhook_integration" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  resource_id = aws_api_gateway_resource.text_locate_webhook.id
  http_method = "POST"
  type        = "HTTP_PROXY"
  integration_http_method = "ANY"
  uri        = "http://${aws_lb.flask_lb.dns_name}/text_locate_webhook"
}

# Create the main resource "api"
resource "aws_api_gateway_resource" "main_api" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_rest_api.sightline-api.root_resource_id
  path_part   = "api"
}

# Create a sub-resource "quote_request" under "api"
resource "aws_api_gateway_resource" "quote_request" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_resource.main_api.id
  path_part   = "quote_request"
}

# Create a method for the "POST" HTTP method for the "quote_request" resource
resource "aws_api_gateway_method" "post_quote_request" {
  rest_api_id   = aws_api_gateway_rest_api.sightline-api.id
  resource_id   = aws_api_gateway_resource.quote_request.id
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "api_quote_request" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  resource_id = aws_api_gateway_resource.quote_request.id
  http_method = "POST"
  type        = "HTTP_PROXY"
  integration_http_method = "ANY"
  uri        = "http://${aws_lb.flask_lb.dns_name}/api/quote_request"
}

# Create a sub-resource "overhaul" under "api"
resource "aws_api_gateway_resource" "api_overhaul" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_resource.main_api.id
  path_part   = "overhaul"
}

# Create a sub-resource "locations" under "overhaul"
resource "aws_api_gateway_resource" "api_locations" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  parent_id   = aws_api_gateway_resource.api_overhaul.id
  path_part   = "locations"
}

# Create a method for the "POST" HTTP method for "locations"
resource "aws_api_gateway_method" "post_api_locations" {
  rest_api_id   = aws_api_gateway_rest_api.sightline-api.id
  resource_id   = aws_api_gateway_resource.api_locations.id
  http_method   = "POST"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "overhaul_locations" {
  rest_api_id = aws_api_gateway_rest_api.sightline-api.id
  resource_id = aws_api_gateway_resource.api_locations.id
  http_method = "POST"
  type        = "HTTP_PROXY"
  integration_http_method = "ANY"
  uri        = "http://${aws_lb.flask_lb.dns_name}/api/overhaul/locations"
}