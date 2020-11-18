# NGHIÊN CỨU XÂY DỰNG API DỰA TRÊN DJANGO REST FRAMEWORK
  Trong đồ án này, em sẽ thiết kế một hệ thống API hỗ trợ cho việc bán hàng online. Mặt hàng đầu tiên em hướng đến để thiết kế cơ sở dữ liệu cho hệ thống là các đồ dùng điện tử. Hệ thống sẽ hỗ trợ cho khách hàng việc xem chọn lựa hàng hóa cần mua và bỏ vào giỏ hành của mình sau đó tiến hành đặt hàng khi đã tạo tài khoản trong hệ thống. Khách hàng cũng có thể quản lý các thông tin tài khoản và theo dõi các đơn hàng của mình. Ngoài ra em cũng sẽ xây dựng một web quản trị cùng các chức năng cơ bản để giúp chủ cửa hàng và nhân viên có thể quản lý các thông tin hàng hóa và đơn hàng của cửa hàng. 

## Cài đặt
```bash
 Clone project
 Run database script (asset/script_database/db_datj_script.sql) in MYSQL
 Create virtualenv venv
 Active virtual environment
 pip install -r requiremnts.txt
 pip install mysqlclient-1.4.6-cp38-cp38-win32.whl
 run project (py manage.py runserver)
```

## Tài khoản demo:
* Nhân viên (Employee): [Tên đăng nhập | Mật khẩu]
  - admin | admin
  - don01 | 1
  - kho01 | 1
  - su01  | 1
  - vu01  | 1
* Khách hàng (Customer): [Tên đăng nhập | Mật khẩu]
  - nbdat22 | 1
  
### Tài liệu API (API Document): https://documenter.getpostman.com/view/11214573/TVYJ7HxU
### Báo cáo tóm tắt đề tài: https://drive.google.com/file/d/1iV1WQiIjd32H1xSbPim4Az_ZErDRZ5Rd/view?usp=sharing
 
