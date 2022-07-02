package com.rabie.aes_encryption.utils;

import java.util.Arrays;

public class Result {
    private String message;
    private String key;
    private boolean type;
    private byte [] result;
    private int size;
    private String mode;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getKey() {
        return key;
    }

    @Override
    public String toString() {
        return "Result{" +
                "message='" + message + '\'' +
                ", key='" + key + '\'' +
                ", type=" + type +
                ", result=" + Arrays.toString(result) +
                ", size=" + size +
                ", mode='" + mode + '\'' +
                '}';
    }

    public void setKey(String key) {
        this.key = key;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public byte[] getResult() {
        return result;
    }

    public void setResult(byte[] result) {
        this.result = result;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

}
