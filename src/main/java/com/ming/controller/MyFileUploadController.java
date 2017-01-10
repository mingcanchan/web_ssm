package com.ming.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping("/file")
public class MyFileUploadController {
	
	private InputStream stream;
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String fileUpload(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
		//创建通用的多部分解析器
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		//判断是否有文件上传
		if (commonsMultipartResolver.isMultipart(request)) {
			//转成多部分request
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			//获取request的所有文件名
			Iterator<String> fileNames = multipartHttpServletRequest.getFileNames();
			//遍历获取文件
			while (fileNames.hasNext()) {
				MultipartFile file = multipartHttpServletRequest.getFile(fileNames.next());
				if (file!=null) {
					//获取传的文件名
					String originalFilename = file.getOriginalFilename();
					//判断文件名是否为""
					if (!StringUtils.isEmpty(originalFilename)) {
						String fileName = "upload"+originalFilename;
						String path = "D:/"+fileName;
						File localFile = new File(path);
						file.transferTo(localFile);
					}
				}
			}
			Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();

			for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
				System.out.println(entity.getValue().getOriginalFilename());
				try {
					stream = entity.getValue().getInputStream();

				} catch (IOException e1) {
					e1.printStackTrace();
				}
				FileOutputStream fileOutputStream;
				try {
					fileOutputStream = new FileOutputStream(new File("D://" + entity.getValue().getOriginalFilename()));
					String url = "c://" + entity.getValue().getOriginalFilename();
					String fileName = entity.getValue().getOriginalFilename();
					byte byttfer[] = new byte[1024];
					int c = -1;
					while ((c = stream.read(byttfer)) != -1) {
						fileOutputStream.write(byttfer, 0, c);
					}
					stream.close();
					fileOutputStream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		Map<String, String> resMap = new HashMap<String, String>();
		return null;
	}
	
	@RequestMapping(value="uploaded",method=RequestMethod.POST)
	public void fileUploaded(@RequestParam("file") CommonsMultipartFile[] files,HttpServletRequest request){
		
		for(int i = 0;i<files.length;i++){  
            System.out.println("fileName---------->" + files[i].getOriginalFilename());  
          
            if(!files[i].isEmpty()){  
                int pre = (int) System.currentTimeMillis();  
                try {  
                    //拿到输出流，同时重命名上传的文件  
                    FileOutputStream os = new FileOutputStream("D:/" + new Date().getTime() + files[i].getOriginalFilename());  
                    //拿到上传文件的输入流  
                    FileInputStream in = (FileInputStream) files[i].getInputStream();
					//以写字节的方式写文件
                    int b = 0;  
                    while((b=in.read()) != -1){  
                        os.write(b);  
                    }  
                    os.flush();  
                    os.close();  
                    in.close();  
                    int finaltime = (int) System.currentTimeMillis();  
                    System.out.println(finaltime - pre);  
                      
                } catch (Exception e) {  
                    e.printStackTrace();  
                    System.out.println("上传出错");  
                }  
        }  
        }  
        return ;  
	}
}
