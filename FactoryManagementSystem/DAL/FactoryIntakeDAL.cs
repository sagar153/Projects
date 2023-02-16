using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class FactoryIntakeDAL
    {
        public DataTable GetAllFactoryIntake()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[15];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryIntakeId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@CompanyId", Value = 0 };
            paramArray[2] = new SqlParameter() { ParameterName = "@Year", Value = "" };
            paramArray[3] = new SqlParameter() { ParameterName = "@Date", Value = DateTime.Now };
            paramArray[4] = new SqlParameter() { ParameterName = "@LorryNo", Value = "" };
            paramArray[5] = new SqlParameter() { ParameterName = "@Variety", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@Weight", Value = 0.0 };
            paramArray[7] = new SqlParameter() { ParameterName = "@Moist", Value = 0.0 };
            paramArray[8] = new SqlParameter() { ParameterName = "@Bags", Value = 0 };
            paramArray[9] = new SqlParameter() { ParameterName = "@Lot", Value = 0 };
            paramArray[10] = new SqlParameter() { ParameterName = "@Executive", Value = "" };
            paramArray[11] = new SqlParameter() { ParameterName = "@BinId", Value = 1 };
            paramArray[12] = new SqlParameter() { ParameterName = "@Remarks", Value = "" };
            paramArray[13] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[14] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spFactoryIntakeCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.FactoryIntake factoryIntake)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(factoryIntake, 1);
            sqlHelper.ExecuteNonQuery("spFactoryIntakeCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Update(Models.FactoryIntake factoryIntake)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(factoryIntake, 2);
            sqlHelper.ExecuteNonQuery("spFactoryIntakeCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Delete(Models.FactoryIntake factoryIntake)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(factoryIntake, 3);
            sqlHelper.ExecuteNonQuery("spFactoryIntakeCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.FactoryIntake factoryIntake, int operatorType)
        {
            var paramArray = new SqlParameter[15];
            paramArray[0] = new SqlParameter() { ParameterName = "@FactoryIntakeId", Value = factoryIntake.FactoryIntakeId };
            paramArray[1] = new SqlParameter() { ParameterName = "@CompanyId", Value = factoryIntake.CompanyId };
            paramArray[2] = new SqlParameter() { ParameterName = "@Year", Value = factoryIntake.Year };
            paramArray[3] = new SqlParameter() { ParameterName = "@Date", Value = factoryIntake.Date };
            paramArray[4] = new SqlParameter() { ParameterName = "@LorryNo", Value = factoryIntake.LorryNo };
            paramArray[5] = new SqlParameter() { ParameterName = "@Variety", Value = factoryIntake.Variety };
            paramArray[6] = new SqlParameter() { ParameterName = "@Weight", Value = factoryIntake.Weight };
            paramArray[7] = new SqlParameter() { ParameterName = "@Moist", Value = factoryIntake.Moist };
            paramArray[8] = new SqlParameter() { ParameterName = "@Bags", Value = factoryIntake.Bags };
            paramArray[9] = new SqlParameter() { ParameterName = "@Lot", Value = factoryIntake.Lot };
            paramArray[10] = new SqlParameter() { ParameterName = "@Executive", Value = factoryIntake.Executive };
            paramArray[11] = new SqlParameter() { ParameterName = "@BinId", Value = factoryIntake.BinId };
            paramArray[12] = new SqlParameter() { ParameterName = "@Remarks", Value = factoryIntake.Remarks };
            paramArray[13] = new SqlParameter() { ParameterName = "@isActive", Value = factoryIntake.isActive };
            paramArray[14] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };

            return paramArray;
        }
    }
}