B1: Tải file csv test.csv và thay đổi thông tin

B2: Thay đổi command trong powershell
- Thay đổi đường dẫn file CSV: $ADUsers = Import-Csv "C:\Users\Admin\Documents\Script Import user\test.csv" -Delimiter ";"
- Thay đổi: tắt chức năng thay đổi mật khẩu lần đầu: ChangePasswordAtLogon = $False (True)
  
B3: Run Script
- Run Admin Powershell
- Coppy Script vào Powershell và chạy
