# Terraform-digitalocean-monitoring
# Terraform DigitalOcean cloud monitoring Module


## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [Author](#author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)
## Introduction
This Terraform configuration is designed to create and manage a DigitalOcean Monitoring.

## Usage
To use this module, you should have Terraform installed and configured for DIGITALOCEAN. This module provides the necessary Terraform configuration for creating DIGITALOCEAN resources, and you can customize the inputs as needed. Below is an example of how to use this module:

#  Example: complete
You can use this module in your Terraform configuration like this:

```hcl
module "uptime-alert" {
  source      = "cypik/monitoring/digitalocean"
  version     = "1.0.2"
  name        = "app"
  environment = "test"
  target_url  = ["https://www.google.com/", "https://www.google.com/"]
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

# Example: Basic
You can use this module in your Terraform configuration like this:

```hcl
module "uptime-alert" {
  source      = "cypik/monitoring/digitalocean"
  version     = "1.0.2"
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


## Examples
For detailed examples on how to use this module, please refer to the [examples](https://github.com/cypik/terraform-digitalocean-monitoring/blob/master/example) directory within this repository.

## Author
Your Name
Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This Terraform module is provided under the **MIT** License. Please see the [LICENSE](https://github.com/cypik/terraform-digitalocean-monitoring/blob/master/LICENSE) file for more details.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.5 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.40.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | cypik/labels/digitalocean | 1.0.2 |

## Resources

| Name | Type |
|------|------|
| [digitalocean_tag.id](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/tag) | resource |
| [digitalocean_uptime_alert.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/uptime_alert) | resource |
| [digitalocean_uptime_check.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/uptime_check) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_type"></a> [alert\_type](#input\_alert\_type) | The type of health check to perform. Must be one of latency, down, down\_global or ssl\_expiry. | `list(any)` | <pre>[<br>  "down_global"<br>]</pre> | no |
| <a name="input_comparison"></a> [comparison](#input\_comparison) | The comparison operator used against the alert's threshold. Must be one of greater\_than or less\_than. | `list(any)` | <pre>[<br>  "less_than"<br>]</pre> | no |
| <a name="input_enable"></a> [enable](#input\_enable) | A boolean value indicating whether the check is enabled/disabled. | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | A boolean value indicating whether the check is enabled/disabled. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `cypik`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `cypik`. | `list(any)` | `[]` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'terraform-cypik' | `string` | `"cypik"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_notifications"></a> [notifications](#input\_notifications) | The notification settings for a trigger alert. | `list(any)` | `[]` | no |
| <a name="input_number_of_tags"></a> [number\_of\_tags](#input\_number\_of\_tags) | The number of tags to create. | `number` | `1` | no |
| <a name="input_period"></a> [period](#input\_period) | Period of time the threshold must be exceeded to trigger the alert. Must be one of 2m, 3m, 5m, 10m, 15m, 30m or 1h. | `list(string)` | <pre>[<br>  "2m"<br>]</pre> | no |
| <a name="input_regions"></a> [regions](#input\_regions) | An array containing the selected regions to perform healthchecks from: 'us\_east', 'us\_west', 'eu\_west', 'se\_asia'' | `list(string)` | <pre>[<br>  "us_east",<br>  "us_west",<br>  "eu_west",<br>  "se_asia"<br>]</pre> | no |
| <a name="input_target_url"></a> [target\_url](#input\_target\_url) | The endpoint to perform healthchecks on. | `list(any)` | `[]` | no |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | The threshold at which the alert will enter a trigger state. The specific threshold is dependent on the alert type. | `list(any)` | <pre>[<br>  1<br>]</pre> | no |
| <a name="input_type"></a> [type](#input\_type) | The type of health check to perform: 'ping' 'http' 'https'. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_id_check"></a> [id\_check](#output\_id\_check) | The id of the check. |
<!-- END_TF_DOCS -->