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
        public DataTable GetFactoryOutwardByIntake(int factoryIntakeId)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[2];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryIntakeId", Value = factoryIntakeId };
            paramArray[1] = new SqlParameter() { ParameterName = "@FactoryOutwardId", Value = 0 };
            var ds = sqlHelper.ExecuteQuery("spGetFactoryOutWardDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetFactoryOutwardByOutward(int factoryOutwardId)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[2];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryIntakeId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@FactoryOutwardId", Value = factoryOutwardId };
            var ds = sqlHelper.ExecuteQuery("spGetFactoryOutWardDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }
    }
}