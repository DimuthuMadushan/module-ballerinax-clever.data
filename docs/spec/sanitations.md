_Author_:  @DimuthuMadushan \
_Created_: 2026/10/22 \
_Updated_: 2026/10/22 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Clever Data. 
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/clever/data/3.1.0/openapi.yaml).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Rewrite `info.description`
- **Original**: `Serves the Clever Data API`
- **Updated**: A short plain-text summary of what the API offers (roster data, assignments and submissions).
- **Reason**: The description becomes the `Client` class documentation, and the original only repeated the API name. Changed in the original spec `docs/spec/openapi.yaml`.

2. Declare `application/json` as the request media type
- **Original**: The Swagger 2.0 document declares no `consumes`, so the three request bodies (create assignment, update assignment, update submission) resolved to `*/*` and generated as `http:Request`.
- **Updated**: A global `consumes: [application/json]` is added, so the bodies bind to `AssignmentRequest` and `SubmissionRequest`.
- **Reason**: The API accepts JSON bodies only. Changed in the original spec `docs/spec/openapi.yaml`.

3. Update `date-time` to `datetime`
- **Original**: `"format":"date-time"`
- **Updated**: `"format":"datetime"`
- **Reason**: The `date-time` format is not compatible with the openAPI generation tool. Updated to `datetime` for Ballerina compatibility.
<!-- auto-generated -->

4. Change `DistrictAdmin title` to nullable
- **Original**: The `title` field in `DistrictAdmin` was `not nullable`.
- **Updated**: The `title` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

5. Change `GradingScale entries` to nullable
- **Original**: The `entries` field in `GradingScale` was `not nullable`.
- **Updated**: The `entries` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

6. Change `SubmissionRequest grade` to nullable
- **Original**: The `grade` field in `SubmissionRequest` was `not nullable`.
- **Updated**: The `grade` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

7. Change `SubmissionRequest grade_comment` to nullable
- **Original**: The `grade_comment` field in `SubmissionRequest` was `not nullable`.
- **Updated**: The `grade_comment` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

8. Change `SubmissionRequest override_due_date` to nullable
- **Original**: The `override_due_date` field in `SubmissionRequest` was `not nullable`.
- **Updated**: The `override_due_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

9. Change `SubmissionRequest grader_id` to nullable
- **Original**: The `grader_id` field in `SubmissionRequest` was `not nullable`.
- **Updated**: The `grader_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

10. Change `Staff department` to nullable
- **Original**: The `department` field in `Staff` was `not nullable`.
- **Updated**: The `department` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

11. Change `Staff title` to nullable
- **Original**: The `title` field in `Staff` was `not nullable`.
- **Updated**: The `title` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

12. Change `Attachment description` to nullable
- **Original**: The `description` field in `Attachment` was `not nullable`.
- **Updated**: The `description` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

13. Change `Attachment title` to nullable
- **Original**: The `title` field in `Attachment` was `not nullable`.
- **Updated**: The `title` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

14. Change `Attachment thumbnail_url` to nullable
- **Original**: The `thumbnail_url` field in `Attachment` was `not nullable`.
- **Updated**: The `thumbnail_url` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

15. Change `Attachment file_external_id` to nullable
- **Original**: The `file_external_id` field in `Attachment` was `not nullable`.
- **Updated**: The `file_external_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

16. Change `Attachment url` to nullable
- **Original**: The `url` field in `Attachment` was `not nullable`.
- **Updated**: The `url` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

17. Change `Name middle` to nullable
- **Original**: The `middle` field in `Name` was `not nullable`.
- **Updated**: The `middle` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

18. Change `Name last` to nullable
- **Original**: The `last` field in `Name` was `not nullable`.
- **Updated**: The `last` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

19. Change `Name first` to nullable
- **Original**: The `first` field in `Name` was `not nullable`.
- **Updated**: The `first` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

20. Change `Assignment end_date` to nullable
- **Original**: The `end_date` field in `Assignment` was `not nullable`.
- **Updated**: The `end_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

21. Change `Assignment created` to nullable
- **Original**: The `created` field in `Assignment` was `not nullable`.
- **Updated**: The `created` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

