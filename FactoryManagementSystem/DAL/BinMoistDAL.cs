using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class BinMoistDAL
    {
        public DataTable GetAllBinMoist(string strYear)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[16];
            paramArray[0] = new SqlParameter() { ParameterName = "@BinMoistId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@BinId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Date", Value = DateTime.Now.Date };
            paramArray[3] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[4] = new SqlParameter() { ParameterName = "@CompanyId", Value = 0 };
            paramArray[5] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@MorningUpMoist", Value = 0 };
            paramArray[7] = new SqlParameter() { ParameterName = "@MorningDownMoist", Value = 0 };
            paramArray[8] = new SqlParameter() { ParameterName = "@EvnUpmoist", Value = 0 };
            paramArray[9] = new SqlParameter() { ParameterName = "@EvnDownMoist", Value = 0 };
            paramArray[10] = new SqlParameter() { ParameterName = "@Shelling", Value = true };
            paramArray[11] = new SqlParameter() { ParameterName = "@ShellingDate", Value = DateTime.Now.Date };
            paramArray[12] = new SqlParameter() { ParameterName = "@Lot", Value = 0 };
            paramArray[13] = new SqlParameter() { ParameterName = "@Remarks", Value = "" };
            paramArray[14] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[15] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };

            var ds = sqlHelper.ExecuteQuery("spBinMoistCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetActiveBinMoist(string strYear, int intBinId)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[16];
            paramArray[0] = new SqlParameter() { ParameterName = "@BinMoistId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@BinId", Value = intBinId };
            paramArray[2] = new SqlParameter() { ParameterName = "@Date", Value = DateTime.Now.Date };
            paramArray[3] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[4] = new SqlParameter() { ParameterName = "@CompanyId", Value = 0 };
            paramArray[5] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@MorningUpMoist", Value = 0 };
            paramArray[7] = new SqlParameter() { ParameterName = "@MorningDownMoist", Value = 0 };
            paramArray[8] = new SqlParameter() { ParameterName = "@EvnUpmoist", Value = 0 };
            paramArray[9] = new SqlParameter() { ParameterName = "@EvnDownMoist", Value = 0 };
            paramArray[10] = new SqlParameter() { ParameterName = "@Shelling", Value = true };
            paramArray[11] = new SqlParameter() { ParameterName = "@ShellingDate", Value = DateTime.Now.Date };
            paramArray[12] = new SqlParameter() { ParameterName = "@Lot", Value = 0 };
            paramArray[13] = new SqlParameter() { ParameterName = "@Remarks", Value = "" };
            paramArray[14] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[15] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            var ds = sqlHelper.ExecuteQuery("spBinMoistCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.BinMoist binMoist)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(binMoist, 1);
            sqlHelper.ExecuteNonQuery("spBinMoistCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Update(Models.BinMoist binMoist)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(binMoist, 2);
            sqlHelper.ExecuteNonQuery("spBinMoistCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Delete(Models.BinMoist binMoist)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(binMoist, 3);
            sqlHelper.ExecuteNonQuery("spBinMoistCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.BinMoist binMoist, int operatorType)
        {
            var paramArray = new SqlParameter[16];
            paramArray[0] = new SqlParameter() { ParameterName = "@BinMoistId", Value = binMoist.BinMoistId };
            paramArray[1] = new SqlParameter() { ParameterName = "@BinId", Value = binMoist.BinId };
            paramArray[2] = new SqlParameter() { ParameterName = "@Date", Value = binMoist.Date };
            paramArray[3] = new SqlParameter() { ParameterName = "@Year", Value = binMoist.Year };
            paramArray[4] = new SqlParameter() { ParameterName = "@CompanyId", Value = binMoist.CompanyId };
            paramArray[5] = new SqlParameter() { ParameterName = "@Variety", Value = binMoist.Variety };
            paramArray[6] = new SqlParameter() { ParameterName = "@MorningUpMoist", Value = binMoist.MorningUpMoist };
            paramArray[7] = new SqlParameter() { ParameterName = "@MorningDownMoist", Value = binMoist.MorningDownMoist };
            paramArray[8] = new SqlParameter() { ParameterName = "@EvnUpmoist", Value = binMoist.EvnUpmoist };
            paramArray[9] = new SqlParameter() { ParameterName = "@EvnDownMoist", Value = binMoist.EvnDownMoist };
            paramArray[10] = new SqlParameter() { ParameterName = "@Shelling", Value = binMoist.Shelling };
            paramArray[11] = new SqlParameter() { ParameterName = "@ShellingDate", Value = binMoist.ShellingDate };
            paramArray[12] = new SqlParameter() { ParameterName = "@Lot", Value = binMoist.Lot };
            paramArray[13] = new SqlParameter() { ParameterName = "@Remarks", Value = binMoist.Remarks };
            paramArray[14] = new SqlParameter() { ParameterName = "@isActive", Value = binMoist.isActive };
            paramArray[15] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };

            return paramArray;
        }

        public DataTable GetShellingDetails(string strYear)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[1];
            paramArray[0] = new SqlParameter() { ParameterName = "@Year", Value = strYear };            
            var ds = sqlHelper.ExecuteQuery("spGetShellingDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }
    }
}