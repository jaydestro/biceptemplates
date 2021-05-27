param NSGName string = 'NSGDefault'
param location string = resourceGroup().location
param nsgrule string = 'nsgRule'
param protocol string = 'Tcp'
param sourcePortRange string = '*'
param destinationPortRange string = '*'
param description string = 'default description'
param vnetName string = 'default name'

resource networkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2019-11-01' = {
 
  name: 'NSGname'
  location: location
  properties: {
    securityRules: [
      {
        name: nsgrule
        properties: {
          description: description
          protocol: protocol
          sourcePortRange: sourcePortRange
          destinationPortRange: destinationPortRange
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
    ]
  }
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'name'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'Subnet-1'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'Subnet-2'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}