22. Change `Assignment due_date` to nullable
- **Original**: The `due_date` field in `Assignment` was `not nullable`.
- **Updated**: The `due_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

23. Change `Assignment term_id` to nullable
- **Original**: The `term_id` field in `Assignment` was `not nullable`.
- **Updated**: The `term_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

24. Change `Assignment category_id` to nullable
- **Original**: The `category_id` field in `Assignment` was `not nullable`.
- **Updated**: The `category_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

25. Change `Assignment display_date` to nullable
- **Original**: The `display_date` field in `Assignment` was `not nullable`.
- **Updated**: The `display_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

26. Change `Assignment points_possible` to nullable
- **Original**: The `points_possible` field in `Assignment` was `not nullable`.
- **Updated**: The `points_possible` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

27. Change `Assignment last_modified` to nullable
- **Original**: The `last_modified` field in `Assignment` was `not nullable`.
- **Updated**: The `last_modified` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

28. Change `Assignment description_plaintext` to nullable
- **Original**: The `description_plaintext` field in `Assignment` was `not nullable`.
- **Updated**: The `description_plaintext` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

29. Change `Assignment start_date` to nullable
- **Original**: The `start_date` field in `Assignment` was `not nullable`.
- **Updated**: The `start_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

30. Change `StudentRelationship relationship` to nullable
- **Original**: The `relationship` field in `StudentRelationship` was `not nullable`.
- **Updated**: The `relationship` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

31. Change `StudentRelationship type` to nullable
- **Original**: The `type` field in `StudentRelationship` was `not nullable`.
- **Updated**: The `type` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

32. Change `DistrictContact email` to nullable
- **Original**: The `email` field in `DistrictContact` was `not nullable`.
- **Updated**: The `email` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

33. Change `AttachmentRequest description` to nullable
- **Original**: The `description` field in `AttachmentRequest` was `not nullable`.
- **Updated**: The `description` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

34. Change `AttachmentRequest title` to nullable
- **Original**: The `title` field in `AttachmentRequest` was `not nullable`.
- **Updated**: The `title` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

35. Change `AttachmentRequest url` to nullable
- **Original**: The `url` field in `AttachmentRequest` was `not nullable`.
- **Updated**: The `url` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

36. Change `Course number` to nullable
- **Original**: The `number` field in `Course` was `not nullable`.
- **Updated**: The `number` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

37. Change `Course name` to nullable
- **Original**: The `name` field in `Course` was `not nullable`.
- **Updated**: The `name` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

38. Change `Teacher title` to nullable
- **Original**: The `title` field in `Teacher` was `not nullable`.
- **Updated**: The `title` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

39. Change `Teacher teacher_number` to nullable
- **Original**: The `teacher_number` field in `Teacher` was `not nullable`.
- **Updated**: The `teacher_number` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

40. Change `Teacher state_id` to nullable
- **Original**: The `state_id` field in `Teacher` was `not nullable`.
- **Updated**: The `state_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

41. Change `Term end_date` to nullable
- **Original**: The `end_date` field in `Term` was `not nullable`.
- **Updated**: The `end_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

42. Change `Term name` to nullable
- **Original**: The `name` field in `Term` was `not nullable`.
- **Updated**: The `name` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

43. Change `Term start_date` to nullable
- **Original**: The `start_date` field in `Term` was `not nullable`.
- **Updated**: The `start_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

44. Change `Student gender` to nullable
- **Original**: The `gender` field in `Student` was `not nullable`.
- **Updated**: The `gender` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

45. Change `Student frl_status` to nullable
- **Original**: The `frl_status` field in `Student` was `not nullable`.
- **Updated**: The `frl_status` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

46. Change `Student gifted_status` to nullable
- **Original**: The `gifted_status` field in `Student` was `not nullable`.
- **Updated**: The `gifted_status` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

47. Change `Student ell_status` to nullable
- **Original**: The `ell_status` field in `Student` was `not nullable`.
- **Updated**: The `ell_status` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

