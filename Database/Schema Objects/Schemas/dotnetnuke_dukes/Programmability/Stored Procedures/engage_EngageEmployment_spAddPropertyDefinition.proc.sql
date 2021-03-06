﻿
CREATE PROCEDURE dotnetnuke_dukes.[dnn_EngageEmployment_spAddPropertyDefinition]
@DataType int,
@DefaultValue ntext,
@PropertyName nvarchar(50),
@Required bit,
@ViewOrder int,
@Visible bit
AS
DECLARE @ApplicationPropertyId int

SELECT @ApplicationPropertyId = ApplicationPropertyId
FROM   dotnetnuke_dukes.dnn_EngageEmployment_ApplicationProperty
WHERE  PropertyName = @PropertyName

IF @vieworder=-1
BEGIN
SELECT         @vieworder = MAX(ViewOrder) + 1
FROM           dotnetnuke_dukes.dnn_EngageEmployment_ApplicationProperty
END

IF @ApplicationPropertyId is null
BEGIN
INSERT dotnetnuke_dukes.dnn_EngageEmployment_ApplicationProperty	(
Deleted,
DataType,
DefaultValue,
PropertyName,
Required,
ViewOrder,
Visible
)
VALUES	(
0,
@DataType,
@DefaultValue,
@PropertyName,
@Required,
@ViewOrder,
@Visible
)

SELECT @ApplicationPropertyId = SCOPE_IDENTITY()
END
ELSE
BEGIN
UPDATE dotnetnuke_dukes.dnn_EngageEmployment_ApplicationProperty
SET DataType = @DataType,
DefaultValue = @DefaultValue,
Required = @Required,
ViewOrder = @ViewOrder,
Deleted = 0,
Visible = @Visible
WHERE ApplicationPropertyId = @ApplicationPropertyId
END

SELECT @ApplicationPropertyId