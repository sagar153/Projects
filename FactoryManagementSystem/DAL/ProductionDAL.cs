using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FactoryManagementSystem.DAL
{
    public class ProductionDAL
    {
        public DataTable GetProductionByYear(string strYear, bool isActiveOnly, int intProdId = 0)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[17];
            if (intProdId > 0)
                paramArray[0] = new SqlParameter() { ParameterName = "@ProductionId", Value = intProdId };
            else
                paramArray[0] = new SqlParameter() { ParameterName = "@ProductionId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[2] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[3] = new SqlParameter() { ParameterName = "@FatherName", Value = "" };
            paramArray[4] = new SqlParameter() { ParameterName = "@Mobile", Value = 0 };
            paramArray[5] = new SqlParameter() { ParameterName = "@FarmerName", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@ACRES", Value = 0 };
            paramArray[7] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[8] = new SqlParameter() { ParameterName = "@SurveyNo", Value = "" };
            paramArray[9] = new SqlParameter() { ParameterName = "@Village", Value = "" };
            paramArray[10] = new SqlParameter() { ParameterName = "@Area", Value = "" };
            paramArray[11] = new SqlParameter() { ParameterName = "@ShowingDate", Value = DateTime.Now };
            paramArray[12] = new SqlParameter() { ParameterName = "@HarvestDate", Value = DateTime.Now };
            paramArray[13] = new SqlParameter() { ParameterName = "@TotalTonnage", Value = 0 };
            paramArray[14] = new SqlParameter() { ParameterName = "@AddDate", Value = DateTime.Now };
            paramArray[15] = new SqlParameter() { ParameterName = "@Remarks", Value = "" };
            if (intProdId > 0)
                paramArray[16] = new SqlParameter() { ParameterName = "@OperationType", Value = 6 };
            else if (isActiveOnly)
                paramArray[16] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            else
                paramArray[16] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spProductionCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.Production production)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(production, 1);
            sqlHelper.ExecuteNonQuery("spProductionCRUD", CommandType.StoredProcedure, paramArray);            
        }

        public void Update(Models.Production production)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(production, 2);
            sqlHelper.ExecuteNonQuery("spProductionCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Delete(Models.Production production)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(production, 3);
            sqlHelper.ExecuteNonQuery("spProductionCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.Production production, int operatorType)
        {
            var paramArray = new SqlParameter[17];
            paramArray[0] = new SqlParameter() { ParameterName = "@ProductionId", Value = production.ProductionId };
            paramArray[1] = new SqlParameter() { ParameterName = "@Year", Value = production.Year };
            paramArray[2] = new SqlParameter() { ParameterName = "@OrganiserId", Value = production.OrganiserId };
            paramArray[3] = new SqlParameter() { ParameterName = "@FatherName", Value = production.FatherName };
            paramArray[4] = new SqlParameter() { ParameterName = "@Mobile", Value = production.Mobile };
            paramArray[5] = new SqlParameter() { ParameterName = "@FarmerName", Value = production.FarmerName };
            paramArray[6] = new SqlParameter() { ParameterName = "@ACRES", Value = production.ACRES };
            paramArray[7] = new SqlParameter() { ParameterName = "@Variety", Value = production.Variety };
            paramArray[8] = new SqlParameter() { ParameterName = "@SurveyNo", Value = production.SurveyNo };
            paramArray[9] = new SqlParameter() { ParameterName = "@Village", Value = production.Village };
            paramArray[10] = new SqlParameter() { ParameterName = "@Area", Value = production.Area };
            paramArray[11] = new SqlParameter() { ParameterName = "@ShowingDate", Value = production.ShowingDate };
            paramArray[12] = new SqlParameter() { ParameterName = "@HarvestDate", Value = production.HarvestDate };
            paramArray[13] = new SqlParameter() { ParameterName = "@TotalTonnage", Value = production.TotalTonnage };
            paramArray[14] = new SqlParameter() { ParameterName = "@AddDate", Value = production.AddDate };
            paramArray[15] = new SqlParameter() { ParameterName = "@Remarks", Value = production.Remarks };
            paramArray[16] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };

            return paramArray;
        }
    }
}
