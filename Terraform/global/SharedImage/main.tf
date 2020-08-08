resource "azurerm_shared_image" "si" {
  name                = var.shared_image_name
  gallery_name        = var.shared_image_gallery_name
  resource_group_name = var.shared_image_resource_group_name
  location            = var.shared_image_location
  os_type             = var.shared_image_os_type

  identifier {
    publisher = var.shared_image_identifier_publisher
    offer     = var.shared_image_identifier_offer
    sku       = var.shared_image_identifier_sku
  }

  tags = {
    Creator  = var.shared_image_tag_creator
    Function = var.shared_image_tag_function
  }
}
