select `asset_flow`.`as_of_date`,
       `asset_flow`.`platform`,
       `asset_flow`.`external_account_id`,
       `external_accounts`.`account_id_first_instance_date`,
       `asset_flow`.`amount`,
       `asset_flow`.`purchases`
from `asset_flow`
         left join `external_accounts` on `asset_flow`.`external_account_id` = `external_accounts`.`external_account_id`
where `as_of_date` between '2023-11-01' and '2023-11-30'
  and `country` in ('UNITED STATES', 'UNITED KINGDOM', 'ARMENIA')