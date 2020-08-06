package com.pinosoft.hrm.util;

/**
 * 
 * @author	박기윤
 * @since	2020.08.03
 * @version	v.1.0
 *
 */

import java.io.*;
import java.util.*;
import javax.servlet.http.*;
import org.springframework.web.multipart.*;

public class FileUtil {
	public static String rename(String path, String oldName) {
		int count = 0;
		String tmpName = oldName;
		File file = new File(path, oldName);
		while (file.exists()) {
			count++;
			int len = tmpName.lastIndexOf(".");
			String tmp1 = tmpName.substring(0, len);
			String tmp2 = tmpName.substring(len);
			
			oldName = tmp1 + "_" + count + tmp2;
			file = new File(path, oldName);
		}
		return oldName;
	}
	
	public HashMap<String, String> getNames(HttpSession session, MultipartFile file, String folder) {
		HashMap<String, String> map = new HashMap<String, String>();
		String savename = new String();
		String path = session.getServletContext().getRealPath("resources") + "/" + folder;
		String oriname = file.getOriginalFilename();
		if (oriname != null || oriname.length() != 0) {
			savename = FileUtil.rename(path, oriname);
		}
		
		try {
			File refile = new File(path, savename);
			file.transferTo(refile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		map.put("savename", savename);
		map.put("oriname", oriname);
		
		return map;
	}
}
