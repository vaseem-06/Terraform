variable "filename" {
  description = "The name of the file"
  type        = string
  default     = "book.txt"
}
variable "content" {
  description = "The content of the file"
  type        = string
  default     = "Hello from Terraform!"
}
