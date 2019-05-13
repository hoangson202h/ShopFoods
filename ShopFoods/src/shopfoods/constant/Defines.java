package shopfoods.constant;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

import org.apache.commons.io.FilenameUtils;

public class Defines {
	// Ä‘á»‹nh nghÄ©a cÃ¡c thÃ´ng sá»‘ cho á»©ng dá»¥ng web
	// @TODO
	public String urlPublic;
	public String urlAdmin;
	public String superAdmin;
	
	public static final int ROW_COUNT_ADMIN = 8;
	public static final int SHOW_PUBLIC = 3;
	public static final String DIR_UPLOAD = "uploads";
	public static final String DIR_SLIDE = "slides";
	public static final String DIR_PHUKIEN = "phukien";
	public static final String DIR_AVATAR = "avatar";
	
	public String getUrlPublic() {
		return urlPublic;
	}
	public void setUrlPublic(String urlPublic) {
		this.urlPublic = urlPublic;
	}
	public String getUrlAdmin() {
		return urlAdmin;
	}
	public void setUrlAdmin(String urlAdmin) {
		this.urlAdmin = urlAdmin;
	}
	public String getSuperAdmin() {
		return superAdmin;
	}
	public void setSuperAdmin(String superAdmin) {
		this.superAdmin = superAdmin;
	}
	
	public static String renameFile(String fileName){
		return FilenameUtils.getBaseName(fileName)+"-"+System.nanoTime()+"."+FilenameUtils.getExtension(fileName);
	}
	public static String formatNumber(Double money) {
		Locale locale = new Locale("vi","VN");
		DecimalFormat format2 = (DecimalFormat)DecimalFormat.getCurrencyInstance(locale);
		DecimalFormatSymbols decimal = new DecimalFormatSymbols();
		decimal.setGroupingSeparator('.');
		decimal.setCurrencySymbol(" ");
		format2.setDecimalFormatSymbols(decimal);
		return format2.format(money);
	}
}
