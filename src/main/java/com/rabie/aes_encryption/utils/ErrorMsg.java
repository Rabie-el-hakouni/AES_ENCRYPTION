package com.rabie.aes_encryption.utils;

public class ErrorMsg {
    private String msg;
    private String typeError;

    public ErrorMsg(String msg, String typeError) {
        this.msg = msg;
        this.typeError = typeError;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getTypeError() {
        return typeError;
    }

    public void setTypeError(String typeError) {
        this.typeError = typeError;
    }
}
