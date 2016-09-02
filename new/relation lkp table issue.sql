 
 
 mapform
 
 select [RelationshipTypeText] as [value]
 , [RelationshipTypeText] as [label] 
 from [Fam_RelationshipType]

 mapfieldcatbase

 library_master where library_name='Rel1Relationship'
 select * from library_systemdata where contactid=102587
 {"type":"select","label":"Rel 1 Relationship","name":"Rel1Relationship","placeholder":"--Select--","default":"","name_labels":[],"columnsize":12,"items":[{"label":"Option 1","value":"option_1"}],"is_sys_lib":1,"is_cus_lib":0,"is_multi_component":0,"component":"","name_labels":[],"lkp":"Fam_RelationshipType","lkp_value":"RelationshipTypeText","lkp_text":"RelationshipTypeText"}

