@echo off

choco feature enable -n=useRememberedArgumentsForUpgrades
choco feature enable -n=allowGlobalConfirmation
choco feature enable -n=useEnhancedExitCodes