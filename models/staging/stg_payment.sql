select
    id as payment_id,
    orderid,
    paymentmethod,
    status,
    (coalesce(amount,0) )/100 as amount

from raw.stripe.payment
