/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Enitiy.Setting;
import ConnectDB.ConnectJDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOSetting extends ConnectJDBC {

    Connection conn = ConnectJDBC.getConnection();

    ResultSet rs = null;
    PreparedStatement ps = null;

    public int addSetting(Setting st) {
        int n = 0;
        String sql = "insert into setting(type_id, setting_title, setting_value, display_order,status,note)\n"
                + "values(?,?,?,?,?,?)";
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, st.getType_id());
            ps.setString(2, st.getSetting_title());
            ps.setString(3, st.getSetting_value());
            ps.setString(4, st.getDisplay_order());
            ps.setInt(5, st.getStatus());
            ps.setString(6, st.getNote());
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return n;
    }

    public List<Setting> viewSettingList() {
        List<Setting> list = new ArrayList<>();
        String sql = "SELECt * FROM setting";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<Setting> searchSetting(int typeId, String title, int status) {
        List<Setting> list = new ArrayList<>();
        String sql = "SELECt * FROM setting \n"
                + "where type_id=" + typeId + " and setting_title like '%" + title + "%' and status= " + status + ";";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<Setting> SearchByNameS(String s) {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from setting where setting_title like '%" + s + "%'";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public Setting SearchSetID(String s) {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from setting where setting_id = " + s;
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                return new Setting(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public List<Setting> searchTypeID(String s) {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from setting where type_id = " + s;
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<Setting> SearchTitIDAndSta(String id, String status) {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from setting where type_id = " + id + " and status = " + status;
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<Setting> searchStatus(String s) {
        List<Setting> list = new ArrayList<>();
        String sql = "select * from setting where status = " + s;
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<Setting> searchSetting2(String s) {
        List<Setting> list = new ArrayList<>();
        String sql = "SELECt st.setting_id,t.type_title,st.setting_title,st.setting_value,st.display_order,st.status FROM setting st inner join type t\n"
                + "on st.type_id = t.type_id";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<Setting> viewTypeId() {
        List<Setting> list = new ArrayList<>();
        String sql = "SELECt distinct type_id FROM setting order by type_id ";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }
    
    public int deleteSetting(String settingId, String typeId) {
        int n = 0;
        String sql = "delete from setting \n"
                + "where setting_id = ? and type_id = ? ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, settingId);
            ps.setString(2, typeId);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }


    public List<Setting> viewSettingType(String settingType) { // search by name
        List<Setting> list = new ArrayList<>();
        String sql = "SELECt * FROM setting\n"
                + "where setting_title like '%" + settingType + "%';";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public int updateStatus(int status, int setting_id) {
        int n = 0;
        try {

            String sql = "update setting\n"
                    + " set status = ? where setting_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, setting_id);
            n = ps.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return n;
    }

    public List<Setting> viewType() {
        List<Setting> list = new ArrayList<>();
        String sql = "select distinct type_id from setting\n"
                + "order by type_id";
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                list.add(new Setting(rs.getInt(1)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }

    public ArrayList<String> viewAllType() {
        ArrayList<String> list = new ArrayList<>();
        String sql = "select distinct type_id from setting";
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                String type = rs.getString(1);
                list.add(type);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return list;
    }
    
    

    public static void main(String[] args) {
        DAOSetting dao = new DAOSetting();
        System.out.print(dao.viewTypeId());
        int n = dao.addSetting(new Setting(1, "me1", "me1", "me1", 1,"1"));
        if (n > 0) {
            System.out.println("success");
        } else {
            System.out.println("wrong");
        }
//        System.out.println(dao.SearchSetID("1"));
//
//        List<Setting> list = dao.viewType();
//        for (Setting temp : list) {
//            System.out.println(temp);
//        }
    }
}
