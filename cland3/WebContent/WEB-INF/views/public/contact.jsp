<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="clearfix content">
    <div class="contact_us">
        <h1>Liên hệ với chúng tôi</h1>
        <p>
            TRUNG TÂM ĐÀO TẠO LẬP TRÌNH VINAENTER EDU<br /> Trụ sở: 154 Phạm Như Xương, Liên Chiểu, Đà Nẵng<br /> Web: <a href="http://vinaenter.edu.vn" title="">www.vinaenter.edu.vn</a>
        </p>
        <p style="color:red; font-size:20px">${msg }</p>
        <form action="" method="post">
            <p><input type="text" required class="wpcf7-text" name="fullname" placeholder="Họ tên *" /></p>
            <p><input type="text" required class="wpcf7-email" name="email"  placeholder="Email *" /></p>
            <p><input type="text" required class="wpcf7-text" name="subject"  placeholder="Chủ đề *" /></p>
            <p><textarea class="wpcf7-textarea" required name="content"  placeholder="Nội dung *"></textarea></p>
            <p><input type="Submit" class="wpcf7-submit" value="Gửi liên hệ" /></p>
        </form>
    </div>
</div>