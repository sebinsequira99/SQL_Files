

IF NOT EXISTS(select 1 from sys.columns 
            where Name = N'SecureNoteSubTypeId' and Object_ID = Object_ID(N'contactactivity'))

ALTER TABLE contactactivity
ADD SecureNoteSubTypeId int
