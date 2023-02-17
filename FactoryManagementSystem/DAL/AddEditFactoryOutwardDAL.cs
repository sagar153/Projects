using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class AddEditFactoryOutwardDAL
    {
        public DataTable GetFactoryOutwardDetails(int factoryOutwardId)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[1];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryOutwardId", Value = factoryOutwardId };
            var ds = sqlHelper.ExecuteQuery("spGetFactoryOutwardDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }
    }
}