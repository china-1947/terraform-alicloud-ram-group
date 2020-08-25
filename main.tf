# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12.6 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">= 0.12.6"
}

provider "alicloud" {
  version              = ">=1.56.0"
  region               = var.region != "" ? var.region : null
  configuration_source = "terraform-alicloud-modules/ram-group"
}

###############################################################################
# IAM Group
###############################################################################

resource "alicloud_ram_group" "this" {
  count    = var.create_group ? 1 : 0
  name     = var.name
  comments = var.comments
  force    = var.force_destroy
}

resource "alicloud_ram_group_membership" "group_users" {
  count      = length(var.group_users) > 0 && var.create_group ? 1 : 0
  group_name = alicloud_ram_group.this[0].name
  user_names = var.group_users
}

resource "alicloud_ram_group_policy_attachment" "system" {
  for_each = toset(var.system_policies)
  policy_name = each.value
  policy_type = "System"
  group_name  = alicloud_ram_group.this[0].name
}

resource "alicloud_ram_group_policy_attachment" "custom" {
  for_each = toset(var.custom_policies)
  policy_name = each.value
  policy_type = "Custom"
  group_name  = alicloud_ram_group.this[0].name
}
