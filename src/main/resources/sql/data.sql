INSERT INTO users VALUES ('keith', '{noop}keithpw');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users VALUES ('john', '{noop}johnpw');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_USER');


INSERT INTO poll (question, choices) VALUES ('Do you like Software Project Management (2025 Spring)?', 'Like');
INSERT INTO poll (question, choices) VALUES ('Do you like Machine Learning (2025 Spring)?', 'Very Good');


