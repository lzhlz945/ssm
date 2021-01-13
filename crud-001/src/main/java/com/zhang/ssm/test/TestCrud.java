package com.zhang.ssm.test;

import com.zhang.ssm.bean.Department;
import com.zhang.ssm.bean.Employee;
import com.zhang.ssm.dao.DepartmentMapper;
import com.zhang.ssm.dao.EmployeeMapper;
import com.zhang.ssm.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author: create by zhl
 * @version: v1.0
 * @description: com.zhang.ssm.test
 * @date:2021/1/13
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class TestCrud {

    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private DepartmentMapper departmentMapper;

    //添加员工
    @Test
    public void test01(){
        System.out.println(employeeMapper);
        Employee employee = new Employee();
        employee.setEmpId(1);
        employee.setEmpName("星儿");
        employee.setEmail("xer@qq.com");
        employee.setGender("0");
        employee.setdId(1);
        employeeMapper.updateByPrimaryKey(employee);
    }

    //添加部门
    @Test
    public void test02(){

        Department department = new Department();
        department.setDeptName("开发部");
        departmentMapper.insertSelective(department);

    }
}
