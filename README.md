1. Copy toàn bọ thư mục ( kể cả nextcloud folder )
2. backup toàn bộ dữ liễu postgress của server gốc ( dump all )
3. chạy docker compose up -d trên máy đích.
4. import toàn bộ database vào
5. ghi đè file config.php bên ngoài vào docker
6. truy cập bằng đường dẫn cloud.victorphan.net vì dùng Ip + port không login được
