variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "vitaovich-nextjs-playground-rg"
}

variable "location" {
  description = "Azure Region for resources"
  type        = string
  default     = "westus2"
}

variable "static_web_app_name" {
  description = "Name of the Static Web App"
  type        = string
  default     = "vitaovich-nextjs-playground-swa"
}

variable "app_location" {
  description = "Path to your app source code"
  type        = string
  default     = "src"
}
