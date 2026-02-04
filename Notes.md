# NOTES

Azure Tenant  
 ├── Subscription A (DEV)  
 ├── Subscription B (NPR)  
 ├── Subscription C (PRE-PROD)  
 └── Subscription D (PROD)    
   

az ad sp create-for-rbac \
  --name terraform-sp \
  --role Contributor \
  --scopes /subscriptions/<SUBSCRIPTION_ID>
  

export ARM_CLIENT_ID="appId"  
export ARM_CLIENT_SECRET="password"  
export ARM_TENANT_ID="tenant"  
export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"


cd infra/bootstrap

terraform init -backend-config=../backend-config/dev.hcl