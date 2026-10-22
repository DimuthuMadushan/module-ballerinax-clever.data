# School roster overview

This example lists the districts visible to your access token, pages through every school and reports how many sections are taught at each one. It shows how to combine the district, school and section operations of the Clever Data connector with cursor-based pagination.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- A Clever access token for the Clever Data API
- Create a `Config.toml` in this directory:
  ```toml
  token = "<access-token>"
  pageSize = 50
  ```

## Run the example

```bash
bal run
```
