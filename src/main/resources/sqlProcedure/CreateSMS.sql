USE [Izhevsk]
GO
/****** Object:  StoredProcedure [dbo].[CreateSMS]    Script Date: 23.05.2022 21:23:27 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER PROCEDURE [dbo].[CreateSMS]
  @patients_id INT,
  @phone varchar(20),
  @start_date datetime,
  @body varchar(4000),
  @RecID int = NULL,
  @RecType varchar(60) = NULL
AS
BEGIN
	DECLARE @NEW_ID INT,
         @medecins_id INT
  SET @medecins_id = (select USER_ID from KRN_SYS_SESSIONS where SESSION_ID = @@SPID)
  EXEC up_Get_ID 'SMS_MESSAGES', 1, @NEW_ID output
  INSERT INTO SMS_MESSAGES (SMS_MESSAGES_ID, PATIENTS_ID, PHONE, BODY, MEDECINS_ID, STATUS, SENDED_DATETIME, REC_ID, REC_TYPE)
    VALUES (@NEW_ID, @patients_id, @phone, @body, @medecins_id, 1, @start_date, @RecID, @RecType)
END

