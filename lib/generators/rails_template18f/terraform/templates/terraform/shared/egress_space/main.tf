###
# Target space/org
###

data "cloudfoundry_org" "org" {
  name = var.cf_org_name
}

###
# Egress Space
###

resource "cloudfoundry_space" "public_egress" {
  name = "${var.cf_space_name}-egress"
  org  = data.cloudfoundry_org.org.id
}

resource "cloudfoundry_space_users" "developers" {
  space      = cloudfoundry_space.public_egress.id
  developers = var.space_developers
}
