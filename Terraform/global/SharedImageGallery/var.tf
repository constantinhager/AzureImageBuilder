variable "shared_image_gallery_name" {
  description = "name of shared image gallery"
}

variable "shared_image_gallery_resource_group_name" {
  description = "name of resource group where the shared image gallery should be created in"
}

variable "shared_image_gallery_location" {
  description = "one azure location"
  default     = "West Europe"
}

variable "shared_image_gallery_description" {
  description = "a description for the shared image gallery"
}

variable "shared_image_gallery_tag_function" {
  description = "the function tag"
}

variable "shared_image_gallery_tag_creator" {
  description = "the creator tag"
}



