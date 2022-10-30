/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AcountController;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
/**
 *
 * @author phung
 */
public class sendgmail {

    public String createAnCapchar() {
        int min = 100000;
        int max = 999999;
        return (Math.random() * (max - min + 1) + min) + "";
    }
    private static String email = "anhpvhe153711@fpt.edu.vn";

    private static String password = "cjyqnxpfgxbdziza";

    public static void main(String[] args) throws MessagingException {
        sendgmail sendEmail = new sendgmail();
        sendEmail.send("phungvietanh1994@gmail.com", "tesst mail", "noi dung", false, false);
    }

    public void send(String reciver, String title, String content,boolean isMultipart, boolean isHtml) throws AddressException, MessagingException {
       
        // Prepare message using a Spring helper
        MimeMessage mimeMessage = getJavaMailSender().createMimeMessage();
        try {
            MimeMessageHelper message = new MimeMessageHelper(mimeMessage, isMultipart, StandardCharsets.UTF_8.name());
            message.setTo(reciver);
            message.setFrom(email);
            message.setSubject(title);
            System.out.println("subject: "+title);
            message.setText(content, isHtml);
            System.out.println("content: "+content);
            getJavaMailSender().send(mimeMessage);
        } catch (MailException | MessagingException e) {
            e.printStackTrace();
        }
    }
    
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);

        mailSender.setUsername(email);
        mailSender.setPassword(password);

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.trust", "*");
        props.put("mail.debug", "true");

        return mailSender;
    }
}
