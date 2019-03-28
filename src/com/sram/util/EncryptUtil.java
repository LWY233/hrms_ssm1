package com.sram.util;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

public class EncryptUtil {  

    public static String key = "LmMGStGtOpF4xNyvYt54EQ==";  
  
    public static String encrypt(String xmlStr) {  
        byte[] encrypt = null;  
  
        try {  
           
            encrypt = xmlStr.getBytes("utf-8");  
        } catch (UnsupportedEncodingException e) {  
            e.printStackTrace();  
        }  
  
        byte[] md5Hasn = null;  
        try {  
            md5Hasn = EncryptUtil.MD5Hash(encrypt, 0, encrypt.length);
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        // 锟斤拷锟斤拷锟较拷锟� 
        byte[] totalByte = EncryptUtil.addMD5(md5Hasn, encrypt);
  
        // 取锟斤拷钥锟斤拷偏转锟斤拷锟斤拷  
        byte[] key = new byte[8];  
        byte[] iv = new byte[8];  
        getKeyIV(EncryptUtil.key, key, iv);
        SecretKeySpec deskey = new SecretKeySpec(key, "DES");  
        IvParameterSpec ivParam = new IvParameterSpec(iv);  
  
        // 使锟斤拷DES锟姐法使锟矫硷拷锟斤拷锟斤拷息锟斤拷  
        byte[] temp = null;  
        try {  
            temp = EncryptUtil.DES_CBC_Encrypt(totalByte, deskey, ivParam);
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
        // 使锟斤拷Base64锟斤拷锟杰后返伙拷  
        return new BASE64Encoder().encode(temp);  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�encrypt</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     * 锟斤拷锟杰凤拷锟斤拷 
     * </pre> 
     *  
     * </li> 
     *  
     * @param xmlStr 
     *            锟斤拷要锟斤拷锟杰碉拷锟斤拷息锟街凤拷 
     * @return 锟斤拷锟杰猴拷锟斤拷址锟�
     * @throws Exception 
     */  
    public static String decrypt(String xmlStr) throws Exception {  
        // base64锟斤拷锟斤拷  
        BASE64Decoder decoder = new BASE64Decoder();  
        byte[] encBuf = null;  
        try {  
            encBuf = decoder.decodeBuffer(xmlStr);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
  
        // 取锟斤拷钥锟斤拷偏转锟斤拷锟斤拷  
        byte[] key = new byte[8];  
        byte[] iv = new byte[8];  
        getKeyIV(EncryptUtil.key, key, iv);
  
        SecretKeySpec deskey = new SecretKeySpec(key, "DES");  
        IvParameterSpec ivParam = new IvParameterSpec(iv);  
  
        // 使锟斤拷DES锟姐法锟斤拷锟斤拷  
        byte[] temp = null;  
        try {  
            temp = EncryptUtil.DES_CBC_Decrypt(encBuf, deskey, ivParam);
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
        // 锟斤拷锟叫斤拷锟杰猴拷锟絤d5Hash校锟斤拷  
        byte[] md5Hash = null;  
        try {  
            md5Hash = EncryptUtil.MD5Hash(temp, 16, temp.length - 16);
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
  
        // 锟斤拷锟叫斤拷锟斤拷校锟斤拷  
        for (int i = 0; i < md5Hash.length; i++) {  
            if (md5Hash[i] != temp[i]) {  
                // System.out.println(md5Hash[i] + "MD5校锟斤拷锟斤拷锟� + temp[i]);  
                throw new Exception("MD5");  
            }  
        }  
  
        // 锟斤拷锟截斤拷锟杰猴拷锟斤拷锟斤拷椋拷锟斤拷锟角�6位MD5Hash锟斤拷要锟斤拷去锟斤拷  
        return new String(temp, 16, temp.length - 16, "utf-8");  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�TripleDES_CBC_Encrypt</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     * 锟斤拷锟斤拷锟阶帮拷锟斤拷锟斤拷锟紻ES/CBC锟斤拷锟斤拷锟姐法锟斤拷锟斤拷锟斤拷锟斤拷锟侥ｏ拷锟斤拷注锟斤拷锟斤拷搿�
     * </pre> 
     *  
     * </li> 
     *  
     * @param sourceBuf 
     *            锟斤拷要锟斤拷锟斤拷锟斤拷锟捷碉拷锟街斤拷锟斤拷锟介。 
     * @param deskey 
     *            KEY 锟斤拷24位锟街斤拷锟斤拷锟斤拷通锟斤拷SecretKeySpec锟斤拷转锟斤拷锟斤拷伞锟�
     * @param ivParam 
     *            IV偏转锟斤拷锟斤拷锟斤拷锟斤拷8位锟街斤拷锟斤拷锟斤拷通锟斤拷IvParameterSpec锟斤拷转锟斤拷锟斤拷伞锟�
     * @return 锟斤拷锟杰猴拷锟斤拷纸锟斤拷锟斤拷锟�
     * @throws Exception 
     */  
    public static byte[] TripleDES_CBC_Encrypt(byte[] sourceBuf,  
            SecretKeySpec deskey, IvParameterSpec ivParam) throws Exception {  
        byte[] cipherByte;  
        // 使锟斤拷DES锟皆称硷拷锟斤拷锟姐法锟斤拷CBC模式锟斤拷锟斤拷  
        Cipher encrypt = Cipher.getInstance("TripleDES/CBC/PKCS5Padding");  
  
        encrypt.init(Cipher.ENCRYPT_MODE, deskey, ivParam);  
  
        cipherByte = encrypt.doFinal(sourceBuf, 0, sourceBuf.length);  
        // 锟斤拷锟截硷拷锟杰猴拷锟斤拷纸锟斤拷锟斤拷锟� 
        return cipherByte;  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�TripleDES_CBC_Decrypt</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     * 锟斤拷锟斤拷锟阶帮拷锟斤拷锟斤拷锟紻ES / CBC锟斤拷锟斤拷锟姐法 
     * </pre> 
     *  
     * </li> 
     *  
     * @param sourceBuf 
     *            锟斤拷要锟斤拷锟斤拷锟斤拷锟捷碉拷锟街斤拷锟斤拷锟斤拷 
     * @param deskey 
     *            KEY 锟斤拷24位锟街斤拷锟斤拷锟斤拷通锟斤拷SecretKeySpec锟斤拷转锟斤拷锟斤拷伞锟�
     * @param ivParam 
     *            IV偏转锟斤拷锟斤拷锟斤拷锟斤拷6位锟街斤拷锟斤拷锟斤拷通锟斤拷IvParameterSpec锟斤拷转锟斤拷锟斤拷伞锟�
     * @return 锟斤拷锟杰猴拷锟斤拷纸锟斤拷锟斤拷锟�
     * @throws Exception 
     */  
    public static byte[] TripleDES_CBC_Decrypt(byte[] sourceBuf,  
            SecretKeySpec deskey, IvParameterSpec ivParam) throws Exception {  
  
        byte[] cipherByte;  
        // 锟斤拷锟紺ipher实锟斤拷使锟斤拷CBC模式锟斤拷  
        Cipher decrypt = Cipher.getInstance("TripleDES/CBC/PKCS5Padding");  
        // 锟斤拷始锟斤拷锟斤拷锟斤拷实锟斤拷锟斤拷为锟斤拷锟杰癸拷锟杰ｏ拷锟斤拷锟斤拷锟斤拷锟斤拷钥锟斤拷偏转锟斤拷锟斤拷  
        decrypt.init(Cipher.DECRYPT_MODE, deskey, ivParam);  
  
        cipherByte = decrypt.doFinal(sourceBuf, 0, sourceBuf.length);  
        // 锟斤拷锟截斤拷锟杰猴拷锟斤拷纸锟斤拷锟斤拷锟� 
        return cipherByte;  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�DES_CBC_Encrypt</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     * 锟斤拷锟斤拷锟阶帮拷锟紻ES/CBC锟斤拷锟斤拷锟姐法锟斤拷锟斤拷锟斤拷锟斤拷锟侥ｏ拷锟斤拷注锟斤拷锟斤拷搿�
     * </pre> 
     *  
     * </li> 
     *  
     * @param sourceBuf 
     *            锟斤拷要锟斤拷锟斤拷锟斤拷锟捷碉拷锟街斤拷锟斤拷锟介。 
     * @param deskey 
     *            KEY 锟斤拷8位锟街斤拷锟斤拷锟斤拷通锟斤拷SecretKeySpec锟斤拷转锟斤拷锟斤拷伞锟�
     * @param ivParam 
     *            IV偏转锟斤拷锟斤拷锟斤拷锟斤拷8位锟街斤拷锟斤拷锟斤拷通锟斤拷IvParameterSpec锟斤拷转锟斤拷锟斤拷伞锟�
     * @return 锟斤拷锟杰猴拷锟斤拷纸锟斤拷锟斤拷锟�
     * @throws Exception 
     */  
    public static byte[] DES_CBC_Encrypt(byte[] sourceBuf,  
            SecretKeySpec deskey, IvParameterSpec ivParam) throws Exception {  
        byte[] cipherByte;  
        // 使锟斤拷DES锟皆称硷拷锟斤拷锟姐法锟斤拷CBC模式锟斤拷锟斤拷  
        Cipher encrypt = Cipher.getInstance("DES/CBC/PKCS5Padding");  
  
        encrypt.init(Cipher.ENCRYPT_MODE, deskey, ivParam);  
  
        cipherByte = encrypt.doFinal(sourceBuf, 0, sourceBuf.length);  
        // 锟斤拷锟截硷拷锟杰猴拷锟斤拷纸锟斤拷锟斤拷锟� 
        return cipherByte;  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�DES_CBC_Decrypt</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     * 锟斤拷锟斤拷锟阶帮拷锟紻ES/CBC锟斤拷锟斤拷锟姐法锟斤拷 
     * </pre> 
     *  
     * </li> 
     *  
     * @param sourceBuf 
     *            锟斤拷要锟斤拷锟斤拷锟斤拷锟捷碉拷锟街斤拷锟斤拷锟斤拷 
     * @param deskey 
     *            KEY 锟斤拷8位锟街斤拷锟斤拷锟斤拷通锟斤拷SecretKeySpec锟斤拷转锟斤拷锟斤拷伞锟�
     * @param ivParam 
     *            IV偏转锟斤拷锟斤拷锟斤拷锟斤拷6位锟街斤拷锟斤拷锟斤拷通锟斤拷IvParameterSpec锟斤拷转锟斤拷锟斤拷伞锟�
     * @return 锟斤拷锟杰猴拷锟斤拷纸锟斤拷锟斤拷锟�
     * @throws Exception 
     */  
    public static byte[] DES_CBC_Decrypt(byte[] sourceBuf,  
            SecretKeySpec deskey, IvParameterSpec ivParam) throws Exception {  
  
        byte[] cipherByte;  
        // 锟斤拷锟紺ipher实锟斤拷使锟斤拷CBC模式锟斤拷  
        Cipher decrypt = Cipher.getInstance("DES/CBC/PKCS5Padding");  
        // 锟斤拷始锟斤拷锟斤拷锟斤拷实锟斤拷锟斤拷为锟斤拷锟杰癸拷锟杰ｏ拷锟斤拷锟斤拷锟斤拷锟斤拷钥锟斤拷偏转锟斤拷锟斤拷  
        decrypt.init(Cipher.DECRYPT_MODE, deskey, ivParam);  
  
        cipherByte = decrypt.doFinal(sourceBuf, 0, sourceBuf.length);  
        // 锟斤拷锟截斤拷锟杰猴拷锟斤拷纸锟斤拷锟斤拷锟� 
        return cipherByte;  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�MD5Hash</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     * MD5锟斤拷锟斤拷锟斤拷锟剿简单的凤拷装锟斤拷锟斤拷锟斤拷锟斤拷锟节加ｏ拷锟斤拷锟斤拷锟街凤拷锟叫ｏ拷椤�
     * </pre> 
     *  
     * </li> 
     *  
     * @param buf 
     *            锟斤拷要MD5锟斤拷锟斤拷锟街斤拷锟斤拷锟介。 
     * @param offset 
     *            锟斤拷锟斤拷锟斤拷锟斤拷锟绞嘉伙拷谩锟�
     * @param length 
     *            锟斤拷要锟斤拷锟杰碉拷锟斤拷锟介长锟饺★拷 
     * @return 
     * @throws Exception 
     */  
    public static byte[] MD5Hash(byte[] buf, int offset, int length)  
            throws Exception {  
        MessageDigest md = MessageDigest.getInstance("MD5");  
        md.update(buf, offset, length);  
        return md.digest();  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�byte2hex</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     * 锟街斤拷锟斤拷锟斤拷转锟斤拷为锟斤拷锟斤拷锟狡憋拷示 
     * </pre> 
     *  
     * </li> 
     *  
     * @param inStr 
     *            锟斤拷要转锟斤拷锟街斤拷锟斤拷锟介。 
     * @return 锟街斤拷锟斤拷锟斤拷亩锟斤拷锟斤拷票锟绞撅拷锟�
     */  
    public static String byte2hex(byte[] inStr) {  
        String stmp;  
        StringBuffer out = new StringBuffer(inStr.length * 2);  
  
        for (int n = 0; n < inStr.length; n++) {  
            // 锟街斤拷锟斤拷"锟斤拷"锟斤拷锟姐，去锟斤拷锟轿伙拷锟斤拷纸锟�11111111  
            stmp = Integer.toHexString(inStr[n] & 0xFF);  
            if (stmp.length() == 1) {  
                // 锟斤拷锟斤拷锟�锟斤拷F锟侥碉拷位锟街凤拷锟斤拷锟斤拷锟�  
                out.append("0" + stmp);  
            } else {  
                out.append(stmp);  
            }  
        }  
        return out.toString();  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�addMD5</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     * MD校锟斤拷锟斤拷 锟斤拷戏锟斤拷锟斤拷锟角�6位锟斤拷MD5Hash锟诫。 锟斤拷MD5锟斤拷证锟斤拷byte[]锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷byte[]锟斤拷系姆锟斤拷锟斤拷锟�
     * </pre> 
     *  
     * </li> 
     *  
     * @param md5Byte 
     *            锟斤拷锟斤拷锟斤拷锟捷碉拷MD5Hash锟街斤拷锟斤拷锟介。 
     * @param bodyByte 
     *            锟斤拷锟斤拷锟斤拷锟斤拷锟街斤拷锟斤拷锟斤拷 
     * @return 锟斤拷虾锟斤拷锟街斤拷锟斤拷锟介，锟饺硷拷锟斤拷锟斤拷锟捷筹拷16锟斤拷锟街节★拷 
     */  
    public static byte[] addMD5(byte[] md5Byte, byte[] bodyByte) {  
        int length = bodyByte.length + md5Byte.length;  
        byte[] resutlByte = new byte[length];  
  
        // 前16位锟斤拷MD5Hash锟斤拷  
        for (int i = 0; i < length; i++) {  
            if (i < md5Byte.length) {  
                resutlByte[i] = md5Byte[i];  
            } else {  
                resutlByte[i] = bodyByte[i - md5Byte.length];  
            }  
        }  
  
        return resutlByte;  
    }  
  
    /** 
     * <li> 
     * 锟斤拷锟斤拷锟斤拷锟�getKeyIV</li> <li> 
     * 锟斤拷锟斤拷锟斤拷锟斤拷: 
     *  
     * <pre> 
     *  
     * </pre> 
     * </li> 
     *  
     * @param encryptKey 
     * @param key 
     * @param iv 
     */  
    public static void getKeyIV(String encryptKey, byte[] key, byte[] iv) {  
        // 锟斤拷钥Base64锟斤拷锟斤拷  
        BASE64Decoder decoder = new BASE64Decoder();  
        byte[] buf = null;  
        try {  
            buf = decoder.decodeBuffer(encryptKey);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        // 前8位为key  
        int i;  
        for (i = 0; i < key.length; i++) {  
            key[i] = buf[i];  
        }  
        // 锟斤拷8位为iv锟斤拷锟斤拷  
        for (i = 0; i < iv.length; i++) {  
            iv[i] = buf[i + 8];  
        }  
    }  
      
    public static void main(String[] args) {  
        System.out.println(encrypt("123456"));  
    }  
}  