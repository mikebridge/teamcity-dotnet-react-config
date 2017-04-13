#!/bin/bash

RESOURCE_GROUP=YOUR_RESOURCE_GROUP
SERVICE_PRINCIPAL=YOUR_SERVICE_PRINCIPAL
TENANT_ID=YOUR_TENANT_ID
API_NAME=YOUR_API_NAME
FRONTEND_NAME=YOUR_FRONT_END_NAME
API_STAGING_SLOT=YOUR_API_SLOT
FRONTEND_STAGING_SLOT=YOUR_FRONTEND_SLOT

az login --service-principal -u $RESOURCE_GROUP -p $SERVICE_PRINCIPAL --tenant $TENANT_ID

az appservice web deployment slot swap --resource-group $RESOURCE_GROUP --name $API_NAME --slot $API_STAGING_SLOT --target-slot production

az appservice web deployment slot swap --resource-group $RESOURCE_GROUP --name $FRONTEND_NAME --slot $FRONT_ENDSTAGING_SLOT --target-slot production



