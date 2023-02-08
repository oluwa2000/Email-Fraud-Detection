DROP TABLE fraud_email;

CREATE TABLE fraud_email(
    email_info varchar,
    class int default 0);
    
\copy fraud_email from 'fraud_email_.csv' delimiter ',' CSV HEADER;

CREATE TABLE fraud_two(
    Subject varchar,
    email_info varchar,
    class varchar);
    
\copy fraud_two from 'fraud_two.csv' delimiter ',' CSV HEADER;

INSERT into fraud_email (select email_info from fraud_two);    