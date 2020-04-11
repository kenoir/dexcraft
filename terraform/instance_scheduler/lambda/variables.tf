variable "schedule_expression" {}

variable "name" {}

variable "source_file" {}
variable "output_path" {}
variable "env_vars" {
  type = map(string)
}
