INSERT INTO users VALUES ('keith', '{noop}keithpw');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users VALUES ('john', '{noop}johnpw');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_USER');



INSERT INTO course (name) VALUES ('Web Application Development (Spring Term 2025)');
INSERT INTO course (name) VALUES ('Software Project Management (Spring Term 2025)');
INSERT INTO course (name) VALUES ('Machine Learning (Spring Term 2025)');

INSERT INTO poll (question, choices) VALUES ('Do you like Software Project Management (2025 Spring)?', 'Like');
INSERT INTO poll (question, choices) VALUES ('Do you like Machine Learning (2025 Spring)?', 'Very Good');



INSERT INTO register (username, password, fullname, email, phone, role) VALUES ('hong','asdasd', 'hongkong', 'asddsa@hkmu', '12312312', 'ROLE_USER');
