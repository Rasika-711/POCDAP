param location string = resourceGroup().location

resource Office365_ApiConnection 'Microsoft.Web/connections@2016-06-01' = {
  location: location
  name: 'Office365-ApiConnection'
  properties: {
    displayName: 'office365'
    api: {
      id: subscriptionResourceId('Microsoft.Web/locations/managedApis',location,'office365')
      //id: '/subscriptions/4155778c-cb1c-4e65-9d4b-3aa687621260/providers/Microsoft.Web/locations/uksouth/managedApis/office365'
    }
    parameterValues: {}
    testLinks: [
      {
        requestUri: '/subscriptions/4155778c-cb1c-4e65-9d4b-3aa687621260/resourceGroups/POCDAP/providers/Microsoft.Web/connections/Office365-ApiConnection/extensions/proxy/testconnection?api-version=2016-06-01'
        method: 'get'
      }
    ]
  }
}

output ApiConnectionurl string = Office365_ApiConnection.properties.createdTime
