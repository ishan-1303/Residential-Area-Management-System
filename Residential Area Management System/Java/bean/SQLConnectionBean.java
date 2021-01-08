package bean;






import java.sql.*;
import java.util.*;
import java.io.*;

public class SQLConnectionBean
      implements Serializable {

// global variables:
   private boolean isConnected = false;
   private Connection dbCon;
   private ResultSet sqlQueryResult;



// method for explicitely retrieving the ResultSet
   public ResultSet getSqlQueryResult () {
    return sqlQueryResult;
  }


// method that establishes connection to the database:
   public boolean connect()
        throws SQLException {
      try {

	if (dbCon==null){

		// first, loading the driver:
	    Class.forName("com.mysql.jdbc.Driver");

		// then, creating a connection object:
  	dbCon = DriverManager.getConnection("jdbc:mysql://localhost:3307/residence","root","");}


      isConnected = (dbCon != null);
      return isConnected;

      } catch (Exception E) {
      System.err.println("Couldn't make connection with database!");
	    return false;
      }


			}


	// method to close the database connection:
   public void close()
        throws SQLException {
      if (dbCon != null && !dbCon.isClosed()){
        dbCon.close();
      }
      dbCon = null;
      isConnected = false;
   }


	// method to execute an SQL query that returns a result back (mainly for SELECT queries):
   public ResultSet sqlQuery (String query) throws Exception {
    if ( (! isConnected) || (dbCon == null) )
      throw new Exception("SQL: no connection to the database!");

    if ( (query == null) || (query.equals("")) )
      throw new Exception("SQL: leere SQL-Anfrage !");

    return dbCon.createStatement().executeQuery (query);
   }



	// method for executing a "non-SELECT" queries (like UPDATE, INSERT, etc)
	// that only need to report whether the query was successful or not (false or true):

  public boolean sqlExecute (String query) throws Exception {
    if ( (! isConnected) || (dbCon == null) )
      throw new Exception("SQL: no connection to the database!");

    if ( (query == null) || (query.equals("")) )
      throw new Exception("SQL: leere SQL-Anfrage !");

    Statement stmt = dbCon.createStatement ();
    return stmt.execute(query);
  }

  public PreparedStatement prepareStatement(String sql)
    throws SQLException {
    return (dbCon != null) ? dbCon.prepareStatement(sql) : null;
  }
}