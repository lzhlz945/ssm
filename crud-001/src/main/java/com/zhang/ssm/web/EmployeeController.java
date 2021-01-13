package com.zhang.ssm.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhang.ssm.bean.Employee;
import com.zhang.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author: create by zhl
 * @version: v1.0
 * @description: com.zhang.ssm.web
 * @date:2021/1/13
 */

@Controller
public class EmployeeController {


    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){

        PageHelper.startPage(pn,5);

        List<Employee> employeeList=employeeService.getAll();

        PageInfo<Employee> pageInfo=new PageInfo<>(employeeList);

        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
}
