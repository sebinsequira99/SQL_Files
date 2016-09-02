

mapsdc

lkpconnectionstatus where connectionstatusid=15

select replace(displayname,'amp;','') as [Client Name],rellabel as [Case Number] from rel_relationship where connectionstatusid=15
order by [Client Name]

select replace(displayname,'amp;','') as [Client Name],rellabel as [Case Number],l.connectionstatustext as [Connection Status] 
from rel_relationship r
join lkpconnectionstatus l
on r.ConnectionStatusId=l.ConnectionStatusId
where isnull(rellabel,'')<>'' and (
displayname like 'Murphy, Eva%'
or displayname like 'Bertram, Daniel%'
or displayname like 'Broad, Jason%'
or displayname like 'Lee, Christine%'
or displayname like 'Chavez, Carmen%'
or displayname like 'Beals%Francis%'
or displayname like 'Escudero, Pamela%'
or displayname like 'Frazier%Clyde%'
or displayname like 'Proclivo, Veronica%'
or displayname like 'McKee, Melanie%'
or displayname like 'Dowhen, Amber%'
or displayname like 'Rodriguez, Edna%'
or displayname like 'Prout, Daniel%'
or displayname like 'Moore%Teresa%'
or displayname like 'Devine, Edward%'
or displayname like 'Arellano%Teresa%'
or displayname like 'Carrell, Constance%'
or displayname like 'Cherrington, Andrew%'
or displayname like 'Bantados, Crystal%'
or displayname like 'White, Stephanie'
or displayname like 'Albright, Julianne%'
or displayname like 'Franco, Jose%'
or displayname like 'Hein, Rebecca%'
or displayname like 'Hoffman-Sperber, Julie%'
or displayname like 'King, Kimberly%'
or displayname like 'Miranda, Priscilla'
or displayname like 'Schexnayder, Jeanie'
or displayname like 'Andersen, Aunjelique%'
or displayname like 'Cherry, Rachel%'
or displayname like 'Lambert, Michelle%'
or displayname like 'Escobar, Donyale%'
or displayname like 'Howard, Lorelei%'
or displayname like 'Robbins, Paul%'
or displayname like 'Stelter, David%'
or displayname like 'Zepeda, Sylvia%'
or displayname like 'Sheehan, Diane%'
or displayname like 'Dorrell, Beth%'
or displayname like 'Lyall, Leah%'
or displayname like 'Thorndike, Jessica%'
or displayname like 'Kelley, Sara%'
or displayname like 'Mendoza, Noelle%'
or displayname like 'Cubero, Erick%'
or displayname like 'Ramamurthy, Diwakar%'
or displayname like 'Hart, Terri%')
order by [Client Name]






