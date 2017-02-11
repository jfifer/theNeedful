CREATE PROCEDURE getOverallExtensions2017()
BEGIN

DECLARE v_std2017,
        v_cloud2017,
        v_sip2017 INT;

SELECT COUNT(b.branchId)
  INTO v_sip2017
  FROM sipTrunk s
  LEFT JOIN branch b ON (s.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN reseller r ON (c.resellerId=r.resellerId)
  LEFT JOIN serverGroup sg ON (r.resellerId=sg.resellerId)
 WHERE c.statusId=1
 AND sg.serverGroupId NOT IN (2,3,6,7,8,33,34,48,76,84,101,133)
 AND c.originalActivationDate < '2018-01-01';

SELECT COUNT(e.extensionId)
  INTO v_std2017 
  FROM extension e
  LEFT JOIN branch b ON (e.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN reseller r ON (r.resellerId = c.resellerId)
  LEFT JOIN serverGroup sg ON (sg.resellerId = c.resellerId)
 WHERE c.statusId=1
   AND sg.serverGroupId NOT IN (2,3,6,7,8,33,34,48,76,84,101,133)
   AND e.extensionTypeId=1
   AND e.isFreeExtension=0
   AND c.companyName NOT LIKE '%test%'
   AND c.companyName NOT LIKE '%demo%'
   AND c.originalActivationDate < '2018-01-01';

SELECT COUNT(e.extensionId)
  INTO v_cloud2017
  FROM extension e
  LEFT JOIN branch b ON (e.branchId=b.branchId)
  LEFT JOIN customer c ON (b.customerId=c.customerId)
  LEFT JOIN reseller r ON (r.resellerId = c.resellerId)
  LEFT JOIN serverGroup sg ON (c.resellerId = sg.resellerId)
 WHERE c.statusId=1
   AND sg.serverGroupId NOT IN (2,3,6,7,8,33,34,48,76,84,101,133)
   AND e.extensionTypeId=2
   AND e.isFreeExtension=0
   AND c.originalActivationDate < '2018-01-01';

SELECT '2017',v_std2017,v_cloud2017,v_sip2017;

END;
