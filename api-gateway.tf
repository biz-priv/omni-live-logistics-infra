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
  uri        = var.nlb_arn
  #connection_type = "VPC_LINK"
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
