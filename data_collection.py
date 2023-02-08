def dataCollectionOne():
    connectionString = "dbname='dpbolat19_db' user = 'dpbolat19' host='tools.cs.earlham.edu' "
    connection = psycopg2.connect(connectionString)
    cursor1 = connection.cursor()

    sqlStatement1 = "SELECT * FROM fraud_email;"

    cursor1.execute(sqlStatement1)
    records = cursor1.fetchall()

    email_info = []
    Class = []

    for i in records:
        email_info.append(i[0])
        Class.append(i[1])
        
    data = pd.DataFrame(list(zip(email_info,Class)),columns = ['Email Info', 'Class'])
    return data