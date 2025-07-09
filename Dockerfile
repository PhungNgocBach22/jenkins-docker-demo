# Sử dụng base image là python phiên bản 3.9-slim
FROM python:3.9-slim

# Đặt thư mục làm việc bên trong container là /app
WORKDIR /app

# Sao chép file requirements.txt vào container và cài đặt dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Sao chép toàn bộ mã nguồn còn lại vào container
COPY . .

# Lệnh để chạy ứng dụng khi container khởi động
CMD ["python", "app.py"]
