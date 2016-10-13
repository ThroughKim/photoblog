<%--
  Created by IntelliJ IDEA.
  User: throughkim
  Date: 2016. 10. 3.
  Time: 오후 4:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!-- 파일 업로드 처리를 위한 MultipartRequest 객체를 임포트 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!-- 파일 중복처리 객체 임포트 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.File" %>
<%@ page import="dbControl.MemberDAO" %>

<%
    request.setCharacterEncoding("UTF-8");
    int userId = Integer.parseInt(request.getParameter("user_id"));

    String uploadPath = pageContext.getServletContext().getRealPath("images");

    int size = 10*1024*1024;        // 업로드 파일 최대 크기 지정

    String filename="";
    String realFileName="";
    String profile = "profile";


    try{

        // 파일 업로드. 폼에서 가져온 인자값을 얻기 위해request 객체 전달,
        //업로드 경로, 파일 최대 크기, 한글처리, 파일 중복처리
        MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());


        // 업로드한 파일들을 Enumeration 타입으로 반환
        // Enumeration형은 데이터를 뽑아올때 유용한 인터페이스 Enumeration객체는 java.util 팩키지에 정의 되어있으므로
        // java.util.Enumeration을 import 시켜야 한다.
        Enumeration files = multi.getFileNames();


        // 업로드한 파일들의 이름을 얻어옴
        String file = (String)files.nextElement();
        filename = multi.getFilesystemName(file);

        //현재시간으로 파일명 변경
        String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
        int i = -1;
        i = filename.lastIndexOf("."); // 파일 확장자 위치
        realFileName = now + filename.substring(i, filename.length());  //현재시간과 확장자 합치기

        File oldFile = new File(uploadPath + "/" + filename);
        File newFile = new File(uploadPath + "/" + profile + realFileName); // 프로필 이미지는 이미지 앞에 profile이 접두로 붙음

        oldFile.renameTo(newFile);


    }catch(Exception e){
        // 예외처리
        e.printStackTrace();
    }finally {
        MemberDAO memDao = new MemberDAO();
        int check = memDao.updateProfileImage(userId, profile + realFileName);
        if(check == -1){
%>
<script>
    alert("업로드 과정에서 오류가 발생했습니다.");
    history.go(-1);
</script>
<%
        }
    }

%>
<script>
    location.href = "${pageContext.request.contextPath}/profile/profileEditPage.jsp?user_id=<%=userId%>";
</script>
