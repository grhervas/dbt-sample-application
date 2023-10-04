select
    id as payment_id,
    order_id,
    payment_method,
    -- Convert amount to dollars
    amount::decimal / 100 as amount
from stripe.payments