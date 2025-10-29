* for-each:
==========  
The for_each loop in Terraform is used to create multiple resources from a map or a set of strings.  
It doesn’t work with normal strings or plain lists.  

When using a set, Terraform gives you each item as each.value.  

When using a map, Terraform gives you both each.key (the name) and each.value (the data).  

If you have a list of maps, you must first convert it into a single map with unique keys before using it with for_each.  
Example:  
ref => 06-dunamic-block(line no. 18)

👉 In short:  
for_each works only with maps or sets of strings, not with lists or single strings.  
To use a list of maps, convert it into a map with unique keys.