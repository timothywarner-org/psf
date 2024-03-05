### Prompt

Construct an Azure Bicep template that defines a deployment of multiple Azure Firewalls. 
The template should accept parameters for workspace name, workspace group, subscription, 
network group, naming prefixes for the firewalls, public IPs, and virtual networks, 
as well as deployment location. It should also include tagging parameters for the environment
type and deployment date.

The template must use a loop to create resources based on an object parameter that contains 
firewall configurations. Each firewall resource should be named using a combination of a 
provided prefix and the firewall's name from the object. The scope for the resources should 
be set to a specific resource group designated for network resources.

Additionally, the template should define resource tags that include the environment type, 
deployment date, and inherit tagging information such as Owner, CostCentre, and Application 
from the resource group's tags.

The deployment should be modular, with the firewall resources being created by a module file 
named 'azureFirewalls.module.bicep'. The module should be called within a loop that iterates 
over the firewall objects provided as input
