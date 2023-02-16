using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FactoryManagementSystem.DAL
{
    public class UserDAL
    {
        public DataTable GetAllUsers()
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[9];
            paramArray[0] = new SqlParameter() { ParameterName = "@UserId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@UserName", Value = "" };
            paramArray[2] = new SqlParameter() { ParameterName = "@Password", Value = "" };
            paramArray[3] = new SqlParameter() { ParameterName = "@Admin", Value = false };
            paramArray[4] = new SqlParameter() { ParameterName = "@User", Value = false };
            paramArray[5] = new SqlParameter() { ParameterName = "@Full", Value = false };
            paramArray[6] = new SqlParameter() { ParameterName = "@FactoryOnly", Value = false };
            paramArray[7] = new SqlParameter() { ParameterName = "@isActive", Value = false };
            paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = 5 };
            var ds = sqlHelper.ExecuteQuery("spUserCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public DataTable VerifyUserAuthentication(string strUserName, string strPassword)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = new SqlParameter[9];
            paramArray[0] = new SqlParameter() { ParameterName = "@UserId", Value = 0 };
            paramArray[1] = new SqlParameter() { ParameterName = "@UserName", Value = strUserName };
            paramArray[2] = new SqlParameter() { ParameterName = "@Password", Value = strPassword };
            paramArray[3] = new SqlParameter() { ParameterName = "@Admin", Value = false };
            paramArray[4] = new SqlParameter() { ParameterName = "@User", Value = false };
            paramArray[5] = new SqlParameter() { ParameterName = "@Full", Value = false };
            paramArray[6] = new SqlParameter() { ParameterName = "@FactoryOnly", Value = false };
            paramArray[7] = new SqlParameter() { ParameterName = "@isActive", Value = false };
            paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = 4 };
            var ds = sqlHelper.ExecuteQuery("spUserCRUD", CommandType.StoredProcedure, paramArray);
            return ds.Tables[0];
        }

        public void Save(Models.User user)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(user, 1);
            sqlHelper.ExecuteNonQuery("spUserCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Update(Models.User user)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(user, 2);
            sqlHelper.ExecuteNonQuery("spUserCRUD", CommandType.StoredProcedure, paramArray);
        }

        public void Delete(Models.User user)
        {
            var sqlHelper = new SQLDataAccessHelper();
            var paramArray = ComputeParams(user, 3);
            sqlHelper.ExecuteNonQuery("spUserCRUD", CommandType.StoredProcedure, paramArray);
        }

        private SqlParameter[] ComputeParams(Models.User user, int operatorType)
        {
            var paramArray = new SqlParameter[9];
            paramArray[0] = new SqlParameter() { ParameterName = "@UserId", Value = user.UserId };
            paramArray[1] = new SqlParameter() { ParameterName = "@UserName", Value = user.UserName };
            paramArray[2] = new SqlParameter() { ParameterName = "@Password", Value = user.Password };
            paramArray[3] = new SqlParameter() { ParameterName = "@Admin", Value = user.AdminModule };
            paramArray[4] = new SqlParameter() { ParameterName = "@User", Value = user.UserModule };
            paramArray[5] = new SqlParameter() { ParameterName = "@Full", Value = user.FullAccess };
            paramArray[6] = new SqlParameter() { ParameterName = "@FactoryOnly", Value = user.FactoryOnly };
            paramArray[7] = new SqlParameter() { ParameterName = "@isActive", Value = user.isActive };
            paramArray[8] = new SqlParameter() { ParameterName = "@OperationType", Value = operatorType };

            return paramArray;
        }
    }
}