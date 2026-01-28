
Azure
Tenant
 ├── Subscription A (Prod)  
 ├── Subscription B (Dev)  
 └── Subscription C (Shared)   


az ad sp create-for-rbac \
  --name terraform-sp \
  --role Contributor \
  --scopes /subscriptions/<SUBSCRIPTION_ID>
  

export ARM_CLIENT_ID="appId"  
export ARM_CLIENT_SECRET="password"  
export ARM_TENANT_ID="tenant"  
export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"