USE `Singer-Sargent-Archive`;

INSERT INTO Roles
VALUES (1, 'Archivist'),
       (2, 'Curator'),
       (3, 'Director');

INSERT INTO MuseumWorker
VALUES (3324, 'Veronica-Elizabeth', NULL, 'Hawthorne', 'v.hawthorne@theMET.org', 1),
       (3326, 'Watney', 'Alex', 'Busch', 'w.busch@theMET.org', 2),
       (3327, 'Marshal', NULL, 'Jacobson', 'm.jacobson@theMET.org', 3);

INSERT INTO MuseumBranch
VALUES (432110, 'The Metropolitan Museum of Art', 'Whitney W. Donhauser', '(443)-183-0293', 'donhauser.whitney@gmail.com',
        '1000 5th Ave' , 'New York', 'NY' , '10028'),
       (482743, 'The Museum of Fine Art', 'Pierre Terjanian', '(938)-338-0119', 'p.terjanian@outlook.com',
        '465 Huntington Ave' , 'Boston', 'MA' , '02115');

INSERT INTO Galleries
VALUES (324, 432110, true, 'Maria V. Hyacinth Gallery', 'The American Wing', 40),
       (472, 432110, false, 'The R. E. Carnegie Gallery', 'Modern Art', 15),
       (992, 482743, true, 'Ruth and Carl J. Shapiro Gallery', 'Modern American Art', 23);

INSERT INTO Exhibits
VALUES (823, 992, 'Portraits of Sargent',
        'The MFA\'s treasured collection of Sargent Portraits.
        We hold the world\'s most complete collection of Sargent\'s works, including some of his most famous!',
        '1973-01-22', NULL),
        (293, 324, 'American Landscapes, 1800-1950',
        'This travelling exhibit contains beautiful landscapes from all 50 states by many skilled artists',
        '2025-05-01', '2026-05-01');

INSERT INTO Donors
VALUES (44938, 'The Elizabeth Bennet Foundation for the Arts', 'jane.au@EBFA.org',
        'Ms.', 'Jane', NULL, 'Austen',
        'Winchester Rd', 'Chawton', NULL, 'GU34 1SD'),
        (93829, 'Blue Hill Conservation Society ', 'hu.eric@bluehill.org',
        'Dr.', 'Eric', 'John', 'Hu',
        '34 Warren St.', 'Chicago', 'IL', '60606');

INSERT INTO ArtifactRequest
VALUES (3928, 293, 44938, 3326, '2025-05-01', '2026-05-01',
        'ongoing'),
