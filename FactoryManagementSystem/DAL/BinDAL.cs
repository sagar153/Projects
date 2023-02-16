using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class BinDAL
    {
        public DataTable GetAllBin()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[4];
            paramArray[0] = new SqlParameter() { ParameterName = "@BinId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@BinName", Value = "" };
            paramArray[2] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[3] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            var ds = sqlHelper.ExecuteQuery("spBinCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetActiveBins()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[4];
            paramArray[0] = new SqlParameter() { ParameterName = "@BinId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@BinName", Value = "" };
            paramArray[2] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[3] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spBinCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.Bin bin)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(bin, 1);
            sqlHelper.ExecuteNonQuery("spBinCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Update(Models.Bin bin)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(bin, 2);
            sqlHelper.ExecuteNonQuery("spBinCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Delete(Models.Bin bin)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(bin, 3);
            sqlHelper.ExecuteNonQuery("spBinCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.Bin bin, int operatorType)
        {
            var paramArray = new SqlParameter[4];
            paramArray[0] = new SqlParameter() { ParameterName = "@BinId", Value = bin.BinId };
            paramArray[1] = new SqlParameter() { ParameterName = "@BinName", Value = bin.BinName };
            paramArray[2] = new SqlParameter() { ParameterName = "@isActive", Value = bin.isActive };
            paramArray[3] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };

            return paramArray;
        }
    }
}