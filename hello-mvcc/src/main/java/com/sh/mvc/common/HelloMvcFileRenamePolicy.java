package com.sh.mvc.common;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class HelloMvcFileRenamePolicy implements FileRenamePolicy {

	/**
	 * 파일.txt -> 20230629_161130123_123.txt
	 */
	@Override
	public File rename(File originalFile) {
		File renamedFile = null;
		do {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
			DecimalFormat df = new DecimalFormat("000"); // 23 -> 023
			
			// 확장자 가져오기
			String originalFilename = originalFile.getName();
			String ext = "";
			int dotIndex = originalFilename.lastIndexOf(".");
			if(dotIndex > -1) {
				ext = originalFilename.substring(dotIndex); // .txt
			}
			
			String renamedFilename = sdf.format(new Date()) + df.format(Math.random() * 1000) + ext;
			renamedFile = new File(originalFile.getParent(), renamedFilename);
			
		} while (!createNewFile(renamedFile));
		System.out.println("renamedFile = " + renamedFile);
		return renamedFile;
	}

	
	/**
	 * File#createNewFile 전달된 File객체를 생성
	 * - 이미 존재하면 IOException 던짐
	 * - 존재하지 않으면 파일 생성
	 * @param f
	 * @return
	 */
	private boolean createNewFile(File f) {
	    try {
	      return f.createNewFile();
	    }
	    catch (IOException ignored) {
	      return false;
	    }
	}
	
}
