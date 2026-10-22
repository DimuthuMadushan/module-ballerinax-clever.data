# Ballerina Clever Data connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-clever.data/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-clever.data/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-clever.data.svg)](https://github.com/ballerina-platform/module-ballerinax-clever.data/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/clever.data.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fclever.data)

## Overview

[Clever](https://clever.com) is a platform that securely connects education applications with the roster data held by school districts. The Clever Data connector lets Ballerina programs read and manage that data through the Clever Data API, and supports version 3.1 of the API.

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

1. [School roster overview](examples/school_roster_overview/school_roster_overview.md) - List the districts, the schools in them and the sections taught at each school.
2. [Assignment grading workflow](examples/assignment_grading_workflow/assignment_grading_workflow.md) - Create an assignment in a section, update it and review or grade the student submissions.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`clever.data` package](https://central.ballerina.io/ballerinax/clever.data/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
