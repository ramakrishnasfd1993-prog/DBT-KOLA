select orderid, sum(amount) as total_amont from raw.stripe.payment group by orderid
