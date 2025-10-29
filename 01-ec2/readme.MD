 1️⃣ Argument => which is from terraform documentation, that should be same. They are the inputs you give to a resource — to tell Terraform what to create and how to configure it.

2️⃣ Attributes => They are the inputs you give to a resource — to tell Terraform what to create and how to configure it, you didn’t define them, Terraform generated them.


* Terraform Vs Cloud formation
==============================
Terraform is open-source, supported multi-cloud, and uses HCL with a local state file — great for portability and flexibility. once you write the synatx, reuse across environments. requires external plugins.
CloudFormation is AWS-native, uses YAML/JSON-based, and tightly integrated with AWS services — best for AWS-only use cases. not required external plugins

* Does terraform need external plugins??
Terraform needs external plugins — they are called Providers.
=> once we run teraform init 
  Downloads required provider plugins (from the Terraform Registry)
  Stores them locally in .terraform/plugins/
  Makes them available to your configuration

Types of Plugins:
-----------------
Providers → for resources (AWS, Azure, etc.)
Provisioners → for running scripts (like remote-exec, local-exec)
Backends → for storing Terraform state remotely (like S3, GCS, Terraform Cloud)