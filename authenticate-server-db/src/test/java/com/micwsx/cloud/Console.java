package com.micwsx.cloud;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author Michael
 * @create 9/10/2020 10:26 AM
 */
public class Console {
    public static void main(String[] args) {
        String value="bd09e98e-98a9-472d-8686-a8bfe9fcb4a2";
        MessageDigest digest;
        try {
            digest = MessageDigest.getInstance("MD5");
        }
        catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("MD5 algorithm not available.  Fatal (should be in the JDK).");
        }
        try {
            byte[] bytes = digest.digest(value.getBytes("UTF-8"));
            String result= String.format("%032x", new BigInteger(1, bytes));
            System.out.println(result);
        }
        catch (UnsupportedEncodingException e) {
            throw new IllegalStateException("UTF-8 encoding not available.  Fatal (should be in the JDK).");
        }
    }
}
