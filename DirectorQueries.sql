USE `Singer-Sargent-Archive`;

-- Story 1
SELECT contactFirstName, contactLastName, amount, reason
FROM MonetaryDonation
         JOIN `Singer-Sargent-Archive`.Donors D ON MonetaryDonation.donorID = D.donorID
GROUP BY d.donorID;

-- Story 2
-- Note: Is there ever a case where there is a donor in the system
-- without them having donated anything yet?
-- If not, then this can just be `FROM Donors`
SELECT contactFirstName, contactLastName, email
FROM Donors
         JOIN `Singer-Sargent-Archive`.MonetaryDonation MD ON Donors.donorID = MD.donorID
         LEFT JOIN `Singer-Sargent-Archive`.ArtifactRequest AR ON Donors.donorID = AR.loaningDonorID
GROUP BY Donors.donorID
HAVING COUNT(*) > 0;

-- Story 2 (show individual donations, not just who has donated)
SELECT contactFirstName, contactLastName, email
FROM Donors
         JOIN `Singer-Sargent-Archive`.MonetaryDonation MD ON Donors.donorID = MD.donorID
         LEFT JOIN `Singer-Sargent-Archive`.ArtifactRequest AR ON Donors.donorID = AR.loaningDonorID
ORDER BY Donors.donorID;

-- Story 3 (Top doners, monetary)
SELECT contactFirstName, contactLastName, email, SUM(MD.amount) AS total_donations
FROM Donors
         JOIN `Singer-Sargent-Archive`.MonetaryDonation MD ON Donors.donorID = MD.donorID
GROUP BY Donors.donorID
ORDER BY total_donations DESC
LIMIT 50;

-- Story 3.2 (Top doners/lenders, artifacts)
SELECT contactFirstName, contactLastName, email, COUNT(*) AS pieces_donated
FROM Donors
         JOIN `Singer-Sargent-Archive`.ArtifactRequest AR ON Donors.donorID = AR.loaningDonorID
GROUP BY Donors.donorID
ORDER BY pieces_donated DESC
LIMIT 25;
-- Limit would be able to set by the user, of course

-- Story 4 (Managing artifact condition and loans)
SELECT name, artifactCondition, loanDateEnd, loaningDonorID
FROM Artifact
         LEFT JOIN ArtifactRequestRelations ON Artifact.artifactID = ArtifactRequestRelations.artifactID
         LEFT JOIN `Singer-Sargent-Archive`.ArtifactRequest AR ON ArtifactRequestRelations.requestID = AR.requestID
ORDER BY displayedInExhibitID;

-- Story 5 (Request logs)
-- Can add a where clause to find a sepecific piece
SELECT Artifact.name, branchName, wing, Galleries.name, Exhibits.name, loanDateEnd
FROM ArtifactRequest
         JOIN Exhibits ON ArtifactRequest.exhibitID = Exhibits.exhibitID
         JOIN ArtifactRequestRelations ON ArtifactRequest.requestID = ArtifactRequestRelations.requestID
         JOIN Artifact ON ArtifactRequestRelations.artifactID = Artifact.artifactID
         JOIN Galleries ON Exhibits.galleryID = Galleries.galleryID
         JOIN MuseumBranch ON Galleries.branchID = MuseumBranch.branchID
ORDER BY loanDateEnd;

-- Story 6
SELECT Artifact.name,
       loanDateEnd,
       Donors.contactFirstName,
       Donors.contactLastName,
       Donors.email,
       Donors.organizationName,
       Donors.street,
       Donors.city,
       Donors.state,
       Donors.zip
FROM ArtifactRequest
         JOIN ArtifactRequestRelations ON ArtifactRequest.requestID = ArtifactRequestRelations.requestID
         JOIN Artifact ON ArtifactRequestRelations.artifactID = Artifact.artifactID
         JOIN Donors ON ArtifactRequest.loaningDonorID = Donors.donorID
WHERE NOW() BETWEEN loanDateStart AND loanDateEnd
   OR status = 'ongoing' -- Also include "overdue" loans
ORDER BY loanDateEnd;

-- Story 7 (Create/view expansion projects, add galleries on project completion)
-- Story 7.1 (Status of galleries)
SELECT branchName, wing, artworkCapacity, Galleries.name AS GalleryName, isInUse
FROM Galleries
         JOIN MuseumBranch ON Galleries.branchID = MuseumBranch.branchID
ORDER BY branchName, wing;

-- Story 7.2 (Update status of galleries)
UPDATE Galleries
SET isInUse = TRUE
WHERE galleryID = 472;

-- Story 7.2 (View active expansion projects)
SELECT MuseumBranch.branchName,
       description,
       status,
       costDollarAmount,
       ExpansionProject.contactName,
       ExpansionProject.contactEmail,
       ExpansionProject.contactPhone
FROM ExpansionProject
         JOIN MuseumBranch ON ExpansionProject.headedByBranchID = MuseumBranch.branchID
ORDER BY headedByBranchID;

-- Story 7.3 (Create expansion project; Get information from the API)
INSERT INTO ExpansionProject
VALUES (100022, 432110, 'Upgrading the courtyard''s paths and planting some more landscaping (again)', 'pending',
        20000, 'Jenny Hofstadter', '(433)-958-9849', 'jenny.h.landscaping@gmail.com');

-- Story 7.4 (Change status of expansion project)
UPDATE ExpansionProject
SET status = 'approved'
WHERE projectID = 100022;

-- Story 7.5 (Add gallery, perhaps after an expansion project is completed)
INSERT INTO Galleries
VALUES (314, 482743, FALSE, 'The R. E. Carnegie Gallery', 'Global Modern Art', 15);