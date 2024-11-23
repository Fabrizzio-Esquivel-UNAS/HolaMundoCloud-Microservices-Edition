# Define the API Gateway
resource "aws_api_gateway_rest_api" "api_gateway" {
  name = "HolaMundoAPI"
  description = "API Gateway for frontend-backend communication"
}

# Define the resource for Instance 1 ("/microfrontend1")
resource "aws_api_gateway_resource" "instance_1_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "microfrontend1"
}

# Define the GET method for Instance 1
resource "aws_api_gateway_method" "instance_1_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.instance_1_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "instance_1_method_response" {
    rest_api_id   = "${aws_api_gateway_rest_api.api_gateway.id}"
    resource_id   = "${aws_api_gateway_resource.instance_1_resource.id}"
    http_method   = "${aws_api_gateway_method.instance_1_get_method.http_method}"
    status_code   = "200"
    response_parameters = {
        "method.response.header.Access-Control-Allow-Origin" = true
    }
    depends_on = [ aws_api_gateway_method.instance_1_get_method ]
}

# Integrate API Gateway with Instance 1
resource "aws_api_gateway_integration" "instance_1_integration" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_1_resource.id
  http_method = aws_api_gateway_method.instance_1_get_method.http_method
  type        = "HTTP"
  integration_http_method = "GET"
  uri         = "http://${aws_instance.ecs_instance_1.public_ip}/"
  
}

resource "aws_api_gateway_integration_response" "instance_1_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_1_resource.id
  http_method = aws_api_gateway_method_response.instance_1_method_response.http_method
  status_code = aws_api_gateway_method_response.instance_1_method_response.status_code

  # Transforms the backend JSON response to XML
  response_templates = {
    "application/json" = "#set($inputRoot = $input.path('$'))\n$inputRoot" # This simply returns the raw body from the backend
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

# Define the resource for Instance 2 ("/microfrontend2")
resource "aws_api_gateway_resource" "instance_2_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "microfrontend2"
}

# Define the GET method for Instance 2
resource "aws_api_gateway_method" "instance_2_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.instance_2_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "instance_2_method_response" {
    rest_api_id   = "${aws_api_gateway_rest_api.api_gateway.id}"
    resource_id   = "${aws_api_gateway_resource.instance_2_resource.id}"
    http_method   = "${aws_api_gateway_method.instance_2_get_method.http_method}"
    status_code   = "200"
    response_parameters = {
        "method.response.header.Access-Control-Allow-Origin" = true
    }
    depends_on = [ aws_api_gateway_method.instance_2_get_method ]
}

# Integrate API Gateway with Instance 2
resource "aws_api_gateway_integration" "instance_2_integration" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_2_resource.id
  http_method = aws_api_gateway_method.instance_2_get_method.http_method
  type        = "HTTP"
  integration_http_method = "GET"
  uri         = "http://${aws_instance.ecs_instance_2.public_ip}/"
}

resource "aws_api_gateway_integration_response" "instance_2_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_2_resource.id
  http_method = aws_api_gateway_method_response.instance_2_method_response.http_method
  status_code = aws_api_gateway_method_response.instance_2_method_response.status_code

  # Transforms the backend JSON response to XML
  response_templates = {
    "application/json" = "#set($inputRoot = $input.path('$'))\n$inputRoot" # This simply returns the raw body from the backend
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

# Define the resource for Instance 3 ("/microfrontend3")
resource "aws_api_gateway_resource" "instance_3_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "microfrontend3"
}

# Define the GET method for Instance 3
resource "aws_api_gateway_method" "instance_3_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.instance_3_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "instance_3_method_response" {
    rest_api_id   = "${aws_api_gateway_rest_api.api_gateway.id}"
    resource_id   = "${aws_api_gateway_resource.instance_3_resource.id}"
    http_method   = "${aws_api_gateway_method.instance_3_get_method.http_method}"
    status_code   = "200"
    response_parameters = {
        "method.response.header.Access-Control-Allow-Origin" = true
    }
    depends_on = [ aws_api_gateway_method.instance_3_get_method ]
}

# Integrate API Gateway with Instance 3
resource "aws_api_gateway_integration" "instance_3_integration" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_3_resource.id
  http_method = aws_api_gateway_method.instance_3_get_method.http_method
  type        = "HTTP"
  integration_http_method = "GET"
  uri         = "http://${aws_instance.ecs_instance_3.public_ip}/"
  
}

resource "aws_api_gateway_integration_response" "instance_3_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_3_resource.id
  http_method = aws_api_gateway_method_response.instance_3_method_response.http_method
  status_code = aws_api_gateway_method_response.instance_3_method_response.status_code

  # Transforms the backend JSON response to XML
  response_templates = {
    "application/json" = "#set($inputRoot = $input.path('$'))\n$inputRoot" # This simply returns the raw body from the backend
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

# Define the resource for Instance 4 ("/service1")
resource "aws_api_gateway_resource" "instance_4_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "service1"
}