48. Change `Student state_id` to nullable
- **Original**: The `state_id` field in `Student` was `not nullable`.
- **Updated**: The `state_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

49. Change `Student iep_status` to nullable
- **Original**: The `iep_status` field in `Student` was `not nullable`.
- **Updated**: The `iep_status` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

50. Change `Student home_language_code` to nullable
- **Original**: The `home_language_code` field in `Student` was `not nullable`.
- **Updated**: The `home_language_code` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

51. Change `Student race` to nullable
- **Original**: The `race` field in `Student` was `not nullable`.
- **Updated**: The `race` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

52. Change `Student graduation_year` to nullable
- **Original**: The `graduation_year` field in `Student` was `not nullable`.
- **Updated**: The `graduation_year` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

53. Change `Student home_language` to nullable
- **Original**: The `home_language` field in `Student` was `not nullable`.
- **Updated**: The `home_language` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

54. Change `Student hispanic_ethnicity` to nullable
- **Original**: The `hispanic_ethnicity` field in `Student` was `not nullable`.
- **Updated**: The `hispanic_ethnicity` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

55. Change `Student section_504_status` to nullable
- **Original**: The `section_504_status` field in `Student` was `not nullable`.
- **Updated**: The `section_504_status` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

56. Change `Student student_number` to nullable
- **Original**: The `student_number` field in `Student` was `not nullable`.
- **Updated**: The `student_number` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

57. Change `Student dob` to nullable
- **Original**: The `dob` field in `Student` was `not nullable`.
- **Updated**: The `dob` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

58. Change `Student grade` to nullable
- **Original**: The `grade` field in `Student` was `not nullable`.
- **Updated**: The `grade` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

59. Change `Student weighted_gpa` to nullable
- **Original**: The `weighted_gpa` field in `Student` was `not nullable`.
- **Updated**: The `weighted_gpa` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

60. Change `Student unweighted_gpa` to nullable
- **Original**: The `unweighted_gpa` field in `Student` was `not nullable`.
- **Updated**: The `unweighted_gpa` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

61. Change `District mdr_number` to nullable
- **Original**: The `mdr_number` field in `District` was `not nullable`.
- **Updated**: The `mdr_number` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

62. Change `District last_sync` to nullable
- **Original**: The `last_sync` field in `District` was `not nullable`.
- **Updated**: The `last_sync` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

63. Change `District pause_end` to nullable
- **Original**: The `pause_end` field in `District` was `not nullable`.
- **Updated**: The `pause_end` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

64. Change `District last_attendance_sync` to nullable
- **Original**: The `last_attendance_sync` field in `District` was `not nullable`.
- **Updated**: The `last_attendance_sync` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

65. Change `District lms_type` to nullable
- **Original**: The `lms_type` field in `District` was `not nullable`.
- **Updated**: The `lms_type` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

66. Change `District nces_id` to nullable
- **Original**: The `nces_id` field in `District` was `not nullable`.
- **Updated**: The `nces_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

67. Change `District pause_start` to nullable
- **Original**: The `pause_start` field in `District` was `not nullable`.
- **Updated**: The `pause_start` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

68. Change `District lms_state` to nullable
- **Original**: The `lms_state` field in `District` was `not nullable`.
- **Updated**: The `lms_state` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

69. Change `District state` to nullable
- **Original**: The `state` field in `District` was `not nullable`.
- **Updated**: The `state` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

70. Change `User email` to nullable
- **Original**: The `email` field in `User` was `not nullable`.
- **Updated**: The `email` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

71. Change `Disability disability_type` to nullable
- **Original**: The `disability_type` field in `Disability` was `not nullable`.
- **Updated**: The `disability_type` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

72. Change `Disability disability_status` to nullable
- **Original**: The `disability_status` field in `Disability` was `not nullable`.
- **Updated**: The `disability_status` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

73. Change `Disability disability_code` to nullable
- **Original**: The `disability_code` field in `Disability` was `not nullable`.
- **Updated**: The `disability_code` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

74. Change `School mdr_number` to nullable
- **Original**: The `mdr_number` field in `School` was `not nullable`.
- **Updated**: The `mdr_number` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

75. Change `School low_grade` to nullable
- **Original**: The `low_grade` field in `School` was `not nullable`.
- **Updated**: The `low_grade` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

76. Change `School nces_id` to nullable
- **Original**: The `nces_id` field in `School` was `not nullable`.
- **Updated**: The `nces_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

77. Change `School phone` to nullable
- **Original**: The `phone` field in `School` was `not nullable`.
- **Updated**: The `phone` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

78. Change `School state_id` to nullable
- **Original**: The `state_id` field in `School` was `not nullable`.
- **Updated**: The `state_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

