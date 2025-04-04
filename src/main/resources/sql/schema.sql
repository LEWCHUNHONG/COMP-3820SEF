DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS poll;

CREATE TABLE IF NOT EXISTS users (
                       username VARCHAR(50) NOT NULL,
                       password VARCHAR(100) NOT NULL,
                       fullname VARCHAR(100),
                       email VARCHAR(100),
                       phone VARCHAR(20),
                       PRIMARY KEY (username)
);

CREATE TABLE IF NOT EXISTS user_roles (
                                          user_role_id INTEGER GENERATED ALWAYS AS IDENTITY,
                                          username VARCHAR(50) NOT NULL,
                                          role VARCHAR(50) NOT NULL,
                                          PRIMARY KEY (user_role_id),
                                          FOREIGN KEY (username) REFERENCES users(username)
);

CREATE TABLE IF NOT EXISTS poll (
                      id BIGINT PRIMARY KEY AUTO_INCREMENT,
                      question VARCHAR(255),
                      choices TEXT,
                      deleted BOOLEAN NOT NULL DEFAULT FALSE,
                      deleted_at TIMESTAMP,
                      created_at TIMESTAMP NOT NULL,
                      updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS coursecomment (
                                             id BIGINT PRIMARY KEY AUTO_INCREMENT,
                                             name VARCHAR(255),
                                             message VARCHAR(255)
)
