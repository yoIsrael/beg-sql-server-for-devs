SET QUOTED_IDENTIFIER OFF
SELECT Description,CurrentPrice 
  FROM ShareDetails.Shares
 WHERE Description >= 'Mackrel Fisheries'
AND Description <= "Toland's Irish"
