with amount as
(
  select p.orderid order_id,
  sum(amount) as amount
  from {{ ref('stg_payment') }} p
  group by p.orderid
)

select
am.order_id,
c.customer_id,
am.amount
from  {{ ref('stg_orders') }}  o
inner join {{ ref('stg_customers') }} c on o.customer_id=c.customer_id
inner join amount am on am.order_id=o.order_id
