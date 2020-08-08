module "ResourceGroup" {
  source = "../../global/ResourceGroup"

  resource_group_name = "sig-rg"
  tag_creator         = "Constantin Hager"
  tag_function        = "Resource Group for SIG"
  location            = "West Europe"
}

module "SharedImageGallery" {
  source = "../../global/SharedImageGallery"

  shared_image_gallery_name = "wvd-sig"
  shared_image_gallery_resource_group_name = module.ResourceGroup.resource_group_name
  shared_image_gallery_location = "West Europe"
  shared_image_gallery_description = "all wvd images"
  shared_image_gallery_tag_function = "sig for all wvd images"
  shared_image_gallery_tag_creator = "Constantin Hager"
}

