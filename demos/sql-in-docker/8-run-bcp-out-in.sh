#!/bin/bash
set -x

# 1. Dump data out from pre-production image
bcp "SELECT * FROM [SalesLT].[Customer]" \
    queryout ./customer.bcp \
    -d AdventureworksLT \
    -c -T \
    -S sqldocker-preprod -U sa -P Yukon900

# 2. Put data into dev image
bcp AdventureworksLT.SalesLT.Customer IN 
    ./customer.bcp \
    -c -T \
    -S sqldocker-dev -U sa -P Yukon900

# 3. Shrink the data in the dev image
# There are smarter ways to do this, but we'll just DELETE rows for this demo
sqlcmd -S sqldocker-dev -U sa -P Yukon900 \
    -d AdventureworksLT \
    -Q "DELETE FROM [SalesLT].[Customer] WHERE CustomerID > 10"

