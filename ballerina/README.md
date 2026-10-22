## Overview

[Clever](https://clever.com) is a platform that securely connects education applications with the roster data held by school districts. The Clever Data connector lets Ballerina programs read and manage that data through the Clever Data API, and supports version 3.1 of the API.

### Key features

- Browse districts, schools, terms, courses and sections
- Look up students, teachers, staff and contacts, and the sections and resources linked to them
- Retrieve attendance records and data change events
- Create, update and delete assignments, and review or grade student submissions
- Authenticate with a bearer access token

## Setup guide

To use the Clever Data connector you need an access token for the Clever Data API.

1. Sign in to the [Clever Dashboard](https://schools.clever.com) and open the application you have registered with Clever, or register a new one.

2. Copy the client ID and client secret of the application.

3. Obtain a district-app access token by sending the client ID and client secret as HTTP Basic credentials to the Clever token endpoint at `https://clever.com/oauth/tokens`, or copy a token for the district from the Clever dashboard.

4. Keep the token safe and supply it to the connector through a `Config.toml` file or an environment variable.

## Quickstart

To use the `clever.data` connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerinax/clever.data;
```

### Step 2: Instantiate a new connector

Create a `Config.toml` file with your access token:

```toml
token = "<access-token>"
```

Then create a client using the token:

```ballerina
configurable string token = ?;

data:Client clever = check new ({auth: {token}});
```

### Step 3: Invoke the connector operation

Use the client to list the schools in the district:

```ballerina
public function main() returns error? {
    data:SchoolsResponse _ = check clever->getSchools();
}
```

### Step 4: Run the Ballerina application

```bash
bal run
```

## Examples

The `Clever Data` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-clever.data/tree/main/examples/), covering the following use cases:

1. [School roster overview](../examples/school_roster_overview/school_roster_overview.md) - List the districts, the schools in them and the sections taught at each school.
2. [Assignment grading workflow](../examples/assignment_grading_workflow/assignment_grading_workflow.md) - Create an assignment in a section, update it and review or grade the student submissions.
