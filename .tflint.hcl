plugin "terraform" {
  enabled = true
  preset  = "all"
}

config {
  module = true
  format = "compact"
}

rule "terraform_documented_outputs" {
  enabled = false
}

rule "terraform_standard_module_structure" {
  enabled = false
}

rule "terraform_required_version" {
  enabled = false
}

rule "terraform_documented_variables" {
  enabled = false
}

rule "terraform_unused_declarations" {
  enabled = false
}
