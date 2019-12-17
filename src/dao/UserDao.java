package dao;

import entity.User;
import utils.DB;

import java.util.ArrayList;
import java.util.List;

public class UserDao
{
    private static String sql="";

    public static boolean updateUser(String username,User user) throws Exception
    {
        sql=" update users set username = '"+user.getUsername()+"' , password = '"+user.getPassword()+"' where username = '"+username+"'";
        return utils.DB.executeUpdate2(sql);
    }

    public static boolean deleteUser(String username) throws Exception
    {
        sql="delete from users where username = '"+username+"'";
        return utils.DB.executeUpdate2(sql);
    }

    public static boolean selectUser(String username,String password) throws Exception
    {
        List<User> res=new ArrayList<User>();
        sql="select * from users where username ='"+username+"' and password ='"+password+"'";
        try
        {
            res = DB.executeQuery2(sql);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return res != null;
    }

    public static boolean insertUser(User user) throws Exception
    {
        sql=" insert into users values ('"+user.getUsername()+"','"+user.getPassword()+"')";
        return utils.DB.executeUpdate2(sql);
    }

    public static List<User> selectUser(String username)throws Exception
    {
        List<User> res=new ArrayList<User>();
        String sql="select * from users where username = '"+username+"'";
        try
        {
            res = DB.executeQuery2(sql);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return res;
    }

    public static List<User> selectAllUser()throws Exception
    {
        String sql="select * from users";
        List<User> res=new ArrayList<User>();
        try
        {
            res = DB.executeQuery2(sql);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return res;
    }
}
