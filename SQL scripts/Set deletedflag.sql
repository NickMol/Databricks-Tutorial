UPDATE public."Customers"
SET deletedflag = true,
    modified_on = now()
WHERE id = 1;