# Examples

The `ballerinax/clever.data` connector provides practical examples illustrating usage in various scenarios.

| Example | Description |
|---------|-------------|
| [School roster overview](./school_roster_overview/school_roster_overview.md) | List the districts, the schools in them and the sections taught at each school. |
| [Assignment grading workflow](./assignment_grading_workflow/assignment_grading_workflow.md) | Create an assignment in a section, update it and review or grade the student submissions. |

## Prerequisites

1. A Clever access token for the Clever Data API. Each example reads it from the `token` configurable in its `Config.toml`.

2. Ballerina Swan Lake 2201.12.0 or later.

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