79. Change `School high_grade` to nullable
- **Original**: The `high_grade` field in `School` was `not nullable`.
- **Updated**: The `high_grade` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

80. Change `PreferredName middle` to nullable
- **Original**: The `middle` field in `PreferredName` was `not nullable`.
- **Updated**: The `middle` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

81. Change `PreferredName last` to nullable
- **Original**: The `last` field in `PreferredName` was `not nullable`.
- **Updated**: The `last` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

82. Change `PreferredName first` to nullable
- **Original**: The `first` field in `PreferredName` was `not nullable`.
- **Updated**: The `first` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

83. Change `Submission created` to nullable
- **Original**: The `created` field in `Submission` was `not nullable`.
- **Updated**: The `created` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

84. Change `Submission grader_id` to nullable
- **Original**: The `grader_id` field in `Submission` was `not nullable`.
- **Updated**: The `grader_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

85. Change `Submission grade` to nullable
- **Original**: The `grade` field in `Submission` was `not nullable`.
- **Updated**: The `grade` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

86. Change `Submission grade_comment` to nullable
- **Original**: The `grade_comment` field in `Submission` was `not nullable`.
- **Updated**: The `grade_comment` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

87. Change `Submission override_due_date` to nullable
- **Original**: The `override_due_date` field in `Submission` was `not nullable`.
- **Updated**: The `override_due_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

88. Change `Submission last_modified` to nullable
- **Original**: The `last_modified` field in `Submission` was `not nullable`.
- **Updated**: The `last_modified` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

89. Change `AssignmentRequest end_date` to nullable
- **Original**: The `end_date` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `end_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

90. Change `AssignmentRequest due_date` to nullable
- **Original**: The `due_date` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `due_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

91. Change `AssignmentRequest description` to nullable
- **Original**: The `description` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `description` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

92. Change `AssignmentRequest term_id` to nullable
- **Original**: The `term_id` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `term_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

93. Change `AssignmentRequest title` to nullable
- **Original**: The `title` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `title` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

94. Change `AssignmentRequest display_date` to nullable
- **Original**: The `display_date` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `display_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

95. Change `AssignmentRequest points_possible` to nullable
- **Original**: The `points_possible` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `points_possible` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

96. Change `AssignmentRequest description_plaintext` to nullable
- **Original**: The `description_plaintext` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `description_plaintext` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

97. Change `AssignmentRequest start_date` to nullable
- **Original**: The `start_date` field in `AssignmentRequest` was `not nullable`.
- **Updated**: The `start_date` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

98. Change `Section period` to nullable
- **Original**: The `period` field in `Section` was `not nullable`.
- **Updated**: The `period` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

99. Change `Section subject` to nullable
- **Original**: The `subject` field in `Section` was `not nullable`.
- **Updated**: The `subject` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

