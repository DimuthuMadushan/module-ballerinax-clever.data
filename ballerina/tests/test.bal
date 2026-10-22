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
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.clever.com/v3.1" : "http://localhost:9090";
final string token = isLiveServer ? os:getEnv("CLEVER_TOKEN") : "test_token";
final string schoolId = isLiveServer ? os:getEnv("CLEVER_SCHOOL_ID") : "5fc2d5ab2d9f3c0001a1b2d1";
final string sectionId = isLiveServer ? os:getEnv("CLEVER_SECTION_ID") : "5fc2d5ab2d9f3c0001a1b2e1";
final string userId = isLiveServer ? os:getEnv("CLEVER_USER_ID") : "5fc2d5ab2d9f3c0001a1b311";
final string entityId = "5fc2d5ab2d9f3c0001a1b2c3";
final string courseId = isLiveServer ? os:getEnv("CLEVER_COURSE_ID") : entityId;
final string districtId = isLiveServer ? os:getEnv("CLEVER_DISTRICT_ID") : entityId;
final string termId = isLiveServer ? os:getEnv("CLEVER_TERM_ID") : entityId;
final string eventId = isLiveServer ? os:getEnv("CLEVER_EVENT_ID") : entityId;

// ID of the assignment created by testCreateAssignmentForSection, reused by the dependent tests.
isolated string createdAssignmentId = entityId;

final Client cleverClient = check new ({
    auth: {token},
    httpVersion: http:HTTP_1_1
}, serviceUrl);

isolated function getCreatedAssignmentId() returns string {
    lock {
        return createdAssignmentId;
    }
}

@test:AfterSuite
isolated function deleteCreatedAssignment() returns error? {
    string assignmentId = getCreatedAssignmentId();
    if assignmentId != entityId {
        check cleverClient->deleteAssignmentForSection(sectionId, assignmentId);
    }
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCourses() returns error? {
    CoursesResponse response = check cleverClient->getCourses();
    test:assertTrue(response?.data is CourseResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetCourse() returns error? {
    CourseResponse response = check cleverClient->getCourse(courseId);
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetDistricts() returns error? {
    DistrictsResponse response = check cleverClient->getDistricts();
    test:assertTrue(response?.data is DistrictResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetDistrict() returns error? {
    DistrictResponse response = check cleverClient->getDistrict(districtId);
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetSchools() returns error? {
    SchoolsResponse response = check cleverClient->getSchools();
    test:assertTrue(response?.data is SchoolResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetSchool() returns error? {
    SchoolResponse response = check cleverClient->getSchool(schoolId);
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetSections() returns error? {
    SectionsResponse response = check cleverClient->getSections();
    test:assertTrue(response?.data is SectionResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetSection() returns error? {
    SectionResponse response = check cleverClient->getSection(sectionId);
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetSectionsForSchool() returns error? {
    SectionsResponse response = check cleverClient->getSectionsForSchool(schoolId);
    test:assertTrue(response?.data is SectionResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetStudentsForUser() returns error? {
    UsersResponse response = check cleverClient->getStudentsForUser(userId);
    test:assertTrue(response?.data is UserResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetTerms() returns error? {
    TermsResponse response = check cleverClient->getTerms();
    test:assertTrue(response?.data is TermResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetTerm() returns error? {
    TermResponse response = check cleverClient->getTerm(termId);
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetUsers() returns error? {
    UsersResponse response = check cleverClient->getUsers();
    test:assertTrue(response?.data is UserResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetUser() returns error? {
    UserResponse response = check cleverClient->getUser(userId);
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetResources() returns error? {
    ResourcesResponse response = check cleverClient->getResources();
    test:assertTrue(response?.data is ResourceResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetEvents() returns error? {
    EventsResponse response = check cleverClient->getEvents();
    test:assertTrue(response?.data is EventResponse[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testGetEvent() returns error? {
    EventResponse response = check cleverClient->getEvent(eventId);
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testListAttendanceForSchool() returns error? {
    AttendanceResponse response = check cleverClient->listAttendanceForSchool(schoolId);
    test:assertTrue(response?.data is Attendance[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testCreateAssignmentForSection() returns error? {
    AssignmentResponse response = check cleverClient->createAssignmentForSection(sectionId, {
        title: "Chapter 3 Homework",
        description: "Complete exercises 1 to 20",
        pointsPossible: 20.0
    });
    string? assignmentId = response?.data?.id;
    test:assertTrue(assignmentId is string);
    if assignmentId is string {
        lock {
            createdAssignmentId = assignmentId;
        }
    }
}

@test:Config {groups: ["live_tests", "mock_tests"], dependsOn: [testCreateAssignmentForSection]}
isolated function testGetAssignmentForSection() returns error? {
    AssignmentResponse response = check cleverClient->getAssignmentForSection(sectionId, getCreatedAssignmentId());
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"], dependsOn: [testCreateAssignmentForSection]}
isolated function testUpdateAssignmentForSection() returns error? {
    AssignmentResponse response = check cleverClient->updateAssignmentForSection(sectionId, getCreatedAssignmentId(), {
        title: "Chapter 3 Homework (revised)"
    });
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"]}
isolated function testDeleteAssignmentForSection() returns error? {
    AssignmentResponse created = check cleverClient->createAssignmentForSection(sectionId, {title: "Assignment to delete"});
    string assignmentId = created?.data?.id ?: entityId;
    error? response = cleverClient->deleteAssignmentForSection(sectionId, assignmentId);
    test:assertTrue(response is ());
}

@test:Config {groups: ["live_tests", "mock_tests"], dependsOn: [testCreateAssignmentForSection]}
isolated function testGetSubmissionsForAssignment() returns error? {
    SubmissionsResponse response = check cleverClient->getSubmissionsForAssignment(sectionId, getCreatedAssignmentId());
    test:assertTrue(response?.data is Submission[]);
}

@test:Config {groups: ["live_tests", "mock_tests"], dependsOn: [testCreateAssignmentForSection]}
isolated function testGetSubmissionForAssignment() returns error? {
    SubmissionResponse response = check cleverClient->getSubmissionForAssignment(sectionId, getCreatedAssignmentId(), userId);
    test:assertTrue(response?.data !is ());
}

@test:Config {groups: ["live_tests", "mock_tests"], dependsOn: [testCreateAssignmentForSection]}
isolated function testUpdateSubmissionForAssignment() returns error? {
    SubmissionResponse response = check cleverClient->updateSubmissionForAssignment(sectionId, getCreatedAssignmentId(), userId, {
        grade: "18",
        gradeComment: "Well done"
    });
    test:assertTrue(response?.data !is ());
}
