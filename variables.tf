variable "tenant-id" {
    description = "The Tenant ID for the Azure Active Directory."
    type        = string
    default    = "60a5e6b0-6783-462c-a4a4-08c0cd9c5706"
}

variable "subscription-id" {
    description = "The Subscription ID for the Azure Subscription."
    type        = string
    default = "4dbffbb6-92ea-4699-bba4-5c52b58301ff"
}

variable "rg-name" {
    description = "The name of the Resource Group to create."
    type        = string
    default     = "sandbox_centralesupelec.team1"
}

variable "region" {
    description = "The Azure region to deploy resources in."
    type        = string
    default     = "France Central"
}


