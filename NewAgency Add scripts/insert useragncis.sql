SET IDENTITY_INSERT MAPBSA.dbo.user_agencies ON
INSERT INTO [MAPBSA].[dbo].[user_agencies]
           (agency_id
           ,[user_id]
           ,[agency_name]
           ,c_account_key)
           
     VALUES
           (223
           ,8125
           ,'A Baby Step Adoption,Inc.'
           ,223
           )
SET IDENTITY_INSERT MAPBSA.dbo.user_agencies Off