DROP TABLE testData;

CREATE TABLE testData(
  id serial4 primary key,
  spoken_word varchar(255),
  response varchar(255),
  catagory varchar(255)
);

INSERT INTO testData (spoken_word, response, catagory) VALUES ('hello', 'soundcloud.com/hello_there', 'greeting');
INSERT INTO testData (spoken_word, response, catagory) VALUES ('goodbye', 'soundcloud.com/goodbye_for_now', 'farewell');
INSERT INTO testData (spoken_word, response, catagory) VALUES ('bye', 'soundcloud.com/bye_sucka', 'farewell' );
INSERT INTO testData (spoken_word, response, catagory) VALUES ('bye', 'soundcloud.com/leave_now', 'farewell');