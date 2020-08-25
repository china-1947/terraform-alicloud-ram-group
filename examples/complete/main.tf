module "ram-group" {
  source = "terraform-alicloud-modules/ram-group/alicloud"

  create_group = true
  name         = "mytestgroup"
  comments     = "A test group"

  group_users     = ["test-user-1", "test-user-2", "test-user-3"]
  system_policies = ["AdministratorAccess"]

}