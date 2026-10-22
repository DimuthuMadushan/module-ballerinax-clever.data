// Creates an assignment in a section, publishes it and reviews the student submissions.

import ballerina/io;
import ballerinax/clever.data;

configurable string token = ?;
configurable string sectionId = ?;
configurable string assignmentTitle = ?;
configurable string dueDate = ?;
configurable boolean applyGrades = false;
configurable string termId = "";
configurable float gradePoints = 100.0;

public function main() returns error? {
    data:Client clever = check new ({auth: {token}});

    data:AssignmentResponse created = check clever->createAssignmentForSection(sectionId, {
        title: assignmentTitle,
        description: "Created from the Clever Data connector example",
        dueDate,
        pointsPossible: 100.0,
        submissionTypes: ["link", "file"],
        termId: termId == "" ? () : termId
    });
    string? assignmentId = created.data?.id;
    if assignmentId is () {
        return error("The created assignment has no id");
    }
    io:println("Created assignment: ", assignmentId);

    data:AssignmentResponse published = check clever->updateAssignmentForSection(sectionId, assignmentId, {
        title: assignmentTitle
    });
    io:println("Assignment state: ", published.data?.state);

    string? cursor = ();
    int reviewed = 0;
    while true {
        data:GetSubmissionsForAssignmentQueries submissionQuery = {'limit: 100};
        if cursor is string {
            submissionQuery.cursor = cursor;
        }
        data:SubmissionsResponse submissions = check clever->getSubmissionsForAssignment(
                sectionId, assignmentId, queries = submissionQuery);
        data:Submission[] page = submissions.data ?: [];
        foreach data:Submission submission in page {
            reviewed += 1;
            string? userId = submission.userId;
            if applyGrades && userId is string {
                data:SubmissionResponse graded = check clever->updateSubmissionForAssignment(
                        sectionId, assignmentId, userId, {gradePoints});
                io:println("Graded ", userId, ": ", graded.data?.gradePoints);
            }
        }
        cursor = nextCursor(submissions.links ?: []);
        if cursor is () {
            break;
        }
    }
    io:println("Submissions reviewed: ", reviewed);
}

// Extracts the cursor query value from the "next" link of a submissions page.
function nextCursor(data:SubmissionsLink[] links) returns string? {
    foreach data:SubmissionsLink link in links {
        string? uri = link.uri;
        if link.rel == "next" && uri is string {
            int? pos = uri.indexOf("cursor=");
            if pos is int {
                string tail = uri.substring(pos + 7);
                int? end = tail.indexOf("&");
                return end is int ? tail.substring(0, end) : tail;
            }
        }
    }
    return ();
}
