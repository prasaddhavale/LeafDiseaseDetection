package com.project.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.project.algo.ConvolutionalNeuralNetwork;
import com.project.algo.GrayDemo;
import com.project.algo.ImageResized;
import com.project.algo.MedianFilter;
import com.project.algo.PoolingLayer;
import com.project.dao.UserDao;
import com.project.db.DBConnect;

@WebServlet("/Upload_Image_Controller_1")
@MultipartConfig(maxFileSize=1024*1024*1024)
public class Upload_Image_Controller_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public Boolean flag=Boolean.TRUE;
	Boolean classi_result=Boolean.TRUE;
	
	
	
	//main path
	public String mainPath="D:/Dataset";
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload_Image_Controller_1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		InputStream inputStream = null; 
		
		Part filePart = request.getPart("file");
		
		String header=filePart.getContentType();
		
		 String filename=extractFileName(filePart);
		 
		 ResultSet rm=UserDao.getfile(filename);
		System.out.println("File Format:"+header);
		inputStream = filePart.getInputStream();
		
		String disease="";
		String message="";
		double percentage=0.0;
		try {
			if(rm.next())
			{
			
			String trainPath=mainPath+"/TrainFeatures";
			
			//Upload Path
			String upload_path=mainPath+"/UploadedData";
			
			byte[] buffer = new byte[inputStream.available()];
			inputStream.read(buffer);
			
			File uploadedFile = new File(upload_path+"/grape_img.jpg");
			OutputStream outStream = new FileOutputStream(uploadedFile);
			outStream.write(buffer);
			
			BufferedImage originalImage = ImageIO.read(uploadedFile);
			int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
			    
			String resizedImg=upload_path+"/resizedImg.jpg";
			ImageResized imgr=new ImageResized();
			imgr.resizeImage(upload_path+"/grape_img.jpg", resizedImg, type);
			
			//Image Noise Removal
			File file1=new File(resizedImg);  
			BufferedImage filterImg=MedianFilter.medianFilter(file1); 
			file1=new File(upload_path+"/FilteredImg.jpg"); 
			ImageIO.write(filterImg, "jpg", file1);
			
			//Gray Scale Conversion
			File file2=new File(upload_path+"/"+"resizedImg.jpg");
			
			BufferedImage grayImg=GrayDemo.toGray(file2);
			   
			file2=new File(upload_path+"/GrayImg.jpg");
			   
			ImageIO.write(grayImg, "jpg", file2);
			String grayedImg=upload_path+"/GrayImg.jpg";
			
			//Image Feature Extraction
			String filteredImg=upload_path+"/FilteredImg.jpg";
			String test_featurefile=upload_path+"/test_features.txt";
			System.out.println("test_featurefile= "+test_featurefile);
			
			
			PoolingLayer layer=new PoolingLayer();
			flag=layer.extractAll(filteredImg, test_featurefile);
			System.out.println("Flag in feature extraction= "+flag);
			
			//Original Image
			String originalImg=upload_path+"/"+"grape_img.jpg";
			 
			
            
			File class1_traindirectory = new File(trainPath+"/Blackmeasles");
			File class2_traindirectory = new File(trainPath+"/Bacterialleafblight");
			File class3_traindirectory = new File(trainPath+"/Blackrot");
			
			File[] class1_trainfileList = class1_traindirectory.listFiles();
			File[] class2_trainfileList = class2_traindirectory.listFiles();
			File[] class3_trainfileList = class3_traindirectory.listFiles();
			
			ArrayList<String> class1_filelist=new ArrayList<String>();
			ArrayList<String> class2_filelist=new ArrayList<String>();
			ArrayList<String> class3_filelist=new ArrayList<String>();
			
			for (File file : class1_trainfileList)
			{
				class1_filelist.add(file.toString());
			}
			
			for (File file : class2_trainfileList)
			{
				class2_filelist.add(file.toString());
			}
			
			for (File file : class3_trainfileList)
			{
				class3_filelist.add(file.toString());
			}
			
			Collections.sort(class1_filelist);
			Collections.sort(class2_filelist);
			Collections.sort(class3_filelist);
			
			
			if(percentage==0)
			   {
				
				try
				{
					ConvolutionalNeuralNetwork cnn=new ConvolutionalNeuralNetwork(type, type, null, null, null, type, type, percentage);
					disease=cnn.classify();
				 
			   System.out.println("disease= "+disease);
			   
			   message="Disease is: "+disease;
			    System.out.println("Message= "+message);
			
			    if(uploadedFile.getPath()!=null)
			     {
				   HttpSession session=request.getSession();
				   session.setAttribute("originalImgPath",originalImg);
			       session.setAttribute("resizedImgPath",resizedImg);
			       session.setAttribute("filterImgPath",filteredImg);
			       session.setAttribute("grayedImg",grayedImg);
			       session.setAttribute("test_featurefile",test_featurefile);
			       session.setAttribute("message", message);
			       session.setAttribute("cotton_disease", disease);
			       out.println("<script type=\"text/javascript\">");
				   out.println("alert('Upload Success.. See Process!!!');");
				   out.println("location='main_page.jsp';");
				   out.println("</script>");
			     }
			   else
			     {
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('Image Upload Failed!!!');");
				   out.println("location='user_upload_image_1.jsp';");
				   out.println("</script>");	
			     } 
			  }//try closed
				
				catch(Exception e)
				{
					e.printStackTrace();
				}
			   }
			
			else
			   {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Disease Not Identified!Try Again!!!');");
				out.println("location='user_upload_image_1.jsp';");
				out.println("</script>");
				
			   }
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Upload test image from LeafDiseasePrediction-WebContent-test_dataset) ');");
				out.println("location='user_upload_image_1.jsp';");
				out.println("</script>");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private String extractFileName(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    String[] items = contentDisp.split(";");
	    for (String s : items) {
	        if (s.trim().startsWith("filename")) {
	            return s.substring(s.indexOf("=") + 2, s.length()-1);
	        }
	    }
	    return "";
	}

}

		
	 
	


