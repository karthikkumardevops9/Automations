provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

# Assuming you have the list of volume IDs
variable "volume_ids" {
  default = [
    "vol-00e330c98a83cd358",
    "vol-01c1161c1cbdeb29f",
    "vol-08cd581f8d17123ba",
    "vol-0b86e02bdf4cc5ce8",
    "vol-0734147fdd3b20f0c",
    "vol-0e88e9376a4e8e13c",
    "vol-097e075e09358402c",
    "vol-00da90085d7cb7f4c",
    "vol-03a122b11b4bcfcaa",
    "vol-05837c8c455808356",
  ]
}

resource "aws_ebs_snapshot" "volume_snapshots" {
  count      = length(var.volume_ids)
  volume_id  = var.volume_ids[count.index]
  description = "Snapshot for volume ${var.volume_ids[count.index]}"
}
