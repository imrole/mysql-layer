package utils;

import entity.User;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DB
{
    private static final String url="jdbc:mysql://localhost:3306/mk_lx?serverTimezone=CTT";
    private static final String un="root";
    private static final String pwd="111111";

    public static Connection getConnection()throws Exception
    {
        Connection conn=null;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            if (conn == null)
            {
                conn = DriverManager.getConnection(url, un, pwd);
                return conn;
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return conn;
    }

    //用于增删改

    public static boolean executeUpdate(String sql)throws Exception
    {
        Connection conn =null;
        Statement stmt=null;
        int res=0;
        try
        {
            conn = getConnection();
            stmt = conn.createStatement();
            res = stmt.executeUpdate(sql);
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                if(stmt!=null)
                {
                    stmt.close();
                }
                if(conn!=null)
                {
                    conn.close();
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        return res > 0;
    }

    public static boolean executeUpdate2(String sql)throws Exception
    {
        Statement stmt=null;
        Connection conn=null;
        int res=0;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, un, pwd);
            stmt = conn.createStatement();
            res=stmt.executeUpdate(sql);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                if(stmt!=null)
                {
                    stmt.close();
                }
                if(conn!=null)
                {
                    conn.close();
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }

        }
        return res >0;
    }

    //用于查询

    public static List<User> executeQuery(String sql) throws Exception
    {
        Connection conn = null;
        Statement stmt = null;
        ResultSet res = null;
        List<User> resultListl=new ArrayList<User>();
        try
        {
            conn = getConnection();
            stmt = conn.createStatement();
            res = stmt.executeQuery(sql);
            while(res.next())
            {
                User ru=new User();
                ru.setUsername(res.getString("username"));
                ru.setPassword(res.getString("password"));
                resultListl.add(ru);
            }
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try
            {
                if(res!=null)
                {
                    res.close();
                }
                if(stmt!=null)
                {
                    stmt.close();
                }
                if(conn!=null)
                {
                    conn.close();
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        return resultListl;
    }

    public static List<User> executeQuery2(String sql)throws Exception
    {
        Statement stmt = null;
        Connection conn = null;
        ResultSet res = null;
        List<User> resultListl = new ArrayList<User>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, un, pwd);
            stmt = conn.createStatement();
            res = stmt.executeQuery(sql);
            while (res.next()) {
                User ru = new User();
                ru.setUsername(res.getString("username"));
                ru.setPassword(res.getString("password"));
                resultListl.add(ru);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            try {
                if (res != null)
                {
                    res.close();
                }
                if (stmt != null)
                {
                    stmt.close();
                }
                if (conn != null)
                {
                    conn.close();
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
        return resultListl;
    }
}
