using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class FactoryOutwardDAL
    {
        public DataTable GetFactoryOutward(int factoryIntakeId)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[1];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryIntakeId", Value = factoryIntakeId };
            var ds = sqlHelper.ExecuteQuery("spGetFactoryOutWardDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }
    }
}