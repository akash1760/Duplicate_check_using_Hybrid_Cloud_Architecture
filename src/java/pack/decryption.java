
package pack;



import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.util.Scanner;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.swing.JOptionPane;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;



public class decryption
{

public String decrypt(String txt,String skey)
{
     String decryptedtext = null;
	try
	{
             
            byte[] bs=Base64.decode(skey);
            SecretKey sec=new SecretKeySpec(bs, "AES");
            System.out.println("converted string to seretkey:"+sec);
         
        System.out.println("secret key:"+sec);
     
        Cipher aesCipher = Cipher.getInstance("AES");
	aesCipher.init(Cipher.ENCRYPT_MODE,sec);
        
         byte[] byteCipherText =new BASE64Decoder().decodeBuffer(txt); 
	
        aesCipher.init(Cipher.DECRYPT_MODE,sec,aesCipher.getParameters());
	         
       byte[] byteDecryptedText = aesCipher.doFinal(byteCipherText);
	decryptedtext = new String(byteDecryptedText);
        
         System.out.println("Decrypted Text:"+decryptedtext);
        }
        
       
	catch(Exception e)
	{
	           System.out.println(e);	
	}
    return decryptedtext;
}

}



