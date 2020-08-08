module "ResourceGroup" {
  source = "../../global/ResourceGroup"

  resource_group_name = "sig-rg"
  tag_creator         = "Constantin Hager"
  tag_function        = "Resource Group for SIG"
  location            = "West Europe"
}

module "SharedImageGallery" {
  source = "../../global/SharedImageGallery"

  shared_image_gallery_name                = "chwvdsig"
  shared_image_gallery_resource_group_name = module.ResourceGroup.resource_group_name
  shared_image_gallery_location            = "West Europe"
  shared_image_gallery_description         = "all wvd images"
  shared_image_gallery_tag_function        = "sig for all wvd images"
  shared_image_gallery_tag_creator         = "Constantin Hager"
}

module "SharedImage" {
  source = "../../global/SharedImage"

  shared_image_name                 = "wvd-test"
  shared_image_gallery_name         = module.SharedImageGallery.shared_image_gallery_name
  shared_image_resource_group_name  = module.ResourceGroup.resource_group_name
  shared_image_location             = "West Europe"
  shared_image_tag_function         = "wvd test image"
  shared_image_tag_creator          = "Constantin Hager"
  shared_image_identifier_offer     = "office-365"
  shared_image_identifier_publisher = "MicrosoftWindowsDesktop"
  shared_image_identifier_sku       = "20h1-evd-o365pp"
}

