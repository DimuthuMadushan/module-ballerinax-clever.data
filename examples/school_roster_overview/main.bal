// Lists every school in the district together with the sections taught at each school.

import ballerina/io;
import ballerinax/clever.data;

configurable string token = ?;
configurable int pageSize = 50;

public function main() returns error? {
    data:Client clever = check new ({auth: {token}});

    data:DistrictsResponse districts = check clever->getDistricts();
    foreach data:DistrictResponse entry in districts.data ?: [] {
        io:println("District: ", entry.data?.name);
    }

    string? lastSchoolId = ();
    int schoolCount = 0;
    while true {
        data:GetSchoolsQueries schoolQuery = {'limit: pageSize};
        if lastSchoolId is string {
            schoolQuery.startingAfter = lastSchoolId;
        }
        data:SchoolsResponse schools = check clever->getSchools(queries = schoolQuery);
        data:SchoolResponse[] page = schools.data ?: [];
        foreach data:SchoolResponse schoolEntry in page {
            string? schoolId = schoolEntry.data?.id;
            if schoolId is () {
                continue;
            }
            schoolCount += 1;
            int sectionCount = check countSections(clever, schoolId);
            io:println(schoolEntry.data?.name, ": ", sectionCount, " section(s)");
            lastSchoolId = schoolId;
        }
        if page.length() < pageSize {
            break;
        }
    }
    io:println("Schools processed: ", schoolCount);
}

// Counts the sections of a school across every page of the paginated sections list.
function countSections(data:Client clever, string schoolId) returns int|error {
    string? lastSectionId = ();
    int total = 0;
    while true {
        data:GetSectionsForSchoolQueries sectionQuery = {'limit: pageSize};
        if lastSectionId is string {
            sectionQuery.startingAfter = lastSectionId;
        }
        data:SectionsResponse sections = check clever->getSectionsForSchool(schoolId, queries = sectionQuery);
        data:SectionResponse[] page = sections.data ?: [];
        total += page.length();
        if page.length() < pageSize {
            return total;
        }
        string? id = page[page.length() - 1].data?.id;
        if id is () {
            return total;
        }
        lastSectionId = id;
    }
}
