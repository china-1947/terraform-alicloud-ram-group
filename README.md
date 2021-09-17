# terraform-alicloud-ram-group
Terraform module which create RAM group on Alibaba Cloud.

terraform-alicloud-ram-group
--------------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram-group/blob/master/README-CN.md)

Terraform module is used to create a RAM Group in Alibaba Cloud. It is possible to attach one or multiple RAM users to this group.

These types of resources are supported:

* [RAM group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_group)
* [RAM group policy attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/ram_group_policy_attachment)


## Terraform versions

The Module requires Terraform 0.12.6 and Terraform Provider AliCloud 1.56.0+.

## Usage

### create a new ram group

Create a ram group and associate two users with a managed policy.

```hcl
module "ram-group" {
  source = "terraform-alicloud-modules/ram-group/alicloud"

  create_group = true
  name         = "mytestgroup"
  comments     = "A test group"

  group_users     = ["test-user-1", "test-user-2"]
  system_policies = ["AdministratorAccess"]

}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-ram-group/tree/master/examples/complete)

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)


License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

