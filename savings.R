# Savings


weekly_deposit = 3000/2 # Amount.
years = 8
n = years * 52           # Period (so number of weeks).
ir = .05                # Interest rate.
growth_rate = .03       # growth rate of investment amount.
r = ir / 52
g = growth_rate / 52



# Simple savings calc ----
weekly_deposit * period
# 833820


# Assuming an annual interest rate return ----
weekly_deposit * (((1 + r)^n - 1) / r)
# 1295155


# Assuming a growth rate
ex = weekly_deposit * 
(
    (((1 + r)^n) - ((1 + g)^n)) 
/ 
(r-g))

fv = 90000*(1 + ir)^years

ex + fv