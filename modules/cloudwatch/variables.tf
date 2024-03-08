variable "record_sets" {
  type = list(object({
    name = string
    records = list(object({
      ip = string
      port = string
    }))
  }))
}
