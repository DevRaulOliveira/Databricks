WITH calculos
(SELECT 
  billing_origin_product produto,
  usage_date data,
  SUM(usage_quantity) as total_dbus
FROM system.billing.usage
-- WHERE usage_date >= CURRENT_DATE() - INTERVAL 30 DAYS
GROUP BY billing_origin_product, usage_date
ORDER BY usage_date DESC, total_dbus DESC)

SELECT
  produto
  , data
  , total_dbus
  , (total_dbus/4000) * 2.8 custo_dol
FROM calculos;
