---
title: "Error messages"
subtitle: 
comments: false
weight: 3700

---

When browsing for a data view, requests for data and structural metadata are made upon the corresponding services, requests sometimes leading to errors.  
When the HTTP error code returned to the client request is any other code than `404`, the user is notified with a specific/interpreted error message:  

| HTTP error | Error Message |
|------------|---------------|
| 404        | "Not found" messages |
|401, 402 or 403| `You are not permitted to see this data. Please try again after logging in with another account.`|
| 400, 500   | `Whoops, something went wrong on our side. We are working to solve this. Please try again later.`|
