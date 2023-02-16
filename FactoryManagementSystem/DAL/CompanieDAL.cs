using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class CompanieDAL
    {
        public DataTable GetAllCompanies()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[4];
            paramArray[0] = new SqlParameter() { ParameterName = "@CompanyId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@CompanyName", Value = "" };
            paramArray[2] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[3] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spCompaniesCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetActiveCompanies()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[4];
            paramArray[0] = new SqlParameter() { ParameterName = "@CompanyId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@CompanyName", Value = "" };
            paramArray[2] = new SqlParameter() { ParameterName = "@isActive", Value = true };
            paramArray[3] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            var ds = sqlHelper.ExecuteQuery("spCompaniesCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.Company company)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(company, 1);
            sqlHelper.ExecuteNonQuery("spCompaniesCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Update(Models.Company company)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(company, 2);
            sqlHelper.ExecuteNonQuery("spCompaniesCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Delete(Models.Company company)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(company, 3);
            sqlHelper.ExecuteNonQuery("spCompaniesCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.Company company, int operatorType)
        {
            var paramArray = new SqlParameter[4];
            paramArray[0] = new SqlParameter() { ParameterName = "@CompanyId", Value = company.CompanyId };
            paramArray[1] = new SqlParameter() { ParameterName = "@CompanyName", Value = company.CompanyName };
            paramArray[2] = new SqlParameter() { ParameterName = "@isActive", Value = company.isActive };
            paramArray[3] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };

            return paramArray;
        }
    }
}