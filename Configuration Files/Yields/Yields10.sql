UPDATE ModifierArguments SET Value = Value * 10 WHERE Name = 'Amount' AND (ModifierID LIKE 'GOODY_GOLD%' OR ModifierID LIKE 'GOODY_FAITH%');