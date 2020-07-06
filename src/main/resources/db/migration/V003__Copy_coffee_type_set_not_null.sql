UPDATE orders SET coffee_type = type;

ALTER TABLE orders
  ALTER COLUMN coffee_type SET NOT NULL;