variable "rg_work" {
  description = "Resource groups to create, keyed by a stable logical name."
  type = map(object({
    name     = string
    location = string
  }))
}
