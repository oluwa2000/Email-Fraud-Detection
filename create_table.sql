DROP TABLE fraud_email;

CREATE TABLE IF NOT EXISTS fraud_email(
    email_info varchar,
    class int default 0);
    
CREATE TABLE IF NOT EXISTS assasin(
    email_info varchar,
    class int default 0);
    
CREATE TABLE IF NOT EXISTS fraud_two(
    Subject varchar,
    email_info varchar,
    class varchar);
    
\copy assasin from 'spam_assassin.csv' delimiter ',' CSV HEADER
    
\copy fraud_email from 'fraud_email_.csv' delimiter ',' CSV HEADER;
    
\copy fraud_two from 'fraud_two.csv' delimiter ',' CSV HEADER;

INSERT into fraud_email (select email_info from fraud_two);  
INSERT into fraud_email (select email_info, class from assasin);

DROP TABLE assasin;
DROP TABLE fraud_two;