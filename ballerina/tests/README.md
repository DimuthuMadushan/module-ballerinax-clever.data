# Running Tests

## Prerequisites

By default the tests run against a mock Clever Data service started on port 9090, so no credentials are needed. To run them against the live Clever Data API, set the following environment variables:

```bash
export IS_LIVE_SERVER=true
export CLEVER_TOKEN="<access-token>"
export CLEVER_SCHOOL_ID="<school-id>"
export CLEVER_SECTION_ID="<section-id>"
export CLEVER_USER_ID="<user-id>"
```

## Running the tests

Execute the tests with:

```bash
bal test
```

The suite covers 25 operations: listing and retrieving districts, schools, terms, courses, sections, users, resources, events and attendance, and creating, updating and deleting assignments and submissions.
