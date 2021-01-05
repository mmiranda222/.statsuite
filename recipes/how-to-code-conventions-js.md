# how to code (JS)
set of conventions adopted by the JS team.  
*please contact @mike.velluet @RedPDRoncoli @nicolas-briemant if you have a suggestion.*  
**everything is welcomed!**

#### minimal nested levels
```javascript
// don't
if (something) {
  // something
}

// do
if (!something) return;
// something
```
