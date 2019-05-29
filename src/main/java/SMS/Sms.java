package SMS;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.HTTP;
import org.json.simple.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

//需要导入 demo里面的 lib包 或者根据自己的需要导入相应的jar包


public class Sms {
    public static String URL = "http://api01.monyun.cn:7901/sms/v2/std/single_send";
    @SuppressWarnings("unchecked")
    public void run(String ctel,String code){
        JSONObject jsobj1 = new JSONObject();
        // 需要替换自己的发送账号的apikey
        jsobj1.put("apikey", "f34ce45abe2610e909dc86c99eba3182");
        // 需要替换自己的测试手机号码
        jsobj1.put("mobile", ctel);
        // 需要替换自己测试的内容 短信内容需要进行 根据GBK编码方式的urlencode
        // 一下内容是（您手机的注册验证码为：123456，如有问题请拨打客服电话：40066666111） 其中123456
        // 可以更改为自己的验证内容

        jsobj1.put("content",
                "%C4%FA%CA%D6%BB%FA%B5%C4%D7%A2%B2%E1%D1%E9%D6%A4%C2%EB%CE%AA%A3%BA"
                        +code+ "%A3%AC%C8%E7%D3%D0%CE%CA%CC%E2%C7%EB%B2%A6%B4%F2%BF%CD%B7%FE%B5%E7%BB%B0%A3%BA40066666111");
        post(jsobj1);

    }

    public String post(JSONObject json) {

        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(URL);

        post.setHeader("Content-Type", "application/json");
        post.addHeader("Authorization", "Basic YWRtaW46");
        String result = "";

        try {

            StringEntity s = new StringEntity(json.toString(), "utf-8");
            s.setContentEncoding(
                    new BasicHeader(HTTP.CONTENT_TYPE, "application/json"));
            post.setEntity(s);

            // 发送请求
            HttpResponse httpResponse = client.execute(post);

            // 获取响应输入流
            InputStream inStream = httpResponse.getEntity().getContent();
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(inStream, "utf-8"));
            StringBuilder strber = new StringBuilder();
            String line = null;
            while ((line = reader.readLine()) != null)
                strber.append(line + "\n");
            inStream.close();

            result = strber.toString();

            if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                System.out.println("请求服务器成功，做相应处理");
            } else {
                System.out.println("请求服务端失败");
            }

        } catch (Exception e) {
            System.out.println("请求异常");
            throw new RuntimeException(e);
        }

        return result;
    }

}