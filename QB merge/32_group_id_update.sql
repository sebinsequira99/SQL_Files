

select gg.group_id as fac_gid
,g.group_id as fcs_gid
,g.group_name
from mapfcs..user_groups g
inner join mapfac..user_groups gg
on g.group_name=gg.group_name

--update mapfcs..user_effectivedate  
--set group_id=
--case when group_id=726	then 897
--when group_id=727	then 898
--when group_id=728	then 899
--when group_id=747	then 900
--when group_id=748	then 901
--when group_id=788	then 902
--when group_id=864	then 903
--when group_id=868	then 904
--when group_id=869	then 905
--when group_id=870	then 906
--when group_id=879	then 907
--when group_id=880	then 908
--when group_id=881	then 909
--when group_id=883	then 910
--when group_id=884	then 911
--when group_id=886	then 912
--when group_id=887	then 913
--when group_id=888	then 914
--when group_id=889	then 915
--else group_id
--end
--where connectionid>100000






