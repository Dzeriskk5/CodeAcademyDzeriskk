locals {
  region = (
    terraform.workspace == "dev"   ? "northeurope" :
    terraform.workspace == "stage" ? "westeurope" :
    terraform.workspace == "prod"  ? "polandcentral" :
    "northeurope"  # Default value if none match
  )
}