100. Change `Section term_id` to nullable
- **Original**: The `term_id` field in `Section` was `not nullable`.
- **Updated**: The `term_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

101. Change `Section teacher` to nullable
- **Original**: The `teacher` field in `Section` was `not nullable`.
- **Updated**: The `teacher` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

102. Change `Section grade` to nullable
- **Original**: The `grade` field in `Section` was `not nullable`.
- **Updated**: The `grade` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

103. Change `Section course` to nullable
- **Original**: The `course` field in `Section` was `not nullable`.
- **Updated**: The `course` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

104. Change `Section section_number` to nullable
- **Original**: The `section_number` field in `Section` was `not nullable`.
- **Updated**: The `section_number` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

105. Change `Contact phone_type` to nullable
- **Original**: The `phone_type` field in `Contact` was `not nullable`.
- **Updated**: The `phone_type` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

106. Change `Contact phone` to nullable
- **Original**: The `phone` field in `Contact` was `not nullable`.
- **Updated**: The `phone` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

107. Change `Contact sis_id` to nullable
- **Original**: The `sis_id` field in `Contact` was `not nullable`.
- **Updated**: The `sis_id` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

108. Change `Principal name` to nullable
- **Original**: The `name` field in `Principal` was `not nullable`.
- **Updated**: The `name` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

109. Change `Principal email` to nullable
- **Original**: The `email` field in `Principal` was `not nullable`.
- **Updated**: The `email` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

110. Change `Location zip` to nullable
- **Original**: The `zip` field in `Location` was `not nullable`.
- **Updated**: The `zip` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

111. Change `Location address` to nullable
- **Original**: The `address` field in `Location` was `not nullable`.
- **Updated**: The `address` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

112. Change `Location city` to nullable
- **Original**: The `city` field in `Location` was `not nullable`.
- **Updated**: The `city` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

113. Change `Location lon` to nullable
- **Original**: The `lon` field in `Location` was `not nullable`.
- **Updated**: The `lon` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

114. Change `Location state` to nullable
- **Original**: The `state` field in `Location` was `not nullable`.
- **Updated**: The `state` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

115. Change `Location lat` to nullable
- **Original**: The `lat` field in `Location` was `not nullable`.
- **Updated**: The `lat` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

116. Rewrite `info.description`
- **Original**: `Serves the Clever Data API`
- **Updated**: A short plain-text summary of what the API offers (roster data, assignments and submissions).
- **Reason**: The description becomes the `Client` class documentation, and the original only repeated the API name. Changed in the original spec `docs/spec/openapi.yaml`.

117. Declare `application/json` as the request media type
- **Original**: The Swagger 2.0 document declares no `consumes`, so the three request bodies (create assignment, update assignment, update submission) resolved to `*/*` and generated as `http:Request`.
- **Updated**: A global `consumes: [application/json]` is added, so the bodies bind to `AssignmentRequest` and `SubmissionRequest`.
- **Reason**: The API accepts JSON bodies only. Changed in the original spec `docs/spec/openapi.yaml`.

118. Add descriptions to path and query parameters
- **Original**: The path parameters (`id`, `section_id`, `assignment_id`, `user_id`, `school_id`) and the query parameters (`limit`, `starting_after`, `ending_before`, `role`, `primary`, `school`, `record_type`, `date_range_start`, `date_range_end`, `attendance_status`, `cursor`) had no description.
- **Updated**: Each parameter has a description based on the Clever Data API (cursor pagination, filters, entity IDs).
- **Reason**: Undocumented parameters produce `undocumented parameter` and `undocumented field` warnings in the generated client. Changed in the original spec `docs/spec/openapi.yaml`.

119. Add descriptions to the `rel` and `uri` link properties
- **Original**: The `rel` and `uri` properties of the link schemas and the `uri` property of the response schemas had no description.
- **Updated**: Descriptions explain the link relation (`next`, `prev`, `self`) and the relative URI.
- **Reason**: Undocumented properties produce `undocumented field` warnings. Changed in the original spec `docs/spec/openapi.yaml`.

120. Add operation summaries
- **Original**: 49 operations had a `description` but no `summary`.
- **Updated**: Each of them has a short, distinct summary.
- **Reason**: Gives every client method a one-line summary. Changed in the original spec `docs/spec/openapi.yaml`.

121. Keep only the `bearerAuth` API key security scheme
- **Original**: `securityDefinitions` also defined the `oauth` (access code) and `oauthDistrict` (application) OAuth 2.0 flows, and the `bearerAuth` description pointed at them.
- **Updated**: Only `bearerAuth` (API key, `Authorization` header) remains, and its description tells the reader to pass the value as `Bearer <token>`.
- **Reason**: The connector authenticates with the API key header only. Changed in the original spec `docs/spec/openapi.yaml`.

122. Change `bearerAuth` to an HTTP bearer security scheme
- **Original**: `bearerAuth` is an `apiKey` scheme (`Authorization` header), the only form Swagger 2.0 can express.
- **Updated**: `components.securitySchemes.bearerAuth` is `{type: http, scheme: bearer}` with a plain-text description, so the token is supplied as `http:BearerTokenConfig` in `ConnectionConfig.auth`.
- **Reason**: Swagger 2.0 has no bearer scheme type. This is a hand edit to the aligned spec (`docs/spec/aligned_ballerina_openapi.json` and its `.yaml` copy) made after generation, and it must be re-applied after a re-align.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json -o ballerina --mode client --client-methods remote --license docs/license.txt
```

Note: The license year is hardcoded to 2026, change if necessary.
