USE `Singer-Sargent-Archive`;

SELECT ar.name, ar.createdYear, art.firstName, art.lastName, ar.style, ar.medium
FROM Artifact ar
LEFT JOIN Artist art ON ar.artistID = art.artistID
ORDER BY ar.createdYear;

SELECT mb.branchName, ar.style, COUNT(*) AS artifactCount
FROM Artifact ar
JOIN Exhibits e ON ar.displayedInExhibitID = e.exhibitID
JOIN Galleries g ON e.galleryID = g.galleryID
JOIN MuseumBranch mb ON g.branchID = mb.branchID
WHERE ar.style IS NOT NULL
GROUP BY mb.branchName, ar.style
ORDER BY mb.branchName, artifactCount DESC;

SELECT ar.name AS artwork,
       mb.branchName AS museum,
       mb.street, mb.city, mb.state, mb.zip,
       g.name AS gallery, g.wing,
       e.name AS exhibit
FROM Artifact ar
JOIN Exhibits e  ON ar.displayedInExhibitID = e.exhibitID
JOIN Galleries g ON e.galleryID = g.galleryID
JOIN MuseumBranch mb ON g.branchID = mb.branchID
WHERE ar.name LIKE '%Daughters%';

SELECT mb.branchName,
       mb.street, mb.city, mb.state,
       mb.contactPhone,
       e.name AS exhibit,
       e.dateStart, e.dateEnd
FROM Exhibits e
JOIN Galleries g ON e.galleryID = g.galleryID
JOIN MuseumBranch mb ON g.branchID = mb.branchID
WHERE e.dateEnd >= CURDATE() OR e.dateEnd IS NULL
ORDER BY mb.branchName, e.dateStart;

SELECT ar.name, ar.style, ar.medium, ar.createdYear,
       ar.artifactCondition,
       CONCAT(art.firstName, ' ', art.lastName) AS artist,
       mb.branchName, g.name AS gallery, e.name AS exhibit
FROM Artifact ar
LEFT JOIN Artist art ON ar.artistID = art.artistID
LEFT JOIN Exhibits e ON ar.displayedInExhibitID = e.exhibitID
LEFT JOIN Galleries g ON e.galleryID = g.galleryID
LEFT JOIN MuseumBranch mb ON g.branchID = mb.branchID
WHERE ar.name         LIKE '%Garde%'    -- artifact name filter
  AND ar.style        LIKE '%Impressionism%'  -- artifact style filter
  AND ar.createdYear  BETWEEN 1700 AND 1900; -- artifact date range filter
  -- we could add more filters if wee feel like it

  SELECT e.name AS exhibit,
       e.dateStart, e.dateEnd,
       mb.branchName, mb.city, mb.state,
       mb.street, mb.contactPhone
FROM Exhibits e
JOIN Galleries g ON e.galleryID = g.galleryID
JOIN MuseumBranch mb ON g.branchID = mb.branchID
WHERE (e.dateEnd >= CURDATE() OR e.dateEnd IS NULL)
  AND mb.city = 'Boston'
ORDER BY e.dateStart DESC;

SELECT mb.branchName,
       COUNT(e.exhibitID) AS totalExhibits,
       MIN(e.dateStart)   AS earliestExhibit,
       MAX(e.dateStart)   AS mostRecentExhibit,
           (COUNT(e.exhibitID) /
           NULLIF(TIMESTAMPDIFF(MONTH, MIN(e.dateStart), CURDATE()), 0)) AS exhibitsPerMonth
FROM Exhibits e
JOIN Galleries g ON e.galleryID = g.galleryID
JOIN MuseumBranch mb ON g.branchID = mb.branchID
GROUP BY mb.branchName
ORDER BY exhibitsPerMonth DESC;
