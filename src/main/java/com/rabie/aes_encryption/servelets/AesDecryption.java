package com.rabie.aes_encryption.servelets;

import com.rabie.aes_encryption.models.Aes;
import com.rabie.aes_encryption.utils.ErrorMsg;
import com.rabie.aes_encryption.utils.Result;
import com.rabie.aes_encryption.utils.Util;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "aesdecryption", value = "/aes-decryption")
public class AesDecryption extends HttpServlet {
    private static Aes cipher;
    private static Util util;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Result res = new Result();
        byte[] key = request.getParameter("key").getBytes();
        byte [] inputText = util.hexToByte(request.getParameter("message"));
        res.setKey(request.getParameter("key"));
        res.setMode(request.getParameter("mode"));
        res.setMessage(request.getParameter("message"));
        res.setSize(new Integer(request.getParameter("size"))/8);
        res.setType(false);


        if (res.getSize() == res.getKey().length()) {

            if (res.getMode().equals("ECB")) {
                cipher = new Aes(key);
                res.setResult(cipher.ECB_decrypt(inputText));
            } else if (res.getMode().equals("CBC")) {
                byte[] iv = "c8IKDNGsbioSlwUH".getBytes();
                cipher = new Aes(key, iv);
                res.setResult(cipher.CBC_decrypt(inputText));
            }

            request.setAttribute("result", res);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } else {
            ErrorMsg errorMsg = new ErrorMsg("la taille du clé n'est pas valide", "D");
            request.setAttribute("error", errorMsg);
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }
}
