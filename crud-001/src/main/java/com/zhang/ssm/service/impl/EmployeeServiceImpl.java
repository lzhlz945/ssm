package com.zhang.ssm.service.impl;

import com.zhang.ssm.bean.Employee;
import com.zhang.ssm.dao.EmployeeMapper;
import com.zhang.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: create by zhl
 * @version: v1.0
 * @description: com.zhang.ssm.service.impl
 * @date:2021/1/13
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> getAll() {

        List<Employee> list=employeeMapper.selectAll();
        return list;
    }
}
