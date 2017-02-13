IPTRUNK#####
SELECT concat(serv.name, ":  ", COUNT(s.sipTrunkId))
  FROM sipTrunk s
  LEFT JOIN branch b ON (s.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN server serv ON (serv.serverId=b.featureServerId)
 WHERE c.statusId=1
 AND serv.serverGroupId NOT IN (1,2,3,4,5,6,7,8,33,34,48,54,76,84,101,102,133)
 AND c.originalActivationDate < '2018-01-01'
GROUP BY serv.serverId;

#####SIPTRUNK TOTAL#####
SELECT COUNT(s.sipTrunkId)
  FROM sipTrunk s
  LEFT JOIN branch b ON (s.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN server serv ON (serv.serverId=b.featureServerId)
 WHERE c.statusId=1
 AND serv.serverGroupId NOT IN (1,2,3,4,5,6,7,8,33,34,48,54,76,84,101,102,133)
 AND c.originalActivationDate < '2018-01-01';

#####STANDARD DETAIL#####
SELECT concat(s.name, ":  ", COUNT(e.extensionId))
  FROM extension e
  LEFT JOIN branch b ON (e.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN server s ON (b.featureServerId = s.serverId)
 WHERE c.statusId=1
   AND s.serverGroupId NOT IN (1,2,3,4,5,6,7,8,33,34,48,54,76,84,101,102,133)
   AND e.extensionTypeId=1
   AND e.isFreeExtension=0
   AND c.companyName NOT LIKE '%test%'
   AND c.companyName NOT LIKE '%demo%'
   AND c.originalActivationDate < '2018-01-01'
GROUP BY s.serverId;

#####STANDARD TOTAL#####
SELECT COUNT(e.extensionId)
  FROM extension e
  LEFT JOIN branch b ON (e.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN server s ON (b.featureServerId = s.serverId)
 WHERE c.statusId=1
   AND s.serverGroupId NOT IN (1,2,3,4,5,6,7,8,33,34,48,54,76,84,101,102,133)
   AND e.extensionTypeId=1
   AND e.isFreeExtension=0
   AND c.companyName NOT LIKE '%test%'
   AND c.companyName NOT LIKE '%demo%'
   AND c.originalActivationDate < '2018-01-01';

#####CLOUD DETAIL#####
SELECT concat(s.name, ":  ", COUNT(e.extensionId))
  FROM extension e
  LEFT JOIN branch b ON (e.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN server s ON (b.featureServerId=s.serverId)
 WHERE c.statusId=1
   AND s.serverGroupId NOT IN (1,2,3,4,5,6,7,8,33,34,48,54,76,84,101,102,133)
   AND e.extensionTypeId=2
   AND e.isFreeExtension=0
   AND c.originalActivationDate < '2018-01-01'
GROUP BY s.serverId;

#####CLOUD TOTAL#####
SELECT COUNT(e.extensionId)
  FROM extension e
  LEFT JOIN branch b ON (e.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN server s ON (b.featureServerId=s.serverId)
 WHERE c.statusId=1
   AND s.serverGroupId NOT IN (1,2,3,4,5,6,7,8,33,34,48,54,76,84,101,102,133)
   AND e.extensionTypeId=2
   AND e.isFreeExtension=0
   AND c.originalActivationDate < '2018-01-01';
