package com.team3.groupware.seongyu.model;

import com.team3.groupware.common.model.EmployeeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class EDMSDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    public List<EmployeeVO> select_emp_list() {
        return sqlSessionTemplate.selectList("employee.select_emp_dept");
    }

    public int insert_general(EDMS_new_generalVO edms_new_generalVO) {
        int insert_docu = sqlSessionTemplate.insert("EDMS.insert_docu", edms_new_generalVO);
        int insert_approval = sqlSessionTemplate.insert("EDMS.insert_approval", edms_new_generalVO);
        int insert_general = sqlSessionTemplate.insert("EDMS.insert_general", edms_new_generalVO);



        return 1;
    }

    public int insert_expense(EDMS_new_expenseVO edms_new_expenseVO) {
        int insert_docu = sqlSessionTemplate.insert("EDMS.insert_docu", edms_new_expenseVO);
        int insert_approval = sqlSessionTemplate.insert("EDMS.insert_approval", edms_new_expenseVO);
        int insert_expense = sqlSessionTemplate.insert("EDMS.insert_expense", edms_new_expenseVO);

        return 1;
    }

    public int insert_certificate(EDMS_new_certificateVO edms_new_certificateVO) {
        int insert_docu = sqlSessionTemplate.insert("EDMS.insert_docu", edms_new_certificateVO);
        int insert_approval = sqlSessionTemplate.insert("EDMS.insert_approval", edms_new_certificateVO);
        int insert_certificate = sqlSessionTemplate.insert("EDMS.insert_certificate", edms_new_certificateVO);

        return 0;
    }

    public List<Map<String, Object>> select_EDMS_docu_ing(Map<String, Object> map) {
        return sqlSessionTemplate.selectList("EDMS.select_EDMS_docu_ing", map);
    }

    public void insertFile(Map<String, Object> map) throws Exception {
        System.out.println(map);
        sqlSessionTemplate.insert("EDMS.insertFile", map);
        Map<String, Object> file_no = sqlSessionTemplate.selectOne("EDMS.select_file_no", map);
        sqlSessionTemplate.update("EDMS.update_file_no", file_no);
    }
}
