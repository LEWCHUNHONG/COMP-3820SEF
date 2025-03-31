CREATE TABLE IF NOT EXISTS guestbook (

    id BIGINT GENERATED ALWAYS AS IDENTITY,
    date TIMESTAMP,
    message VARCHAR(255),
    name VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS course (
                                         id BIGINT GENERATED ALWAYS AS IDENTITY,
                                         name VARCHAR(255),
                                         PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS poll (
                                    id BIGINT GENERATED ALWAYS AS IDENTITY,
                                    question VARCHAR(255),
                                    choices VARCHAR(255),
                                    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS coursecomment (
                                    id BIGINT GENERATED ALWAYS AS IDENTITY,
                                    name VARCHAR(255),
                                    message VARCHAR(255),
                                    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS registerdata (
                                        id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                        username VARCHAR(255),
                                        password VARCHAR(255),
                                        fullname VARCHAR(255),
                                        email VARCHAR(255),
                                        phone VARCHAR(8),
                                        role VARCHAR(10)
);



DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    PRIMARY KEY (username)
);
CREATE TABLE IF NOT EXISTS user_roles (
    user_role_id INTEGER GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);