variable "shared_image_name" {
  description = "Specifies the name of the Shared Image."
}

variable "shared_image_gallery_name" {
  description = "Specifies the name of the Shared Image Gallery in which this Shared Image should exist."
}

variable "shared_image_resource_group_name" {
  description = "The name of the resource group in which the Shared Image Gallery exists."
}

variable "shared_image_location" {
  description = "Specifies the supported Azure location where the Shared Image Gallery exists."
}

variable "shared_image_os_type" {
  description = "The type of Operating System present in this Shared Image."
  default     = "Windows"
}
variable "shared_image_tag_function" {
  description = "The function tag."
}

variable "shared_image_tag_creator" {
  description = "The creator tag."
}

variable "shared_image_identifier_offer" {
  description = "The Offer Name for this Shared Image."
}

variable "shared_image_identifier_publisher" {
  description = "The Publisher Name for this Gallery Image."
}

variable "shared_image_identifier_sku" {
  description = "The Name of the SKU for this Gallery Image."
}
