resource "azurerm_shared_image_gallery" "sig" {
  name                = var.shared_image_gallery_name
  resource_group_name = var.shared_image_gallery_resource_group_name

  location    = var.shared_image_gallery_location
  description = var.shared_image_gallery_description

  tags = {
    Creator  = var.shared_image_gallery_tag_creator
    Function = var.shared_image_gallery_tag_function
  }
}
