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
        public DataTable GetAllFactoryOutward(string strYear)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[13];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryOutwardId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@CompanyId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[3] = new SqlParameter() { ParameterName = "@Date", Value = DateTime.Now };
            paramArray[4] = new SqlParameter() { ParameterName = "@LorryNo", Value = "" };
            paramArray[5] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@Weight", Value = 0.0 };
            paramArray[7] = new SqlParameter() { ParameterName = "@Bags", Value = 0 };
            paramArray[8] = new SqlParameter() { ParameterName = "@DCNo", Value = 0 };
            paramArray[9] = new SqlParameter() { ParameterName = "@Executive", Value = "" };
            paramArray[10] = new SqlParameter() { ParameterName = "@Remarks", Value = "" };
            paramArray[11] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[12] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spFactoryOutwardCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetActiveFactoryOutward(string strYear)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[13];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryOutwardId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@CompanyId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[3] = new SqlParameter() { ParameterName = "@Date", Value = DateTime.Now };
            paramArray[4] = new SqlParameter() { ParameterName = "@LorryNo", Value = "" };
            paramArray[5] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@Weight", Value = 0.0 };
            paramArray[7] = new SqlParameter() { ParameterName = "@Bags", Value = 0 };
            paramArray[8] = new SqlParameter() { ParameterName = "@DCNo", Value = 0 };
            paramArray[9] = new SqlParameter() { ParameterName = "@Executive", Value = "" };
            paramArray[10] = new SqlParameter() { ParameterName = "@Remarks", Value = "" };
            paramArray[11] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[12] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            var ds = sqlHelper.ExecuteQuery("spFactoryOutwardCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.FactoryOutward factoryOutward)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(factoryOutward, 1);
            sqlHelper.ExecuteNonQuery("spFactoryOutwardCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Update(Models.FactoryOutward factoryOutward)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(factoryOutward, 2);
            sqlHelper.ExecuteNonQuery("spFactoryOutwardCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.FactoryOutward factoryOutward, int operatorType)
        {
            var paramArray = new SqlParameter[13];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryOutwardId", Value = factoryOutward.FactoryOutWardId };
            paramArray[1] = new SqlParameter() { ParameterName = "@CompanyId", Value = factoryOutward.CompanyId };
            paramArray[2] = new SqlParameter() { ParameterName = "@Year", Value = factoryOutward.Year };
            paramArray[3] = new SqlParameter() { ParameterName = "@Date", Value = factoryOutward.Date };
            paramArray[4] = new SqlParameter() { ParameterName = "@LorryNo", Value = factoryOutward.LorryNo };
            paramArray[5] = new SqlParameter() { ParameterName = "@Variety", Value = factoryOutward.Variety };
            paramArray[6] = new SqlParameter() { ParameterName = "@Weight", Value = factoryOutward.Weight };
            paramArray[7] = new SqlParameter() { ParameterName = "@Bags", Value = factoryOutward.Bags };
            paramArray[8] = new SqlParameter() { ParameterName = "@DCNo", Value = factoryOutward.DCNo };
            paramArray[9] = new SqlParameter() { ParameterName = "@Executive", Value = factoryOutward.CompanyExecutive };
            paramArray[10] = new SqlParameter() { ParameterName = "@Remarks", Value = factoryOutward.Remarks };
            paramArray[11] = new SqlParameter() { ParameterName = "@isActive", Value = factoryOutward.isActive };
            paramArray[12] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };

            return paramArray;
        }
    }
}