### Storage

resource "azurerm_storage_account" "logo" {
name                     = "storageaccountlogoteam1"
resource_group_name      = var.rg-name
location                 = var.region
account_tier             = "Standard"
account_replication_type = "LRS"
allow_nested_items_to_be_public = "true"
}


resource "azurerm_storage_container" "logo" {
name                  = "logo"
storage_account_name  = azurerm_storage_account.logo.name
container_access_type = "blob"
}

# resource "azurerm_storage_blob" "logo" {
#   name                   = "logo"
#   storage_account_name   = azurerm_storage_account.logo.name
#   storage_container_name = azurerm_storage_container.logo.name
#   type                   = "Block"
# }



resource "azurerm_storage_account" "logs" {
name                     = "storageaccountlogsteam1"
resource_group_name      = var.rg-name
location                 = var.region
account_tier             = "Standard"
account_replication_type = "GRS"
allow_nested_items_to_be_public = "true"
}

resource "azurerm_storage_container" "logs" {
name                  = "logo"
storage_account_name  = azurerm_storage_account.logs.name
container_access_type = "blob"
}

# resource "azurerm_storage_blob" "logs" {
#   name                   = "logo"
#   storage_account_name   = azurerm_storage_account.logs.name
#   storage_container_name = azurerm_storage_container.logs.name
#   type                   = "Block"
# }

### Database 

# Create MySQL Server 
resource "azurerm_mysql_flexible_server" "serverformation1" { 
name    =  "serveriacteam1"
location    =  var.region 
resource_group_name  =  var.rg-name 
administrator_login   =  "adminformation" 
administrator_password =  "formationCodingGame0!" 
sku_name =  "B_Standard_B1ms" 
version =  "8.0.21" 
geo_redundant_backup_enabled = false 
storage { 
auto_grow_enabled = false 
size_gb = 20 
io_scaling_enabled = false 
iops = 360 
} 
} 

resource "azurerm_mysql_flexible_server_configuration" "ssl_config" {
name                = "require_secure_transport"
resource_group_name = var.rg-name
server_name         = azurerm_mysql_flexible_server.serverformation1.name
value               = "OFF"
}


resource "azurerm_mysql_flexible_database" "mysqldb1" { 
name    =  "mysqldb1-iac" 
resource_group_name =  var.rg-name
server_name   =  azurerm_mysql_flexible_server.serverformation1.name
charset    =  "utf8"
collation    =  "utf8_unicode_ci" 
depends_on = [ azurerm_mysql_flexible_server.serverformation1 ] 
} 

resource "azurerm_mysql_flexible_server_firewall_rule" "mysqlfwrule1" { 
name        =  "mysqlfwrule1-iac" 
resource_group_name =  var.rg-name
server_name     = azurerm_mysql_flexible_server.serverformation1.name 
start_ip_address  =  "0.0.0.0"
end_ip_address   =  "255.255.255.255" 
depends_on = [ azurerm_mysql_flexible_server.serverformation1, 
azurerm_mysql_flexible_database.mysqldb1 ] 
}




