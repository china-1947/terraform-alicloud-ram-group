output "this_group_id" {
  description = "The identifier of group which has been created"
  value       = concat(alicloud_ram_group.this.*.id, [""])[0]
}