using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class OrganiserDAL
    {
        public DataTable GetAllOrganiser()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[8];
            paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserName", Value = "" };
            paramArray[2] = new SqlParameter() { ParameterName = "@FatherName", Value = "" };
            paramArray[3] = new SqlParameter() { ParameterName = "@Mobile", Value = 0 };
            paramArray[4] = new SqlParameter() { ParameterName = "@Area", Value = "" };
            paramArray[5] = new SqlParameter() { ParameterName = "@Village", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@isActive", Value = 1 };
            paramArray[7] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            var ds = sqlHelper.ExecuteQuery("spOrganiserCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetActiveOrganiser()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[8];
            paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserName", Value = "" };
            paramArray[2] = new SqlParameter() { ParameterName = "@FatherName", Value = "" };
            paramArray[3] = new SqlParameter() { ParameterName = "@Mobile", Value = 0 };
            paramArray[4] = new SqlParameter() { ParameterName = "@Area", Value = "" };
            paramArray[5] = new SqlParameter() { ParameterName = "@Village", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@isActive", Value = 1 };
            paramArray[7] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spOrganiserCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetDistinctOrganiser()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[8];
            paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserName", Value = "" };
            paramArray[2] = new SqlParameter() { ParameterName = "@FatherName", Value = "" };
            paramArray[3] = new SqlParameter() { ParameterName = "@Mobile", Value = 0 };
            paramArray[4] = new SqlParameter() { ParameterName = "@Area", Value = "" };
            paramArray[5] = new SqlParameter() { ParameterName = "@Village", Value = "" };
            paramArray[6] = new SqlParameter() { ParameterName = "@isActive", Value = 1 };
            paramArray[7] = new SqlParameter() { ParameterName = "@OperationType", Value = 6 };
            var ds = sqlHelper.ExecuteQuery("spOrganiserCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetOrganiserDetails(string strYear, int intOrgId)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[2];
            paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserId", Value = intOrgId };
            paramArray[1] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            
            var ds = sqlHelper.ExecuteQuery("spOrganiserDetails", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.Organiser organiser)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(organiser, 1);
            sqlHelper.ExecuteNonQuery("spOrganiserCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Update(Models.Organiser organiser)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(organiser, 2);
            sqlHelper.ExecuteNonQuery("spOrganiserCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Delete(Models.Organiser organiser)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(organiser, 3);
            sqlHelper.ExecuteNonQuery("spOrganiserCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.Organiser organiser, int operatorType)
        {
            var paramArray = new SqlParameter[8];
            paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserId", Value = organiser.OrganiserId };
            paramArray[1] = new SqlParameter() { ParameterName = "@OrganiserName", Value = organiser.OrganiserName };
            paramArray[2] = new SqlParameter() { ParameterName = "@FatherName", Value = organiser.FatherName  };
            paramArray[3] = new SqlParameter() { ParameterName = "@Mobile", Value = organiser.Mobile };
            paramArray[4] = new SqlParameter() { ParameterName = "@Area", Value = organiser.Area };
            paramArray[5] = new SqlParameter() { ParameterName = "@Village", Value = organiser.Village };
            paramArray[6] = new SqlParameter() { ParameterName = "@isActive", Value = organiser.isActive };
            paramArray[7] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };

            return paramArray;
        }
    }
}