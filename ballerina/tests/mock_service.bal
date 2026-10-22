// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

listener http:Listener ep0 = new (9090);

service / on ep0 {
    # Deletes an existing assignment in the specified section
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    resource function delete sections/[string sectionId]/assignments/[string assignmentId]() returns http:Ok|UnauthorizedUnauthorized|NotFoundNotFound {
        return http:OK;
    }

    # Returns a list of attendance records for a school
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get attendance/schools/[string schoolId](@http:Query {name: "date_range_start"} string? dateRangeStart, @http:Query {name: "date_range_end"} string? dateRangeEnd, @http:Query {name: "attendance_status"} "present"|"absent"|"tardy"? attendanceStatus, int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore) returns AttendanceResponse|BadRequestBadRequest|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        AttendanceResponse resp = {data: [{studentId: "5fc2d5ab2d9f3c0001a1b311", schoolId: "5fc2d5ab2d9f3c0001a1b2d1", sectionId: "5fc2d5ab2d9f3c0001a1b2e1", districtId: "5fc2d5ab2d9f3c0001a1b2c0", attendanceDate: "2026-09-03", sisId: "ATT-1", created: "2026-09-03T08:00:00.000Z", lastModified: "2026-09-03T08:00:00.000Z"}], links: [{rel: "self", uri: "/v3.1/attendance"}]};
        return resp;
    }

    # Returns a list of courses
    #
    # + count - If "true", returns a CountResponse ({count, links})
    # instead of the normal list response
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:InternalServerError (Internal Error)
    resource function get courses(int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore, ""|"true"|"false"|"undefined"? count) returns CoursesResponse|BadRequestBadRequest|UnauthorizedUnauthorized|InternalErrorInternalServerError {
        CoursesResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b2c3", district: "5fc2d5ab2d9f3c0001a1b2c0", name: "Algebra I", number: "MATH101"}}], links: [{rel: "self", uri: "/v3.1/courses"}]};
        return resp;
    }

    # Returns a specific course
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get courses/[string id]() returns CourseResponse|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        CourseResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b2c3", district: "5fc2d5ab2d9f3c0001a1b2c0", name: "Algebra I", number: "MATH101"}, uri: "/v3.1/courses/1", links: [{rel: "self", uri: "/v3.1/courses/1"}]};
        return resp;
    }

    # Returns a list of districts. In practice this will only return the one district associated with the bearer token
    #
    # + count - If "true", returns a CountResponse ({count, links})
    # instead of the normal list response
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:InternalServerError (Internal Error)
    resource function get districts(""|"true"|"false"|"undefined"? count) returns DistrictsResponse|BadRequestBadRequest|UnauthorizedUnauthorized|InternalErrorInternalServerError {
        DistrictsResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b2c0", name: "Sunrise Unified School District", portalUrl: "https://sunrise.clever.com", sisType: "csv", loginMethods: ["clever_password"], state: "success", lastSync: "2026-09-01T06:00:00.000Z", launchDate: "2024-08-15T00:00:00.000Z"}}], links: [{rel: "self", uri: "/v3.1/districts"}]};
        return resp;
    }

    # Returns a specific district
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get districts/[string id]() returns DistrictResponse|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        DistrictResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b2c0", name: "Sunrise Unified School District", portalUrl: "https://sunrise.clever.com", sisType: "csv", loginMethods: ["clever_password"], state: "success", lastSync: "2026-09-01T06:00:00.000Z", launchDate: "2024-08-15T00:00:00.000Z"}, uri: "/v3.1/districts/1", links: [{rel: "self", uri: "/v3.1/districts/1"}]};
        return resp;
    }

    # Returns a list of events
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:NotFound (Entity Not Found)
    resource function get events(int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore, string? school, @http:Query {name: "record_type"} string[]? recordType) returns EventsResponse|NotFoundNotFound {
        EventsResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b401", created: "2026-09-02T12:00:00.000Z", 'type: "users.updated"}}], links: [{rel: "self", uri: "/v3.1/events"}]};
        return resp;
    }

    # Returns the specific event
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:NotFound (Entity Not Found)
    resource function get events/[string id]() returns EventResponse|NotFoundNotFound {
        EventResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b401", created: "2026-09-02T12:00:00.000Z", 'type: "users.updated"}};
        return resp;
    }

    # Returns a list of resources
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:InternalServerError (Internal Error)
    resource function get resources(int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore) returns ResourcesResponse|BadRequestBadRequest|UnauthorizedUnauthorized|InternalErrorInternalServerError {
        ResourcesResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b501", resourceId: "res-100", title: "Geometry Workbook", district: "5fc2d5ab2d9f3c0001a1b2c0", created: "2025-01-10T10:00:00.000Z", updated: "2026-03-01T10:00:00.000Z"}}], links: [{rel: "self", uri: "/v3.1/resources"}]};
        return resp;
    }

    # Returns a list of schools
    #
    # + count - If "true", returns a CountResponse ({count, links})
    # instead of the normal list response
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:InternalServerError (Internal Error)
    resource function get schools(int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore, ""|"true"|"false"|"undefined"? count) returns SchoolsResponse|BadRequestBadRequest|UnauthorizedUnauthorized|InternalErrorInternalServerError {
        SchoolsResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b2d1", district: "5fc2d5ab2d9f3c0001a1b2c0", name: "Lincoln High School", schoolNumber: "042", sisId: "S-042", phone: "555-0100", created: "2024-01-10T10:00:00.000Z", lastModified: "2026-08-20T10:00:00.000Z", location: {address: "100 Main St", city: "Springfield", state: "IL", zip: "62701"}}}], links: [{rel: "self", uri: "/v3.1/schools"}]};
        return resp;
    }

    # Returns a specific school
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get schools/[string id]() returns SchoolResponse|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        SchoolResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b2d1", district: "5fc2d5ab2d9f3c0001a1b2c0", name: "Lincoln High School", schoolNumber: "042", sisId: "S-042", phone: "555-0100", created: "2024-01-10T10:00:00.000Z", lastModified: "2026-08-20T10:00:00.000Z", location: {address: "100 Main St", city: "Springfield", state: "IL", zip: "62701"}}, uri: "/v3.1/schools/1", links: [{rel: "self", uri: "/v3.1/schools/1"}]};
        return resp;
    }

    # Returns the sections for a school
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get schools/[string id]/sections(int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore) returns SectionsResponse|BadRequestBadRequest|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        SectionsResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b2e1", district: "5fc2d5ab2d9f3c0001a1b2c0", school: "5fc2d5ab2d9f3c0001a1b2d1", name: "Algebra I - Period 2", sisId: "SEC-2201", course: "5fc2d5ab2d9f3c0001a1b2c3", termId: "5fc2d5ab2d9f3c0001a1b2f1", teacher: "5fc2d5ab2d9f3c0001a1b301", teachers: ["5fc2d5ab2d9f3c0001a1b301"], students: ["5fc2d5ab2d9f3c0001a1b311", "5fc2d5ab2d9f3c0001a1b312"], period: "2", created: "2024-01-10T10:00:00.000Z", lastModified: "2026-08-20T10:00:00.000Z"}}], links: [{rel: "self", uri: "/v3.1/schools/1/sections"}]};
        return resp;
    }

    # Returns a list of sections
    #
    # + count - If "true", returns a CountResponse ({count, links})
    # instead of the normal list response
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:InternalServerError (Internal Error)
    resource function get sections(int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore, ""|"true"|"false"|"undefined"? count) returns SectionsResponse|BadRequestBadRequest|UnauthorizedUnauthorized|InternalErrorInternalServerError {
        SectionsResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b2e1", district: "5fc2d5ab2d9f3c0001a1b2c0", school: "5fc2d5ab2d9f3c0001a1b2d1", name: "Algebra I - Period 2", sisId: "SEC-2201", course: "5fc2d5ab2d9f3c0001a1b2c3", termId: "5fc2d5ab2d9f3c0001a1b2f1", teacher: "5fc2d5ab2d9f3c0001a1b301", teachers: ["5fc2d5ab2d9f3c0001a1b301"], students: ["5fc2d5ab2d9f3c0001a1b311", "5fc2d5ab2d9f3c0001a1b312"], period: "2", created: "2024-01-10T10:00:00.000Z", lastModified: "2026-08-20T10:00:00.000Z"}}], links: [{rel: "self", uri: "/v3.1/sections"}]};
        return resp;
    }

    # Returns a specific section
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get sections/[string id]() returns SectionResponse|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        SectionResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b2e1", district: "5fc2d5ab2d9f3c0001a1b2c0", school: "5fc2d5ab2d9f3c0001a1b2d1", name: "Algebra I - Period 2", sisId: "SEC-2201", course: "5fc2d5ab2d9f3c0001a1b2c3", termId: "5fc2d5ab2d9f3c0001a1b2f1", teacher: "5fc2d5ab2d9f3c0001a1b301", teachers: ["5fc2d5ab2d9f3c0001a1b301"], students: ["5fc2d5ab2d9f3c0001a1b311", "5fc2d5ab2d9f3c0001a1b312"], period: "2", created: "2024-01-10T10:00:00.000Z", lastModified: "2026-08-20T10:00:00.000Z"}, uri: "/v3.1/sections/1", links: [{rel: "self", uri: "/v3.1/sections/1"}]};
        return resp;
    }

    # Returns a specific assignment for a section
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    resource function get sections/[string sectionId]/assignments/[string assignmentId]() returns AssignmentResponse|UnauthorizedUnauthorized|NotFoundNotFound {
        AssignmentResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b601", title: "Chapter 3 Homework", description: "Complete exercises 1 to 20", pointsPossible: 20.0, maxAttempts: 1, dueDate: "2026-09-30T23:59:00.000Z", created: "2026-09-01T10:00:00.000Z", lastModified: "2026-09-01T10:00:00.000Z"}};
        return resp;
    }

    # Returns the submissions for an assignment.
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    resource function get sections/[string sectionId]/assignments/[string assignmentId]/submissions(string? cursor, int? 'limit) returns SubmissionsResponse|UnauthorizedUnauthorized|NotFoundNotFound {
        SubmissionsResponse resp = {data: [{id: "5fc2d5ab2d9f3c0001a1b701", assignmentId: "5fc2d5ab2d9f3c0001a1b601", userId: "5fc2d5ab2d9f3c0001a1b311", grade: "18", gradeComment: "Well done", gradePoints: 18.0, created: "2026-09-10T10:00:00.000Z", lastModified: "2026-09-12T10:00:00.000Z"}]};
        return resp;
    }

    # Returns a specific user's submission for an assignment.
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    resource function get sections/[string sectionId]/assignments/[string assignmentId]/submissions/[string userId]() returns SubmissionResponse|UnauthorizedUnauthorized|NotFoundNotFound {
        SubmissionResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b701", assignmentId: "5fc2d5ab2d9f3c0001a1b601", userId: "5fc2d5ab2d9f3c0001a1b311", grade: "18", gradeComment: "Well done", gradePoints: 18.0, created: "2026-09-10T10:00:00.000Z", lastModified: "2026-09-12T10:00:00.000Z"}};
        return resp;
    }

    # Returns a list of terms
    #
    # + count - If "true", returns a CountResponse ({count, links})
    # instead of the normal list response
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:InternalServerError (Internal Error)
    resource function get terms(int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore, ""|"true"|"false"|"undefined"? count) returns TermsResponse|BadRequestBadRequest|UnauthorizedUnauthorized|InternalErrorInternalServerError {
        TermsResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b2f1", district: "5fc2d5ab2d9f3c0001a1b2c0", name: "Fall 2026", startDate: "2026-08-20", endDate: "2026-12-18"}}], links: [{rel: "self", uri: "/v3.1/terms"}]};
        return resp;
    }

    # Returns a specific term
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get terms/[string id]() returns TermResponse|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        TermResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b2f1", district: "5fc2d5ab2d9f3c0001a1b2c0", name: "Fall 2026", startDate: "2026-08-20", endDate: "2026-12-18"}, uri: "/v3.1/terms/1", links: [{rel: "self", uri: "/v3.1/terms/1"}]};
        return resp;
    }

    # Returns a list of contact, district admin, staff, student, and/or teacher users
    #
    # + count - If "true", returns a CountResponse ({count, links})
    # instead of the normal list response
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:InternalServerError (Internal Error)
    resource function get users(int? 'limit, "contact"|"district_admin"|"staff"|"student"|"teacher"? role, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore, ""|"true"|"false"|"undefined"? count) returns UsersResponse|BadRequestBadRequest|UnauthorizedUnauthorized|InternalErrorInternalServerError {
        UsersResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b311", district: "5fc2d5ab2d9f3c0001a1b2c0", name: {first: "Maria", last: "Garcia"}, email: "maria.garcia@sunrise.example.org", created: "2024-01-10T10:00:00.000Z", lastModified: "2026-08-20T10:00:00.000Z"}}], links: [{rel: "self", uri: "/v3.1/users"}]};
        return resp;
    }

    # Returns a specific user
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get users/[string id]() returns UserResponse|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        UserResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b311", district: "5fc2d5ab2d9f3c0001a1b2c0", name: {first: "Maria", last: "Garcia"}, email: "maria.garcia@sunrise.example.org", created: "2024-01-10T10:00:00.000Z", lastModified: "2026-08-20T10:00:00.000Z"}, uri: "/v3.1/users/1", links: [{rel: "self", uri: "/v3.1/users/1"}]};
        return resp;
    }

    # Returns the student users for a teacher or contact user
    #
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:InternalServerError (Internal Error)
    resource function get users/[string id]/mystudents(int? 'limit, @http:Query {name: "starting_after"} string? startingAfter, @http:Query {name: "ending_before"} string? endingBefore) returns UsersResponse|BadRequestBadRequest|UnauthorizedUnauthorized|NotFoundNotFound|InternalErrorInternalServerError {
        UsersResponse resp = {data: [{data: {id: "5fc2d5ab2d9f3c0001a1b311", district: "5fc2d5ab2d9f3c0001a1b2c0", name: {first: "Maria", last: "Garcia"}, email: "maria.garcia@sunrise.example.org", created: "2024-01-10T10:00:00.000Z", lastModified: "2026-08-20T10:00:00.000Z"}}], links: [{rel: "self", uri: "/v3.1/users/1/mystudents"}]};
        return resp;
    }

    # Updates an existing assignment in the specified section
    #
    # + payload - Assignment fields to update 
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:BadRequest (Bad Request)
    # http:InternalServerError (Internal Error)
    resource function patch sections/[string sectionId]/assignments/[string assignmentId](@http:Payload AssignmentRequest payload) returns AssignmentResponse|UnauthorizedUnauthorized|NotFoundNotFound|BadRequestBadRequest|InternalErrorInternalServerError {
        AssignmentResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b601", title: "Chapter 3 Homework", description: "Complete exercises 1 to 20", pointsPossible: 20.0, maxAttempts: 1, dueDate: "2026-09-30T23:59:00.000Z", created: "2026-09-01T10:00:00.000Z", lastModified: "2026-09-01T10:00:00.000Z"}};
        return resp;
    }

    # Updates an existing submission in the specified assignment for a user.
    #
    # + payload - Submission fields to update, such as grade or comments 
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:Unauthorized (Not authorized)
    # http:NotFound (Entity Not Found)
    # http:BadRequest (Bad Request)
    # http:InternalServerError (Internal Error)
    resource function patch sections/[string sectionId]/assignments/[string assignmentId]/submissions/[string userId](@http:Payload SubmissionRequest payload) returns SubmissionResponse|UnauthorizedUnauthorized|NotFoundNotFound|BadRequestBadRequest|InternalErrorInternalServerError {
        SubmissionResponse resp = {data: {id: "5fc2d5ab2d9f3c0001a1b701", assignmentId: "5fc2d5ab2d9f3c0001a1b601", userId: "5fc2d5ab2d9f3c0001a1b311", grade: "18", gradeComment: "Well done", gradePoints: 18.0, created: "2026-09-10T10:00:00.000Z", lastModified: "2026-09-12T10:00:00.000Z"}};
        return resp;
    }

    # Creates a new assignment in the specified section
    #
    # + payload - Assignment details to create in the section 
    # + return - returns can be any of following types 
    # http:Ok (OK Response)
    # http:BadRequest (Bad Request)
    # http:Unauthorized (Not authorized)
    resource function post sections/[string sectionId]/assignments(@http:Payload AssignmentRequest payload) returns AssignmentResponseOk|BadRequestBadRequest|UnauthorizedUnauthorized {
        AssignmentResponseOk resp = {body: {data: {id: "5fc2d5ab2d9f3c0001a1b601", title: "Chapter 3 Homework", description: "Complete exercises 1 to 20", pointsPossible: 20.0, maxAttempts: 1, dueDate: "2026-09-30T23:59:00.000Z", created: "2026-09-01T10:00:00.000Z", lastModified: "2026-09-01T10:00:00.000Z"}}};
        return resp;
    }
}

// Service-mode response types. `bal openapi --mode client` collapses 4XX/5XX
// to `error` and never emits these, so they are defined here for the mock only.
public type AssignmentResponseOk record {|
    *http:Ok;
    AssignmentResponse body;
|};

public type BadRequestBadRequest record {|
    *http:BadRequest;
    BadRequest body;
|};

public type InternalErrorInternalServerError record {|
    *http:InternalServerError;
    InternalError body;
|};

public type NotFoundNotFound record {|
    *http:NotFound;
    NotFound body;
|};

public type UnauthorizedUnauthorized record {|
    *http:Unauthorized;
    Unauthorized body;
|};

public type BadRequest record {
    string message?;
};

public type InternalError record {
    string message?;
};

public type NotFound record {
    string message?;
};

public type Unauthorized record {
    string message?;
};
