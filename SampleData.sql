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
        '1000 5th Ave', 'New York', 'NY', '10028'),
       (482743, 'The Museum of Fine Art', 'Pierre Terjanian', '(938)-338-0119', 'p.terjanian@outlook.com',
        '465 Huntington Ave', 'Boston', 'MA', '02115');

INSERT INTO Galleries
VALUES (324, 432110, true, 'Maria V. Hyacinth Gallery', 'The American Wing', 40),
       (472, 432110, false, 'The R. E. Carnegie Gallery', 'Modern Art', 15),
       (992, 482743, true, 'Ruth and Carl J. Shapiro Gallery', 'Modern American Art', 23);

INSERT INTO Exhibits
VALUES (823, 992, 'Portraits of Sargent',
        'The MFA''s treasured collection of Sargent Portraits.
        We hold the world''s most complete collection of Sargent''s works, including some of his most famous!',
        '1973-01-22', NULL),
       (293, 324, 'Curator Highlight: Watney Busch',
        'Our museum''s head curator, Watney Busch, has prepared an exhibit with their favourite pieces for your viewing pleasure',
        '2025-05-01', '2026-05-01');

INSERT INTO Donors
VALUES (44938, 'The Elizabeth Bennet Foundation for the Arts', 'jane.au@EBFA.org',
        'Ms.', 'Jane', NULL, 'Austen',
        'Winchester Rd', 'Chawton', NULL, 'GU34 1SD'),
       (93829, 'Blue Hill Conservation Society', 'hu.eric@bluehill.org',
        'Dr.', 'Eric', 'John', 'Hu',
        '34 Warren St.', 'Chicago', 'IL', '60606');

INSERT INTO ArtifactRequest
VALUES (3928, 293, 44938, 3326, '2025-05-01', '2026-05-01', 'ongoing'),
       (3929, 823, 93829, 3326, '2027-03-01', '2027-05-15', 'approved');

INSERT INTO ExpansionProject
VALUES (100021, 432110, 'Upgrading the courtyard''s paths and planting some more landscaping', 'pending',
        14292, 'Jenny Hofstadter', '(433)-958-9849', 'jenny.h.landscaping@gmail.com'),
       (100032, 432110, 'Constructing a new wing housing 12 new galleries', 'denied',
        3221847, 'Laurie James May', '(938)-993-0228', 'ljmay@outlook.com');

INSERT INTO Artist
VALUES (993, 'John', 'Singer', 'Sargent',
        'John Singer Sargent (/ˈsɑːrdʒənt/; January 12, 1856 – April 15, 1925)[2] was an American expatriate artist, considered the "leading portrait painter of his generation"...'),
       (994, 'Thomas', NULL, 'Cole',
        'Thomas Cole (February 1, 1801 – February 11, 1848)[1] was an Anglo-American artist[2] who founded the Hudson River School art movement.[3] He painted romantic landscapes and history paintings...'),
       (995, 'Oscar-Claude', NULL, 'Monet',
        'Oscar-Claude Monet (UK: /ˈmɒneɪ/, US: /moʊˈneɪ, məˈ-/; French: [klod mɔnɛ]; 14 November, 1840 – 5 December, 1926) was a French painter and founder of Impressionism who is seen as a key precursor to modernism...');

INSERT INTO Artifact
VALUES (3000039, 993, 'The Daughters of Edward Darley Boit',
        'This painting was painted by Sargent in the family''s Paris Apartment. Notice the vases insert into the painting displayed next to the artwork',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/The_Daughters_of_Edward_Darley_Boit%2C_John_Singer_Sargent%2C_1882_%28unfree_frame_crop%29.jpg/960px-The_Daughters_of_Edward_Darley_Boit%2C_John_Singer_Sargent%2C_1882_%28unfree_frame_crop%29.jpg',
        'pristine', 'realism', 1882, 'Oil on canvas', 3324, 823),
       (3000040, NULL, 'Set of 2, blue-and-white Japanese Vases', NULL,
        'https://cdn.shopify.com/s/files/1/1358/1837/files/unnamed_6.jpg?v=1642192203',
        'good', NULL, NULL, 'Porcelain', 3324, 823),
       (3000042, 995, 'Woman in the Garden',
        'This painting was completed en plein air, and the woman in the portait is actually Monet''s cousin''s wife.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Claude_Monet_022.jpg/960px-Claude_Monet_022.jpg',
        'fair', 'Impressionism', 1866, 'Oil on canvas', 3324, 293);

INSERT INTO ArtifactSet
VALUES (877, 'Daughters of Edward Darley Boit & Vases', 'One of Sargent''s most compositionally interesting works, and the vases it features'),
       (882, 'Marilyn Diptychs', 'The museum''s entire collection of Marilyn Diptychs (currently 0, but a girl can dream (The girl is me, Victoria-Elizabeth))');

INSERT INTO ArtifactSetRelations
VALUES (877, 3000039),
       (877, 3000040);

INSERT INTO ArtifactRequestRelations
VALUES (3928, 3000042),
       (3929, 3000039),
       (3929, 3000040);

INSERT INTO MonetaryDonation
VALUES (2833, 10000, 'Thank you for taking such good care of the pieces that were loaned this year! We appreciate our collaboration',
        44938, 482743),
       (2948, 45000, 'Met Gala Donation', 93829, 432110);