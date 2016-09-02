

mapform

library_master where library_name='state'

lkpstate
library_systemdata where contactid=102698

select * from contact where contactid=102698

contactaddress where contactid=102698
user_accounts where connid=-102698

rel_relationship where contactid=102698

usp_updatecontact_onformsave 102698

exec usp_updatelibrarydata
	'<lib_data>
		<Add1>
			<name>Add1</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>testupd</value>
		</Add1>
		<Country>
			<name>Country</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>18</value>
		</Country>
		<AP1BirthState>
			<name>AP1BirthState</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>UT</value>
		</AP1BirthState>
		<Add2>
			<name>Add2</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>uupdtttt</value>
		</Add2>
		<County>
			<name>County</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>67</value>
		</County>
		<State>
			<name>State</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>2</value>
		</State>
		<AP1DOB>
			<name>AP1DOB</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>2015-07-03</value>
		</AP1DOB>
		<AP1Fname>
			<name>AP1Fname</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>sebin2upddd</value>
		</AP1Fname>
		<AP1Lname>
			<name>AP1Lname</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>meduia2upddd</value>
		</AP1Lname>
		<AP2Fname>
			<name>AP2Fname</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>undefined</value>
		</AP2Fname>
		<AP2Lname>
			<name>AP2Lname</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>undefined</value>
		</AP2Lname>
		<AP2DOB>
			<name>AP2DOB</name>
			<scope>0</scope>
			<program_id>0</program_id>
			<connection_id>353832</connection_id>
			<is_system>true</is_system>
			<value>2016-01-11T14:32:41.642Z</value>
		</AP2DOB>
	</lib_data>'
	,78921,102698,-102698



	
