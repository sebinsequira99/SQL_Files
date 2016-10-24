

IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
WHERE column_name='automatic_mail' AND table_name='formmaker_tasks')
BEGIN
	ALTER TABLE formmaker_tasks 
	ADD automatic_mail int default 0
END
IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
WHERE column_name='automatic_mail' AND table_name='temp_formmaker_tasks')
BEGIN
	ALTER TABLE temp_formmaker_tasks 
	ADD automatic_mail int default 0
END
IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
WHERE column_name='mail_expiry_day' AND table_name='formmaker_tasks')
BEGIN
	ALTER TABLE formmaker_tasks 
	ADD mail_expiry_day int default 0
END
IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
WHERE column_name='mail_expiry_day' AND table_name='temp_formmaker_tasks')
BEGIN
	ALTER TABLE temp_formmaker_tasks 
	ADD mail_expiry_day int default 0
END
