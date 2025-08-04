#!/bin/bash

# Variables - edit these before running
SUBSCRIPTION_ID="5e942409-9895-49e8-b6c2-3b2dfa341205"
RESOURCE_GROUP="your-resource-group-name"
POLICY_SET_DEFINITION_ID="/subscriptions/$SUBSCRIPTION_ID/providers/Microsoft.Authorization/policySetDefinitions/65957df03a664d688f02551a"
ASSIGNMENT_NAME="MapleTechSecureFoundationAssignment"
SCOPE="/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP"

echo "Assigning Policy Initiative '$ASSIGNMENT_NAME' to resource group '$RESOURCE_GROUP'..."

# Assign the policy initiative with enforcement mode set to Default (enforce deny)
az policy assignment create \
  --name "$ASSIGNMENT_NAME" \
  --scope "$SCOPE" \
  --policy-set-definition "$POLICY_SET_DEFINITION_ID" \
  --enforcement-mode Default

echo "Assignment complete."
