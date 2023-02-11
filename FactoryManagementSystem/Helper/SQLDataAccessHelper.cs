using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace FactoryManagementSystem
{
    public class SQLDataAccessHelper
    {
        string connectionString = string.Empty;

        public SQLDataAccessHelper()
        {
            try
            {
                connectionString = ConfigurationManager.ConnectionStrings["FactoryManagement"].ConnectionString;
            }
            catch (Exception)
            {
                //todo error handling  mechanism
                throw;
            }
        }



        public void ExecuteNonQuery(string commandText, CommandType commandType, params SqlParameter[] commandParameters)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(commandText, connection))
            {
                command.CommandType = commandType;
                command.Parameters.AddRange(commandParameters);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public DataSet ExecuteQuery(string commandText, CommandType commandType, params SqlParameter[] parameters)
        {
            using (var connection = new SqlConnection(connectionString))
            using (var command = new SqlCommand(commandText, connection))
            {
                DataSet ds = new DataSet();
                command.CommandType = commandType;
                command.Parameters.AddRange(parameters);
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(ds);
                connection.Close();
                return ds;
            }
        }
    }
}
