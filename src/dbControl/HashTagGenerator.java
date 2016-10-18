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
        HashDAO hashDao = new HashDAO();

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
                    String hashContent = list.get(k);
                    strRet = strRet.replaceAll(list.get(k), "<a href='" + url + URLEncoder.encode(hashContent, "UTF-8") + "'>" + hashContent + "</a>");
                    int hashId = hashDao.getHashId(list.get(k));
                    if (hashId == 0){
                        hashDao.insertHash(hashContent);
                        hashId = hashDao.getHashId(hashContent);
                        hashDao.makeHashPostRel(hashId, postId);
                    }else if(hashId == -1){
                        System.out.print("오류발생");
                    }else{
                        hashDao.makeHashPostRel(hashId, postId);
                    }
                }
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }


        return strRet;
    }

}
