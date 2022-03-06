package com.dwg.controller;

import com.dwg.entity.Admin;
import com.dwg.entity.Orders;
import com.dwg.entity.User;
import com.dwg.service.OrdersService;
import com.dwg.service.UserService;
import com.dwg.utils.CodeImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.jms.Session;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userServiceImpl;

    @Autowired
    private OrdersService ordersServiceImpl;

    @RequestMapping("/allUser")
    public String allUser(Model model){
        List<User> userList = userServiceImpl.allUser();
        model.addAttribute("userList",userList);
        return "";
    }

    @RequestMapping("/getCode")
    public void getCode(HttpSession session, HttpServletResponse response) throws IOException {
        Object[] objects = CodeImageUtil.createImage();
        String code  =(String) objects[0];
        BufferedImage image = (BufferedImage) objects[1];

        OutputStream stream = response.getOutputStream();
        ImageIO.write(image,"png",stream);
        session.setAttribute("code",code);
    }


    @RequestMapping("/loginUser")
    public String queryUser(String userName, String passWord,String verifycode, HttpServletRequest request){
        User user = userServiceImpl.queryUser(userName, passWord);
        HttpSession session = request.getSession();
        String  code = (String) session.getAttribute("code");
        //查看是否存在这个用户
        if (user==null){
            request.setAttribute("error","账号或密码有误！");
            return "/login";
        }else if(!verifycode.equalsIgnoreCase(code)){
            request.setAttribute("error","验证码有误！");
            return "/login";
        }else{
            session.setAttribute("user",user);
            System.out.println(session.getAttribute("user"));
        }
        return "redirect:/homePage";
    }

    @RequestMapping("/register")
    public String addUser(User user){
        boolean i = userServiceImpl.registerUser(user);
        //如果添加成功
        if (i==true) {
            return "/login";
        }
        return "/register";
    }

    @RequestMapping("/loginOut")
    String loginOut(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        session.removeAttribute("ordersList");
        return "redirect:/homePage";
    }

    @RequestMapping("/edit")
    String editUser(Model model,HttpSession session){
        User user = (User) session.getAttribute("user");
        model.addAttribute("user",user);
        return "/edit";
    }

    @RequestMapping(value="/changeUserIntro/{changeWhat}")
    @ResponseBody
    Integer changeUserName(@PathVariable("changeWhat") String changeWhat,String userIntro,HttpServletRequest request){
        Integer flag = 0;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (changeWhat.equals("用户名:")){
            flag = userServiceImpl.changeUserName(userIntro,user.getId());
        }
        if (changeWhat.equals("新密码:")){
            flag = userServiceImpl.changePwd(userIntro,user.getId());
        }
        if (changeWhat.equals("新邮箱:")){
            flag = userServiceImpl.changeEmail(userIntro,user.getId());
        }
        if (changeWhat.equals("新地址:")){
            flag = userServiceImpl.changeAddress(userIntro,user.getId());
        }
        return flag;
    }

    //头像上传
    @RequestMapping("/uploadIcon")
    @ResponseBody
    Integer uploadHeaderIcon(@RequestParam("icon") MultipartFile icon,HttpSession session)throws IOException{
        User user = (User) session.getAttribute("user");
        //获取文件的名字,带后缀
        String originalFilename = icon.getOriginalFilename();
        System.out.println(originalFilename);

        // 获取servlet上下文对象
        /*ServletContext contextPath = session.getServletContext();
        String realPath = contextPath.getRealPath("/static/headerIcon");*/
        //System.out.println(realPath);
        String realPath = "E:\\WebProject\\Myth\\web\\static\\headerIcon";
        String headerIconPath = realPath +"/"+user.getId();
        System.out.println("finalPath:"+headerIconPath);
        //以用户id作为标识符来创建文件
        File file  =new File(headerIconPath);

        //如果文件不存在则创建一个文件
        if(!file.exists()){
            file.mkdir();
        }
        // 在数据库中存放的user头像的目录：/static/header-icon/{userId}/{fileUploadName}
        String fianlPath = headerIconPath+"/"+originalFilename;

        //将文件上传至目录
        icon.transferTo(new File(fianlPath));

        String dBIconFilePath = "static/headerIcon/"+user.getId()+"/"+originalFilename;
        Integer i = userServiceImpl.uploadHeaderIcon(user.getId(),dBIconFilePath);
        return i;
    }


    @RequestMapping("/resetUserAllIntro")
    String restUserAllIntro(String userName,String email,String address,String pwd,Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Integer nexus = userServiceImpl.resetUserAllIntro(userName,email,address,pwd,user.getId());
        model.addAttribute("nexus",nexus);
        return "/edit";
    }


    /*=============管理员模块================*/
    @RequestMapping("/adminLogin")
    String adminLogin(String name,String password,Model model,HttpSession session){
        Admin admin = userServiceImpl.queryAdmin(name,password);
        if(admin == null){
            model.addAttribute("loginMsg","密码或用户名错误！");
            return "/admin/login";
        }
        session.setAttribute("admin",admin);
        return "/admin/admin";
    }

    @RequestMapping("adminLoginOut")
    String adminLoginOut(HttpSession session){
        session.removeAttribute("admin");
        return "/admin/login";
    }
    @RequestMapping("/listUser")
    @ResponseBody
    List<User> listUser(){
        List<User>  userList =  userServiceImpl.listUser();
        return userList;
    }

    @RequestMapping("/userDel")
    @ResponseBody
    Integer userDel(Integer uId){ return userServiceImpl.userDel(uId); }

    @RequestMapping("/userSearch")
    @ResponseBody
    List<User> userSearch(String userName){
        User data = userServiceImpl.userSearch(userName);
        ArrayList<User> users = new ArrayList<>();
        users.add(data);
        return users;
    }
}
