package com.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RandomValidateCode extends HttpServlet {

	public static final String RANDOMCODEKEY = "rand";//�ŵ�session�е�key
    private Random random = new Random();
    private String randString = "123456789abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";//����������ַ���
    
    private int width = 90;//ͼƬ��
    private int height = 28;//ͼƬ��  
    private int lineSize = 40;//����������
    private int stringNum = 4;//��������ַ�����
    /*
     * �������
     */
    private Font getFont(){
        return new Font("Fixedsys",Font.CENTER_BASELINE,26);
    }
    /*
     * �����ɫ
     */
    private Color getRandColor(int fc,int bc){
        if(fc > 255)
            fc = 255;
        if(bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc-fc-16);
        int g = fc + random.nextInt(bc-fc-14);
        int b = fc + random.nextInt(bc-fc-18);
        return new Color(r,g,b);
    }
	
    /*
     * �����ַ���
     */
    private String drowString(Graphics g,String randomString,int i){
        g.setFont(getFont());
        g.setColor(new Color(random.nextInt(101),random.nextInt(111),random.nextInt(121)));
        String rand = String.valueOf(getRandomString(random.nextInt(randString.length())));
        randomString +=rand;
        g.translate(random.nextInt(3), random.nextInt(3));
        g.drawString(rand, 16*i, 23);
        return randomString;
    }
    /*
     * ���Ƹ�����
     */
    private void drowLine(Graphics g){
        int x = random.nextInt(width);
        int y = random.nextInt(height);
        int xl = random.nextInt(13);
        int yl = random.nextInt(15);
        g.drawLine(x, y, x+xl, y+yl);
    }
    /*
     * ��ȡ������ַ�
     */
    public String getRandomString(int num){
        return String.valueOf(randString.charAt(num));
    }

    
	public RandomValidateCode() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		doPost(request,response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setHeader("Pragma", "No-cache");
	    response.setHeader("Cache-Control", "no-cache");
	    response.setDateHeader("Expires", 0);
	    response.setContentType("image/jpeg");
		
		HttpSession session = request.getSession();
        //BufferedImage���Ǿ��л�������Image��,Image������������ͼ����Ϣ����
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);
        Graphics g = image.getGraphics();//����Image�����Graphics����,�Ķ��������ͼ���Ͻ��и��ֻ��Ʋ���
        g.fillRect(0 , 0 , width, height);
        g.setFont(new Font("Times New Roman",Font.ROMAN_BASELINE,23));
        g.setColor(getRandColor(110, 133));
        //���Ƹ�����
        for(int i=0;i<=lineSize;i++){
            drowLine(g);
        }
        //��������ַ�
        String randomString = "";
        for(int i=1;i<=stringNum;i++){
            randomString=drowString(g,randomString,i);
        }
        session.removeAttribute(RANDOMCODEKEY);
        session.setAttribute(RANDOMCODEKEY, randomString);
        g.dispose();
        try {
            ImageIO.write(image, "JPEG", response.getOutputStream());//���ڴ��е�ͼƬͨ��������ʽ������ͻ���
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

	public void init() throws ServletException {
		
	}
}
