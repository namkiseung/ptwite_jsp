package encrypt;

import java.security.InvalidKeyException;
import java.security.Key;
 
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
 
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
 
public class LocalEncrypter{
    //DESede 는 암호화시 사용되는 최대 키 사이즈를 지정하는 키워드임 : 관련페이지 내용 링크
    private static String algorithm = "DESede";
    private static Key    key       = null;
    private static Cipher cipher    = null;
 
    public static String returnEncryptCode(String str) throws Exception {
        byte [] encryptionBytes = null;
       
        setUp();
              
        // 입력받은 문자열을 암호화 하는 부분
        encryptionBytes = encrypt( str );
        BASE64Encoder encoder = new BASE64Encoder();
         String encodeString = encoder.encode(encryptionBytes);
         //encoder.encode(encryptionBytes) 으로 encrypt 된 값 출력
        return encodeString;
    }

   private static void setUp() throws Exception {
        key = KeyGenerator.getInstance( algorithm ).generateKey();
        cipher = Cipher.getInstance( algorithm );
    }

    public static String returnDecryptCode(String str) throws Exception {
        BASE64Decoder decoder = new BASE64Decoder();
        String decode = decrypt( decoder.decodeBuffer(str) );
        return decode;
    }
 
    // encryptionBytes = encrypt( input ), input을 변조하여 encryptionBytes에 대입함.
    private static byte [] encrypt(String input) throws InvalidKeyException, BadPaddingException, IllegalBlockSizeException  {
        cipher.init( Cipher.ENCRYPT_MODE, key );
        byte [] inputBytes = input.getBytes();
        return cipher.doFinal( inputBytes );
    }
 
    //decrypt( decoder.decodeBuffer(encodeString) ) 처리부분.
    private static String decrypt(byte [] encryptionBytes) throws InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        cipher.init( Cipher.DECRYPT_MODE, key );
        byte [] recoveredBytes = cipher.doFinal( encryptionBytes );
        String recovered = new String( recoveredBytes );
        return recovered;
    }
 
}