# Define the GET method for Instance 4
resource "aws_api_gateway_method" "instance_4_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.instance_4_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "instance_4_method_response" {
    rest_api_id   = "${aws_api_gateway_rest_api.api_gateway.id}"
    resource_id   = "${aws_api_gateway_resource.instance_4_resource.id}"
    http_method   = "${aws_api_gateway_method.instance_4_get_method.http_method}"
    status_code   = "200"
    response_parameters = {
        "method.response.header.Access-Control-Allow-Origin" = true
    }
    depends_on = [ aws_api_gateway_method.instance_4_get_method ]
}

# Integrate API Gateway with Instance 4
resource "aws_api_gateway_integration" "instance_4_integration" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_4_resource.id
  http_method = aws_api_gateway_method.instance_4_get_method.http_method
  type        = "HTTP"
  integration_http_method = "GET"
  uri         = "http://${aws_instance.ecs_instance_4.public_ip}/"
  
}

resource "aws_api_gateway_integration_response" "instance_4_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_4_resource.id
  http_method = aws_api_gateway_method_response.instance_4_method_response.http_method
  status_code = aws_api_gateway_method_response.instance_4_method_response.status_code

  # Transforms the backend JSON response to XML
  response_templates = {
    "application/json" = "#set($inputRoot = $input.path('$'))\n$inputRoot" # This simply returns the raw body from the backend
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

# Define the resource for Instance 5 ("/service2")
resource "aws_api_gateway_resource" "instance_5_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "service2"
}

# Define the GET method for Instance 5
resource "aws_api_gateway_method" "instance_5_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.instance_5_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "instance_5_method_response" {
    rest_api_id   = "${aws_api_gateway_rest_api.api_gateway.id}"
    resource_id   = "${aws_api_gateway_resource.instance_5_resource.id}"
    http_method   = "${aws_api_gateway_method.instance_5_get_method.http_method}"
    status_code   = "200"
    response_parameters = {
        "method.response.header.Access-Control-Allow-Origin" = true
    }
    depends_on = [ aws_api_gateway_method.instance_5_get_method ]
}

# Integrate API Gateway with Instance 5
resource "aws_api_gateway_integration" "instance_5_integration" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_5_resource.id
  http_method = aws_api_gateway_method.instance_5_get_method.http_method
  type        = "HTTP"
  integration_http_method = "GET"
  uri         = "http://${aws_instance.ecs_instance_5.public_ip}/"
  
}

resource "aws_api_gateway_integration_response" "instance_5_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_5_resource.id
  http_method = aws_api_gateway_method_response.instance_5_method_response.http_method
  status_code = aws_api_gateway_method_response.instance_5_method_response.status_code

  # Transforms the backend JSON response to XML
  response_templates = {
    "application/json" = "#set($inputRoot = $input.path('$'))\n$inputRoot" # This simply returns the raw body from the backend
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

# Define the resource for Instance 6 ("/service3")
resource "aws_api_gateway_resource" "instance_6_resource" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  parent_id   = aws_api_gateway_rest_api.api_gateway.root_resource_id
  path_part   = "service3"
}

# Define the GET method for Instance 6
resource "aws_api_gateway_method" "instance_6_get_method" {
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  resource_id   = aws_api_gateway_resource.instance_6_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_method_response" "instance_6_method_response" {
    rest_api_id   = "${aws_api_gateway_rest_api.api_gateway.id}"
    resource_id   = "${aws_api_gateway_resource.instance_6_resource.id}"
    http_method   = "${aws_api_gateway_method.instance_6_get_method.http_method}"
    status_code   = "200"
    response_parameters = {
        "method.response.header.Access-Control-Allow-Origin" = true
    }
    depends_on = [ aws_api_gateway_method.instance_6_get_method ]
}

# Integrate API Gateway with Instance 6
resource "aws_api_gateway_integration" "instance_6_integration" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_6_resource.id
  http_method = aws_api_gateway_method.instance_6_get_method.http_method
  type        = "HTTP"
  integration_http_method = "GET"
  uri         = "http://${aws_instance.ecs_instance_6.public_ip}/"
  
}

resource "aws_api_gateway_integration_response" "instance_6_integration_response" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  resource_id = aws_api_gateway_resource.instance_6_resource.id
  http_method = aws_api_gateway_method_response.instance_6_method_response.http_method
  status_code = aws_api_gateway_method_response.instance_6_method_response.status_code

  # Transforms the backend JSON response to XML
  response_templates = {
    "application/json" = "#set($inputRoot = $input.path('$'))\n$inputRoot" # This simply returns the raw body from the backend
  }
  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }
}

# Update deployment dependencies
resource "aws_api_gateway_deployment" "api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  depends_on = [
    aws_api_gateway_integration.instance_1_integration,
    aws_api_gateway_integration.instance_2_integration,
    aws_api_gateway_integration.instance_3_integration,
    aws_api_gateway_integration.instance_4_integration,
    aws_api_gateway_integration.instance_5_integration,
    aws_api_gateway_integration.instance_6_integration,
  ]
}

resource "aws_api_gateway_stage" "api_stage" {
  deployment_id = aws_api_gateway_deployment.api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.api_gateway.id
  stage_name    = "stage"
}


output "api_gateway_url" {
  value = aws_api_gateway_deployment.api_deployment.invoke_url
}