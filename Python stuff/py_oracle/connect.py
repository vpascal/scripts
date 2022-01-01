import cx_Oracle
import config

connection = None
try:
    connection = cx_Oracle.connect(
        config.username,
        config.password,
        config.dsn,
        encoding=config.encoding)

    # show the version of the Oracle Database
    print(connection.version)
    cur = connection.cursor()
    cur.execute("select * from OUBIUSER.oubi_xref_terms_mv")
    res = cur.fetchmany(numRows = 3)
    print(res)
except cx_Oracle.Error as error:
    print(error)
finally:
    # release the connection
    if connection:
        connection.close()