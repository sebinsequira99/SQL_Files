


mapform

select * from library_customdata where contactid=102618

usp_UpdateLibraryData '<xml>
 <text_1453884468377>
  <name>text_1453884468377</name>
  <scope>1</scope>
  <program_id>0</program_id>
  <connection_id>353570</connection_id>
  <is_system>0</is_system>
  <value>testcontact2</value>
 </text_1453884468377>
 <text_1453884480644>
  <name>text_1453884480644</name>
  <scope>2</scope>
  <program_id>0</program_id>
  <connection_id>354010</connection_id>
  <is_system>0</is_system>
  <value>sssssssss</value>
 </text_1453884480644>
 <text_1453884488900>
  <name>text_1453884488900</name>
  <scope>3</scope>
  <program_id>-100</program_id>
  <connection_id>353570</connection_id>
  <is_system>0</is_system>
  <value>testpgm2</value>
 </text_1453884488900>
</xml>' ,78903,102618,-102618


update library_customdata
set data_xml='<xml>
  <text_1453884480644>testcase</text_1453884480644>
</xml>'
where id=153

usp_getLibraryData '<xml>
 <text_1453884468377>
  <name>text_1453884468377</name>
  <scope>1</scope>
  <program_id>0</program_id>
  <connection_id>353570</connection_id>
  <is_system>0</is_system>
 </text_1453884468377>
 <text_1453884480644>
  <name>text_1453884480644</name>
  <scope>2</scope>
  <program_id>0</program_id>
  <connection_id>354010</connection_id>
  <is_system>0</is_system>
 </text_1453884480644>
 <text_1453884488900>
  <name>text_1453884488900</name>
  <scope>3</scope>
  <program_id>-100</program_id>
  <connection_id>353570</connection_id>
  <is_system>0</is_system>
 </text_1453884488900>
</xml>' ,78903,102618,-102618,353570