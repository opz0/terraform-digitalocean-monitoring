# terraform-digitalocean-monitoring
# DigitalOcean Terraform Configuration

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)

## Introduction
This Terraform configuration is designed to create and manage a DigitalOcean Monitoring.

## Usage
To use this module, you should have Terraform installed and configured for DIGITALOCEAN. This module provides the necessary Terraform configuration for creating DIGITALOCEAN resources, and you can customize the inputs as needed. Below is an example of how to use this module:

#  Example: complete
You can use this module in your Terraform configuration like this:

```hcl
module "uptime-alert" {
  source      = "git::https://github.com/opz0/terraform-digitalocean-monitoring.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  target_url  = ["http://test.do.google.ca/", "https://test2.do.google.ca/"]
  type        = ["http", "https"]
  alert_type  = ["down_global"]
  period      = ["2m", "3m"]
  comparison  = ["less_than"]

  notifications = [
    {
      email = ["example@gmail.com"]
      slack = [
        {
          channel = "testing"
          url     = "https://hooks.slack.com/services/TEXXXXXXXXxxxxYTGH8DNkjgggyKipj"
        }
      ]
    }
  ]
}
```

#  Example: basic
You can use this module in your Terraform configuration like this:

```hcl
module "uptime-alert" {
  source      = "git::https://github.com/opz0/terraform-digitalocean-monitoring.git?ref=v1.0.0"
  name        = "app"
  environment = "test"
  target_url  = ["http://test.do.google.ca/"]
  type        = ["http"]
  alert_type  = ["down_global"]
  period      = ["2m"]
  comparison  = ["less_than"]

  notifications = [
    {
      email = ["example@gmail.com"]
      slack = [
        {
          channel = "testing"
          url     = "https://hooks.slack.com/services/TEXXXXXXXXxxxxYTGH8DNkjgggyKipj"
        }
      ]
    }
  ]
}
```
This example demonstrates how to create various DIGITALOCEAN resources using the provided modules. Adjust the input values to suit your specific requirements.


## Module Inputs

- 'type':  The type of the alert.
- 'enabled' :  The status of the alert.
- 'description' : The description of the alert.
- 'window' :  The time frame of the alert. Either 5m, 10m, 30m, or 1h.


## Module Outputs

This module does not produce any outputs. It is primarily used for labeling resources within your Terraform configuration.

- 'id' : The name of the monitoring
- 'type' : The type of the alert.
- 'alerts' :  The notification policies of the alert policy.


## Examples
For detailed examples on how to use this module, please refer to the 'examples' directory within this repository.

## License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/opz0/terraform-digitalocean-monitoring/blob/master/LICENSE) file for more details.

## Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
