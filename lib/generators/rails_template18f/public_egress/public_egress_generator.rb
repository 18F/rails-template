# frozen_string_literal: true

require "rails/generators"

module RailsTemplate18f
  module Generators
    class PublicEgressGenerator < ::Rails::Generators::Base
      include Base
      include CloudGovParsing

      desc <<~DESC
        Description:
          Install files for running cg-egress-proxy in <env>-egress cloud.gov spaces
          Prerequisite: the terraform generator has been run already
      DESC

      def check_terraform_exists
        unless terraform_dir_exists?
          fail "Run `rails g rails_template18f:terraform` before running this generator"
        end
      end

      def use_space_module
        append_to_file file_path("terraform/staging/main.tf"), terraform_module
        append_to_file file_path("terraform/production/main.tf"), terraform_module
      end

      def create_default_acls
        %w[staging production].each do |env|
          create_file "config/deployment/egress_proxy/#{app_name}-#{env}.allow.acl", ""
          create_file "config/deployment/egress_proxy/#{app_name}-#{env}.deny.acl", ""
        end
      end

      def copy_deploy_script
        copy_file "deploy_egress_proxy.rb", "bin/ops/deploy_egress_proxy.rb", mode: :preserve
      end

      def update_readme
        insert_into_file "README.md", readme_content, before: "## Documentation"
      end

      def update_boundary_diagram
        boundary_filename = "doc/compliance/apps/application.boundary.md"
        # insert_into_file boundary_filename, <<EOB
      end

      no_tasks do
        def readme_content
          <<~README
            ### Public Egress Proxy

            Traffic to be delivered to the public internet or s3 must be proxied through the [cg-egress-proxy](https://github.com/GSA/cg-egress-proxy) app.

            To deploy the proxy:

            1. Ensure terraform state is up to date.
            1. Update the acl files in `config/deployment/egress_proxy`
            1. Ensure Docker Desktop is running
            1. Deploy the proxy to staging: `bin/ops/deploy_egress_proxy.rb -s #{cloud_gov_staging_space} -a #{app_name}-staging`
            1. Deploy the proxy to production: `bin/ops/deploy_egress_proxy.rb -s #{cloud_gov_production_space} -a #{app_name}-production`

          README
        end

        def terraform_module
          <<~EOT

            module "egress-space" {
              source = "../shared/egress_space"

              cf_user       = var.cf_user
              cf_password   = var.cf_password
              cf_org_name   = local.cf_org_name
              cf_space_name = local.cf_space_name
              space_developers = [
                var.cf_user
              ]
            }
          EOT
        end
      end
    end
  end
end
