INSERT INTO poll (question, choices, created_at, updated_at)
VALUES ('Test Poll', '{"Yes":0,"No":0}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO users VALUES ('admin', '{noop}admin123', 'Admin User', 'admin@example.com', '12345678');
INSERT INTO user_roles(username, role) VALUES ('admin', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('admin', 'ROLE_ADMIN');

INSERT INTO users VALUES ('john', '{noop}johnpw', 'Student', 'john@example.com', '87654321');
INSERT INTO user_roles(username, role) VALUES ('john', 'ROLE_USER');
