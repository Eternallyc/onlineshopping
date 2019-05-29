package config;

/**
 * GeetestWeb配置文件
 * QQ:741047261
 *
 */
public class GeetestConfig {

	// 填入自己的captcha_id和private_key
	private static final String geetest_id = "70272b4f7025155b76a950b2071362c5";
	private static final String geetest_key = "cd10110153cced40ae38bc36745de76a";
	private static final boolean newfailback = true;

	public static final String getGeetest_id() {
		return geetest_id;
	}

	public static final String getGeetest_key() {
		return geetest_key;
	}
	
	public static final boolean isnewfailback() {
		return newfailback;
	}

}
