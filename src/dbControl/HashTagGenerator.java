package dbControl;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by throughkim on 2016. 10. 17..
 */
public class HashTagGenerator {

    public static String setAutoLinkHashTag(String url, String content, int postId){
        List<String> list = new ArrayList<String>();
        String pattern = "(?:^|\\s|[\\p{Punct}&&[^/]])(#[\\p{L}0-9-_]+)";


        String strRet = content;

        try{
            Pattern compiledPattern = Pattern.compile(pattern, Pattern.CASE_INSENSITIVE);
            Matcher matcher = compiledPattern.matcher(content);
            while(matcher.find()) {
                list.add(matcher.group().trim());
            }
            Collections.sort(list);
            if(list.size() > 0){
                for(int k = list.size() -1; k >= 0; k--){
                    strRet = strRet.replaceAll(list.get(k), "<a href='" + url + URLEncoder.encode(list.get(k), "UTF-8") + "'>" + list.get(k) + "</a>");
                }
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }


        return strRet;
    }

}
