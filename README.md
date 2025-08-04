# MapleTech Secure Foundation 🚀

## Overview

Welcome to **MapleTech Solutions** — a Canadian cloud-native company driving secure and compliant cloud adoption.

As a **Cloud Security Engineer**, your mission is to enforce governance using **Azure Policy** to ensure all deployed resources meet organizational standards.

This repository defines a secure Azure environment using:

- Region restriction  
- Mandatory tagging  
- No public IPs  

All resources are grouped into a **Policy Initiative** named `MapleTech Secure Foundation`.

---

##  Policy Objectives

### 1. **Only Deploy to Canada Central**
- **Policy Name:** `Only-CanadaCentral`
- **Effect:** `Deny`
- **Description:** Prevents resource creation outside the `canadacentral` region.

### 2. **Require ProjectName Tag**
- **Policy Name:** `Require-ProjectName-Tag`
- **Effect:** `Deny`
- **Description:** Denies creation of resources that don’t include a `ProjectName` tag.

### 3. **Deny Public IP Creation**
- **Policy Name:** `Deny-Public-IP`
- **Effect:** `Deny`
- **Description:** Blocks provisioning of Public IP addresses.

---

##  Initiative: MapleTech Secure Foundation

The three policies are grouped into a **Policy Set Definition** (`Policy Initiative`) for centralized assignment and compliance tracking.

| Initiative Name | Category |
|-----------------|----------|
| MapleTech Secure Foundation | Security |

---

##  Folder Structure

| Folder | Description |
|--------|-------------|
| `policies/` | JSON files for each individual policy definition |
| `initiative/` | JSON file for the combined policy initiative |
| `assignments/` | Scripts to assign the initiative to a resource group |
| `test/` | Sample ARM template to test policy enforcement |
| `screenshots/` | Visuals showing UI configuration or failed policy validation |

---

##  Testing Enforcement

| Test | Action | Expected Outcome |
|------|--------|------------------|
|  | Deploy VM in Canada Central with `ProjectName` tag | Allowed |
|  | Deploy VM in East US | Denied (Region policy) |
|  | Deploy storage account without `ProjectName` tag | Denied (Tag policy) |
|  | Create Public IP | Denied (IP policy) |

---

##  Deployment Instructions

### 1. Create Custom Policies

```bash
az policy definition create \
  --name Only-CanadaCentral \
  --rules policies/only-canada-central-policy.json \
  --mode All \
  --display-name "Only Canada Central" \
  --description "Deny resources not in Canada Central" \
  --subscription <your-subscription-id>
