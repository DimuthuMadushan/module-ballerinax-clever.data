# Assignment grading workflow

This example creates an assignment in a section, updates it, and then reviews every student submission by following the paginated submissions list. Grades are only written when `applyGrades` is set to `true`, so the review is safe by default.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- A Clever access token with permission to manage assignments
- Create a `Config.toml` in this directory:
  ```toml
  token = "<access-token>"
  sectionId = "<section-id>"
  assignmentTitle = "<assignment-title>"
  dueDate = "<due-date-time>"
  applyGrades = false
  gradeToApply = "A"
  ```

## Run the example

```bash
bal run
```
