using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace ERM
{
    public class TripleDESEncryption
    {
        private static readonly string keyString = "qN7t8Ko6s4xuQnzM3s5hqv4="; // Must be 24 bytes for TripleDES
        private static readonly string ivString = "12345678"; // Must be 8 bytes for TripleDES
        private static byte[] GetKeyBytes()
        {
            byte[] keyBytes = Encoding.UTF8.GetBytes(keyString);
            if (keyBytes.Length != 24)
                throw new Exception("Key must be exactly 24 bytes long for TripleDES.");
            return keyBytes;
        }
        private static byte[] GetIVBytes()
        {
            byte[] ivBytes = Encoding.UTF8.GetBytes(ivString);
            if (ivBytes.Length != 8)
                throw new Exception("IV must be exactly 8 bytes long for TripleDES.");
            return ivBytes;
        }
        public static string Encrypt(string plainText)
        {
            byte[] key = GetKeyBytes();
            byte[] iv = GetIVBytes();
            using (TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider())
            {
                tdes.Key = key;
                tdes.IV = iv;
                tdes.Mode = CipherMode.CBC;
                tdes.Padding = PaddingMode.PKCS7;
                byte[] plainBytes = Encoding.UTF8.GetBytes(plainText);
                using (ICryptoTransform encryptor = tdes.CreateEncryptor())
                using (MemoryStream ms = new MemoryStream())
                using (CryptoStream cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
                {
                    cs.Write(plainBytes, 0, plainBytes.Length);
                    cs.FlushFinalBlock();
                    return Convert.ToBase64String(ms.ToArray());
                }
            }
        }
        public static string Decrypt(string cipherText)
        {
            byte[] key = GetKeyBytes();
            byte[] iv = GetIVBytes();
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider())
            {
                tdes.Key = key;
                tdes.IV = iv;
                tdes.Mode = CipherMode.CBC;
                tdes.Padding = PaddingMode.PKCS7;
                using (ICryptoTransform decryptor = tdes.CreateDecryptor())
                using (MemoryStream ms = new MemoryStream(cipherBytes))
                using (CryptoStream cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                using (StreamReader sr = new StreamReader(cs, Encoding.UTF8))
                {
                    return sr.ReadToEnd();
                }
            }
        }
    }
}