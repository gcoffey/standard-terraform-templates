!Author: Gareth Coffey

!Name: standard-terraform-templates

!Description: Terraform, CloudFormation & ARM can be a bit clunky when it comes to managing thousands of resources across different accounts, resource groups and providers.
HCL is great, but what if you decide to ditch Terraform? Rewrite everything again ...
I have worked on many projects over the past decade and this is a common theme, its due to the IaC implementation not considering change and so is not agile.
Back in 2014 I wrote an initial standard template concept, using Ansible, Boto, YAML & Jinja2 ... it worked great for defining static resources once and then utilising a standard variable format to accomodate AWS and any other provider that might be used later. This was way cleaner and more agnostic than the initial Ansible implementation.
Project after project I refined the concept, and have arrived at a point at which it can extend beyond IaC. 

/json - JSON config files defining the supported resources and 'service packs' (our packaged resources) for each provider, these are created by scripts/create-json.sh
/providers - the provider resource configuration files, these typically define the resource name and applicable required / optional variables for creation
/service-packs - contains grouping of resources including resource dependencies 
/web-templates - web form templates in Jinja2, experimenting with a web interface to define resources and service packs 
/core-tf-templates - basic Terraform HCL & standard variable lists defined as Jinja2 templates  
/playbooks - Ansible playbooks that handle processing of Jinja2 templates
/scripts - contains scripts to generate resource and variable files
/test - will contain tests


!Output: Currently, running scripts/create-resource-templates.sh will generate a Terraform resource file for each provider resource defined in /provider/<provider name>/<resource name>/output/resource.tf.j2
It will also generate the variables file provider/<provider name>/<resource name>/output/variables.yml which you would use in conjunction with resource.tf.j2 to create the resulting Terraform resource.

!Usage: Run the script scripts/create-resource-templates.sh to generate a Terraform resource based Jinja2 template and variable file for each of the resources defined in provider/

