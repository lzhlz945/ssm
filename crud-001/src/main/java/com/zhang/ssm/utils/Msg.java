package com.zhang.ssm.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author: create by zhl
 * @version: v1.0
 * @description: com.zhang.ssm.utils
 * @date:2021/1/14
 */
public class Msg {

    private Msg(){

    }
    private Integer code;
    private String message;
    private Map<String,Object> map=new HashMap<>();

    public static Msg success(){
        Msg msg = new Msg();

        msg.setCode(100);
        msg.setMessage("请求成功");
        return msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();

        msg.setCode(200);
        msg.setMessage("请求失败");
        return msg;
    }

    public  Msg add(String str,Object obj){
       this.getMap().put(str,obj);
        return this;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
