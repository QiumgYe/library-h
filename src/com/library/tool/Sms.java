package com.library.tool;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

public class Sms {
	
	public boolean SendMessage(String stuphone,String code){
		//连接阿里云
	    DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4GGoUWjtBgav72dXK4qV", "5Lj5EhTffmbo1dsNKZ3osg3s5k3dQT");
	    IAcsClient client = new DefaultAcsClient(profile);
	    
	    //构建请求
	    CommonRequest request = new CommonRequest();
	    
	    //固定参数
	    request.setMethod(MethodType.POST);
	    request.setDomain("dysmsapi.aliyuncs.com");
	    request.setVersion("2017-05-25");
	    request.setAction("SendSms");
	    
	    //自定义参数
	    request.putQueryParameter("PhoneNumbers", stuphone);
	    request.putQueryParameter("SignName", "NoriLibrary");
	    request.putQueryParameter("TemplateCode", "SMS_192835219");
	    
	    //生成验证码并放入
	    String message = "{\"code\":\""+code+"\"}";
	    
	    //构建短信验证码
	    request.putQueryParameter("TemplateParam", message);
	    
	    try {
	        CommonResponse response = client.getCommonResponse(request);
	        System.out.println(response.getData());
	        //判断短信是否发送成功
	        if(response.getHttpResponse().isSuccess()){
	        	System.out.println("短信发送成功！");
	        }
	        return true;
	    } catch (ServerException e) {
	    	System.out.println("ServerException");
	        e.printStackTrace();
	    	return false;
	    } catch (ClientException e) {
	    	System.out.println("ClientException");
	        e.printStackTrace();
	    	return false;
	    }
	}
}
