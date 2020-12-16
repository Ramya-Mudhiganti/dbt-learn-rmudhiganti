select
p.orderid order_id,
c.customer_id,
p.amount
from  {{ ref('stg_customers') }} c
inner join {{ ref('stg_orders') }} o on o.customer_id=c.customer_id
inner join {{ ref('stg_payment') }} p on p.orderid=o.order_id
