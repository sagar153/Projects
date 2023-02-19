using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class CommonDAL
    {
        public DataTable GetVarietiesByYear(string strYear)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[5];
            
            paramArray[0] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[3] = new SqlParameter() { ParameterName = "@Area", Value = "" };
            paramArray[4] = new SqlParameter() { ParameterName = "@OperationType", Value = 1 };
            var ds = sqlHelper.ExecuteQuery("spProductionUserScreenDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetVarietiesByVariety(string strYear, string strVariety)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[5];

            paramArray[0] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Variety", Value = strVariety };
            paramArray[3] = new SqlParameter() { ParameterName = "@Area", Value = "" };
            paramArray[4] = new SqlParameter() { ParameterName = "@OperationType", Value = 2 };
            var ds = sqlHelper.ExecuteQuery("spProductionUserScreenDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetFarmersByVarietyAndArea(string strYear, string strVariety, string strArea)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[5];

            paramArray[0] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Variety", Value = strVariety };
            paramArray[3] = new SqlParameter() { ParameterName = "@Area", Value = strArea };
            paramArray[4] = new SqlParameter() { ParameterName = "@OperationType", Value = 3 };
            var ds = sqlHelper.ExecuteQuery("spProductionUserScreenDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetAcres(string strYear)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[5];

            paramArray[0] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[3] = new SqlParameter() { ParameterName = "@Area", Value = "" };
            paramArray[4] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            var ds = sqlHelper.ExecuteQuery("spProductionUserScreenDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetFarmersByArea(string strYear, string strArea)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[5];

            paramArray[0] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[3] = new SqlParameter() { ParameterName = "@Area", Value = strArea };
            paramArray[4] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spProductionUserScreenDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }
    }
}