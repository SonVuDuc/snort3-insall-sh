# Cài đặt Snort3

  + Nên git clone repository với quyền sudo hoặc root
  + Thay đổi quyền sở hữu của thư mục snort3-install-sh bằng lệnh
  ```
  sudo chown -R $USER snort3-install-sh/
  ```
  + Hãy chắn chắn rằng time zone đã được chỉnh đúng
  + Cấp quyền thực thi cho file **snort-install.sh** bằng lệnh ``` sudo chmod +x snort-install.sh ```
  + Chạy lệnh ``` sudo ./snort-install.sh``` để bắt đầu quá trình cài đặt snort 3 và các package bổ sung
  + Tất cả quá trình cài đặt là hoàn toàn tự động, sẽ mất khoảng 30-35 phút
  + Người dùng có thể tùy ý đặt package bổ sung bằng cách chỉnh sửa trong file **snort-install.sh**
  
Nếu thấy màn hình terminal như này, nghĩa là quá trình cài đặt hoàn tất
![Screenshot from 2020-08-24 21-58-58](https://user-images.githubusercontent.com/32956424/91060359-0d6bd200-e655-11ea-8f44-dd4636c4dd30.png)

