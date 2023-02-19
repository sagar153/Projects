using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class OrgAdvanceDAL
    {
        public DataTable GetOrAdvanceByYear(string strYear, bool isActiveOnly, int intAdvanceId = 0)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[9];
            if (intAdvanceId > 0)
                paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserAdvanceId", Value = intAdvanceId };
            else
                paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserAdvanceId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[2] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[3] = new SqlParameter() { ParameterName = "@OrganiserName", Value = "" };
            paramArray[4] = new SqlParameter() { ParameterName = "@Advance", Value = 0.0 };
            paramArray[5] = new SqlParameter() { ParameterName = "@AdvanceDate", Value = DateTime.Now };
            paramArray[6] = new SqlParameter() { ParameterName = "@Mode", Value = "" };
            paramArray[7] = new SqlParameter() { ParameterName = "@Remarks", Value = "" }; 

            if (intAdvanceId > 0)
                paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = 6 };
            else if (isActiveOnly)
                paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            else
                paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spOrgAdvanceCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetDistinctOrgAdvance(string strYear)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[9];
            paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserAdvanceId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[2] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[3] = new SqlParameter() { ParameterName = "@OrganiserName", Value = "" };
            paramArray[4] = new SqlParameter() { ParameterName = "@Advance", Value = 0.0 };
            paramArray[5] = new SqlParameter() { ParameterName = "@AdvanceDate", Value = DateTime.Now };
            paramArray[6] = new SqlParameter() { ParameterName = "@Mode", Value = "" };
            paramArray[7] = new SqlParameter() { ParameterName = "@Remarks", Value = "" }; 
            paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = 7 };

            var ds = sqlHelper.ExecuteQuery("spOrgAdvanceCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable GetAdvanceByOrganiser(string strYear, string OrganiserName)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[9];
            paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserAdvanceId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@Year", Value = strYear };
            paramArray[2] = new SqlParameter() { ParameterName = "@OrganiserId", Value = 0 };
            paramArray[3] = new SqlParameter() { ParameterName = "@OrganiserName", Value = OrganiserName };
            paramArray[4] = new SqlParameter() { ParameterName = "@Advance", Value = 0.0 };
            paramArray[5] = new SqlParameter() { ParameterName = "@AdvanceDate", Value = DateTime.Now };
            paramArray[6] = new SqlParameter() { ParameterName = "@Mode", Value = "" };
            paramArray[7] = new SqlParameter() { ParameterName = "@Remarks", Value = "" };
            paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = 8 };

            var ds = sqlHelper.ExecuteQuery("spOrgAdvanceCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.OrgAdvance orgAdv)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(orgAdv, 1);
            sqlHelper.ExecuteNonQuery("spOrgAdvanceCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Update(Models.OrgAdvance orgAdv)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(orgAdv, 2);
            sqlHelper.ExecuteNonQuery("spOrgAdvanceCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Delete(Models.OrgAdvance orgAdv)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(orgAdv, 3);
            sqlHelper.ExecuteNonQuery("spOrgAdvanceCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.OrgAdvance orgAdv, int operatorType)
        {
            var paramArray = new SqlParameter[9];
            paramArray[0] = new SqlParameter() { ParameterName = "@OrganiserAdvanceId", Value = orgAdv.OrganiserAdvanceId };
            paramArray[1] = new SqlParameter() { ParameterName = "@Year", Value = orgAdv.Year };
            paramArray[2] = new SqlParameter() { ParameterName = "@OrganiserId", Value = orgAdv.OrganiserId };
            paramArray[3] = new SqlParameter() { ParameterName = "@OrganiserName", Value = orgAdv.OrganiserName };
            paramArray[4] = new SqlParameter() { ParameterName = "@Advance", Value = orgAdv.Advance };
            paramArray[5] = new SqlParameter() { ParameterName = "@AdvanceDate", Value = orgAdv.AdvanceDate };
            paramArray[6] = new SqlParameter() { ParameterName = "@Mode", Value = orgAdv.Mode };
            paramArray[7] = new SqlParameter() { ParameterName = "@Remarks", Value = orgAdv.Remarks };
            paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };


            return paramArray;
        }
    }
}