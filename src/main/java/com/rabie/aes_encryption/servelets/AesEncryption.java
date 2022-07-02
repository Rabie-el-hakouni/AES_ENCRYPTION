package com.rabie.aes_encryption.servelets;

import com.rabie.aes_encryption.models.Aes;
import com.rabie.aes_encryption.utils.ErrorMsg;
import com.rabie.aes_encryption.utils.Result;
import com.rabie.aes_encryption.utils.Util;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "aesencryption", value = "/aes-encryption")
public class AesEncryption extends HttpServlet {

    private static Aes cipher;
    private static Util util;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Result res = new Result();
        byte[] key = request.getParameter("key").getBytes();
        res.setMessage(request.getParameter("message"));
        res.setKey(request.getParameter("key"));
        res.setMode(request.getParameter("mode"));
        res.setSize(new Integer(request.getParameter("size"))/8);
        res.setMessage(util.fillBlock(res.getMessage()));
        res.setType(true);
        byte [] inputText = res.getMessage().getBytes();
        if(res.getSize() == res.getKey().length()){
            if(res.getMode().equals("ECB")){
                cipher = new Aes(key);
                res.setResult(cipher.ECB_encrypt(inputText));
            }else if(res.getMode().equals("CBC")){
                byte[] iv = "c8IKDNGsbioSlwUH".getBytes();
                cipher = new Aes(key , iv);
                res.setResult(cipher.CBC_encrypt(inputText));
                System.out.println("Encryption : -->"+res.getMode() + " : " + new String(res.getResult()));
                System.out.println("Decryption : -->"+res.getMode() + "" +new String(cipher.CBC_decrypt(res.getResult())));
            }
            request.setAttribute("result", res);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        }else{
            ErrorMsg errorMsg = new ErrorMsg("la taille du clé n'est pas valide" , "E");
            request.setAttribute("error", errorMsg);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }


    }

}