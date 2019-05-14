package vn.edu.vinaenter.util;

import org.apache.commons.io.FilenameUtils;

public class FileUtil {
	public static String rename(String file) {
		if (!"".equals(file)) {
			return FilenameUtils.getBaseName(file) + "-" + System.nanoTime() + "." + FilenameUtils.getExtension(file);
		} else {
			return file;
		}
	}
}
