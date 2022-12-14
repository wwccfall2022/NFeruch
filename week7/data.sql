USE destruction;
INSERT INTO players
    (player_id, first_name, last_name, email)
VALUES
    (1, 'Terry', 'Pratchett', 'writer@disc.world'),
    (2, 'Neil', 'Gaiman', 'american@gods.com'),
    (3, 'George', 'Martin', 'game@thrones.of'),
    (4, 'J.R.R.', 'Tolkien', 'lord@the.rings');

INSERT INTO characters
    (character_id, player_id, name, level)
VALUES
    (1, 1, 'Death', 1),
    (2, 1, 'Susan', 1),
    (3, 1, 'Rincewind', 1),
    (4, 2, 'Shadow', 1),
    (5, 2, 'Wednesday', 1),
    (6, 2, 'Mr. Nancy', 1),
    (7, 3, 'Jon Snow', 1),
    (8, 3, 'Daenerys Targaryen', 1),
    (9, 3, 'Arya Stark', 1),
    (10, 4, 'Frodo Baggins', 1),
    (11, 4, 'Gandalf', 1),
    (12, 4, 'Gollum', 1);

INSERT INTO character_stats
    (character_id, health, armor)
VALUES
    (1, 20, 4),
    (2, 10, 2),
    (3, 8, 1),
    (4, 15, 3),
    (5, 12, 2),
    (6, 10, 1),
    (7, 15, 2),
    (8, 12, 2),
    (9, 10, 1),
    (10, 14, 1),
    (11, 12, 2),
    (12, 8, 1);

INSERT INTO teams
    (team_id, name)
VALUES
    (1, 'The Watchers'),
    (2, 'The Ankh-Morpork City Watch'),
    (3, 'The Fellowship of the Ring');

INSERT INTO team_members
    (team_id, character_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (1, 7),
    (3, 8),
    (3, 9),
    (3, 10),
    (3, 11),
    (3, 12);

INSERT INTO items
    (item_id, name, armor, damage)
VALUES
    (1, 'dagger', 0, 8),
    (2, 'sword', 1, 13),
    (3, 'shield', 2, 0),
    (4, 'helmet', 1, 0),
    (5, 'chainmail', 3, 0),
    (6, 'leather armor', 2, 0),
    (7, 'longbow', 0, 11),
    (8, 'shortbow', 0, 9),
    (9, 'crossbow', 0, 7);

INSERT INTO inventory
    (inventory_id, character_id, item_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 6),
    (7, 1, 7),
    (8, 1, 8),
    (9, 1, 9),
    (12, 2, 1),
    (13, 2, 2),
    (14, 2, 3),
    (15, 2, 4),
    (16, 2, 5),
    (17, 2, 6),
    (18, 2, 7),
    (19, 2, 8),
    (20, 2, 9),
    (23, 3, 1),
    (24, 3, 2),
    (25, 3, 3),
    (26, 3, 4),
    (27, 3, 5),
    (28, 3, 6),
    (29, 3, 7),
    (30, 3, 8),
    (31, 3, 9),
    (34, 4, 1),
    (35, 4, 2),
    (36, 4, 3),
    (37, 4, 4),
    (38, 4, 5),
    (39, 4, 6),
    (40, 4, 7),
    (41, 4, 8),
    (42, 4, 9),
    (45, 5, 1),
    (46, 5, 2),
    (47, 5, 3),
    (48, 5, 4),
    (49, 5, 5),
    (50, 5, 6),
    (51, 5, 7),
    (52, 5, 8),
    (53, 5, 9),
    (56, 6, 1),
    (57, 6, 2),
    (58, 6, 3),
    (59, 6, 4),
    (60, 6, 5),
    (61, 6, 6),
    (62, 6, 7),
    (63, 6, 8),
    (64, 6, 9),
    (67, 7, 1),
    (72, 7, 4),
    (73, 7, 7),
    (78, 8, 1),
    (79, 8, 2),
    (80, 8, 3),
    (81, 8, 4),
    (82, 8, 5),
    (83, 8, 6),
    (84, 8, 7),
    (85, 8, 8),
    (89, 9, 1),
    (90, 9, 2),
    (91, 9, 3),
    (92, 9, 4),
    (93, 9, 5),
    (94, 9, 6),
    (95, 9, 7),
    (96, 9, 8),
    (100, 10, 4),
    (101, 10, 5);

INSERT INTO equipped
    (equipped_id, character_id, item_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 5),
    (6, 1, 6),
    (7, 1, 7),
    (8, 1, 8),
    (9, 1, 9),
    (12, 2, 1),
    (13, 2, 2),
    (14, 2, 3),
    (15, 2, 4),
    (16, 2, 5),
    (17, 2, 6),
    (18, 2, 7),
    (19, 2, 8),
    (20, 2, 9),
    (23, 3, 1),
    (24, 3, 2),
    (25, 3, 3),
    (26, 3, 4),
    (27, 3, 5),
    (28, 3, 6),
    (29, 3, 7),
    (30, 3, 8),
    (31, 3, 9),
    (34, 4, 1),
    (35, 4, 2),
    (36, 4, 3),
    (37, 4, 4),
    (38, 4, 5),
    (39, 4, 6),
    (40, 4, 7),
    (41, 4, 8),
    (42, 4, 9),
    (45, 5, 1),
    (46, 5, 2),
    (47, 5, 3),
    (48, 5, 4),
    (49, 5, 5),
    (50, 5, 6),
    (51, 5, 7),
    (52, 5, 8),
    (53, 5, 9),
    (56, 6, 1),
    (57, 6, 2),
    (58, 6, 3),
    (59, 6, 4),
    (60, 6, 5),
    (61, 6, 6),
    (62, 6, 7),
    (63, 6, 8),
    (64, 6, 9),
    (68, 7, 2),
    (72, 7, 6),
    (78, 8, 1),
    (79, 8, 2),
    (80, 8, 3),
    (81, 8, 4),
    (82, 8, 5),
    (83, 8, 6),
    (84, 8, 7),
    (85, 8, 8),
    (89, 9, 1),
    (90, 9, 2),
    (91, 9, 3),
    (92, 9, 4),
    (93, 9, 5),
    (94, 9, 6),
    (95, 9, 7),
    (96, 9, 8),
    (100, 10, 1);