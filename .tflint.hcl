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
