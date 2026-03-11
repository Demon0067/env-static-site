module "static_site" {
  source = "git::https://github.com/Demon0067/tf-mod-s3-static-site.git?ref=v1.2"

  bucket_name = "harit-static-site-demo-2026"
}

output "website_url" {
  value = module.static_site.website_endpoint
}