create database storemanagement;
use storemanagement;

-- storemanagement.category definition

CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` nvarchar(50) NOT NULL,
  `logo` text,
  PRIMARY KEY (`category_id`)
);


-- storemanagement.orders_detail definition

CREATE TABLE `orders_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `price_quotation` decimal(10,0) NOT NULL
);


-- storemanagement.roles definition

CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
);


-- storemanagement.product definition

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` nvarchar(255) NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `category_id` int NOT NULL,
  `images` text,
  `rate_point` int NOT NULL,
  `product_quantity` int NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `monitor` varchar(50) NOT NULL,
  `ram` varchar(50) NOT NULL,
  `rom` varchar(50) NOT NULL,
  `weight` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
);


-- storemanagement.users definition

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
);


-- storemanagement.orders definition

CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `summary_order` decimal(10,0) NOT NULL,
  `vnp_TxnRef` varchar(100) DEFAULT NULL COMMENT 'transaction_id of VNPay',
  `status_payment` int DEFAULT NULL COMMENT 'status payment of VNPay',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);

INSERT INTO storemanagement.roles (role_name) VALUES
   ('admin'),
   ('user');

INSERT INTO storemanagement.users (username,password,role_id) VALUES
   ('user1123456','user1123456',2),
   ('user2123456','user2123456',2),
   ('user3123456','user3123456',2),
   ('admin123456','admin123456',1);

INSERT INTO storemanagement.category (category_name,logo) VALUES
   ('MacBook','apple.webp'),
   ('Dell','dell.webp'),
   ('HP','hp.webp'),
   ('Asus','asus.webp'),
   ('Lenovo','lenovo.webp'),
   ('MSI','msi.webp'),
   ('Acer','acer.webp'),
   ('LG','lg.webp'),
   ('GIGABYTE','gigabyte.webp');

INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('MacBook Air M1',18590000,1,'macbook-air-2020.webp',5,1190,'Apple M1','13.3" (2560 x 1600) Retina','4GB','512GB','1.5kg','BLACK'),
   ('MacBook Pro M3',69990000,1,'apple-macbook-pro.webp',10,1186,'Apple M3 Pro','16"  Liquid Retina XDR','64GB','1TB','1.5kg','SILVER'),
   ('MacBook Pro',4999000,1,'macbook-pro-m3-14-inch-16gb-1tb-ssd--s240300748.webp',10,1197,'Apple M3','14" Liquid Retina XDR','64GB','4TB','1.5kg','SILVER'),
   ('MacBook Air M3',38190000,1,'macbook-air-m3.webp',10,1200,'Apple M3','15.3" (2880 x 1864) IPS','16GB','512GB','1.5kg','SILVER'),
   ('MacBook Air M3',38190000,1,'macbook-air-m315.webp',10,1200,'Apple M3 ( 8-Core CPU / 10-Core GPU )','15.3" ( 2880 x 1864 ) | IPS FHD webcam','32GB','512GB','1.5kg','SILVER'),
   ('Laptop Asus ROG Strix G18 G814JIR-N6007W',60990000,4,'8753_screenshot_1.png',10,1200,'i9-14900HX','18 inch WQXGA 240Hz ','32GB','256GB','11','BLACK'),
   ('Laptop Asus ROG Strix SCAR 18 G834JYR-R6011W',117990000,4,'8754_screenshot_1.png',10,1200,'Intel Core i9 - 14900HX','18 inch WQXGA 240Hz','16GB','4TB','11','BLACK'),
   ('Laptop Asus ROG Strix G16 G614JVR-N4141W',44690000,4,'8775_g614jvr_n4141w_2024_new.jpg',10,1200,'i9-14900HX','16 inch 2.5K (2560 x 1600)','4GB','1TB','11','BLACK'),
   ('Laptop Asus TUF Gaming A15 FA506NC-HN011W',18490000,4,'8820_asus_tuf_gaming_a15_fa506ihr.jpg',10,1200,'R5-7535HS','15.6" Full HD 144Hz','4GB','512GB','11','BLACK'),
   ('Laptop Asus Vivobook 15 X1504ZA-NJ517W',14990000,4,'asus.jpg',10,1200,'i5-1235U','15.6" Full HD ','32GB','512GB','11','BLACK');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop ASUS TUF Gaming F15 FX507VI-LP088W',39190000,4,'8778_photo_2024_02_01_15_25_22.jpg',10,1200,'i7-13620H','15.6" Full HD 144Hz','32GB','512GB','11','BLACK'),
   ('Laptop Asus ROG Zephyrus G16 GU605MV-QR135W',63690000,4,'8777_photo_2024_02_01_14_53_55.jpg',10,1200,'U9-185H','16 inch WQXGA','64GB','1TB','11','BLACK'),
   ('Laptop Asus ROG Zephyrus M16 GU605MI-QR116W',74990000,4,'8776_photo_2024_02_01_14_02_02.jpg',10,1200,'Intel Core U9-185H','16 inch 2.5K (2560 x 1600)','16GB','1TB','11','SILVER'),
   ('Laptop Asus Zenbook 14 OLED UX3405MA-PP475W',34990000,4,'8874.png',10,1200,'Core Ultra 9 185H','14 inch 3K Oled','4GB','1TB','11','BLACK'),
   ('Laptop Asus Zenbook Duo OLED UX8406MA PZ307W',48990000,4,'8873_asus_zenbook_duo_ux8406ma_pz307w_u7.jpg',10,1200,'Intel Core Ultra 7 155H','14" 3K OLED 100% DCI-P3','16GB','256GB','11','SILVER'),
   ('Laptop Asus Vivobook S 14 S5406MA-PP136W',25490000,4,'pro_poster_8201.jpg',10,1200,'Intel Core Ultra 5 125H','14 3K OLED 100% DCI-P3','4GB','1TB','11','BLACK'),
   ('Laptop ASUS ROG Zephyrus G14 GA403UU-QS101W',54990000,4,'8822_laptop_asus_rog_zephyrus_g14_ga403uu.jpg',10,1200,'AMD R9 8945HS','14" 3K OLED 100%DCI-P3','8GB','512GB','11','SILVER'),
   ('Laptop Asus TUF Gaming A15 FA507UV-LP090W',32990000,4,'8821_16823_asus_tuf_gaming_a15_fa507_2024__6.jpg',10,1200,'R9-8945H ','15.6" Full HD 144Hz','4GB','1TB','11','BLACK'),
   ('Laptop ASUS TUF Gaming A15 FA507NV-LP046W',26990000,4,'7959_asus_tuf_gaming_a15_fa507nv_lp046w.jpg',10,1200,'R7-7735HS','15.6" Full HD 144Hz','16GB','512GB','11','BLACK'),
   ('Laptop Asus Vivobook 15 X1504ZA-NJ582W',1212000,4,'8354_untitled_1.jpg',10,1200,'i3-1215U','15.6" Full HD','64GB','4TB','11','BLACK');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Asus Zenbook Duo OLED UX8406MA PZ142W',58990000,4,'8877_laptop_asus_zenbook_duo_oled_ux8406ma.jpg',10,1200,'Intel Core Ultra 9 185H','14" 3K OLED 100% DCI-P3','8GB','4TB','11','BLACK'),
   ('Laptop ASUS TUF Gaming A15 FA507NV-LP110W',25990000,4,'8875_1_31_1.jpg',10,1200,'R5-7535HS','15.6" 100% sRGB 144Hz','64GB','512GB','11','BLACK'),
   ('Laptop ASUS Vivobook 15 OLED A1505VA L1201W',20990000,4,'pro_poster_8346.jpg',10,1200,'i9-13900H','14.5" 2.8K 100% DCI-P3','64GB','512GB','11','BLACK'),
   ('Laptop Asus Vivobook 14 OLED M1405YA-KM047W',13790000,4,'8323_73231_m1405ya_km047w__2_.jpg',10,1200,'R5-7530U','14" 2.8K OLED 100%DCI-P3','8GB','2TB','11','BLACK'),
   ('Laptop Asus Vivobook Pro 14 K3405ZF-KM184W',20290000,4,'pro_poster_8672.jpg',10,1200,'i5-12500H','14"  2.8K OLED','4GB','1TB','11','SILVER'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',2413000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','16GB','512GB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',3418000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','64GB','4TB','11','SILVER'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',4417000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','4GB','4TB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',5416000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','64GB','1TB','11','SILVER'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',9219000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','16GB','256GB','11','BLACK');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',8328000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','32GB','1TB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',7437000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','32GB','1TB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',6546000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','32GB','4TB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',15616000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','4GB','256GB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',16725000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','64GB','4TB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',17836000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','32GB','4TB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',1595000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','64GB','2TB','11','SILVER'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',5121000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','4GB','256GB','11','BLACK'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',9119000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','64GB','4TB','11','SILVER'),
   ('Laptop Asus Zenbook 14X Q410VA-90NB1084-M00FZ0 2023',70000000,4,'pro_poster_8201.jpg',10,1200,'i5-13500H','14.5" 2.8K 100% DCI-P3','64GB','2TB','11','BLACK');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Asus ROG Strix SCAR 16 G634JZR-NM009W',99990000,4,'asus.png',10,1200,'Intel Core i9 - 14900HX','16 inch WQXGA 240Hz','8GB','4TB','11','SILVER'),
   ('Laptop Asus Zenbook 14 OLED UX3405MA-PP588W',60000000,4,'pro_poster_8746.jpg',10,1200,'Ultra 5 125H','14 Inch 3K OLED','8GB','256GB','11','BLACK'),
   ('Apple MacBook Pro M3 142',49990000,1,'macbook-pro-m3-14-inch-16gb-1tb-ssd--s240301683.webp',10,1200,'Apple M3','14.2" Liquid Retina XDR','64GB','256GB','1.5','SILVER'),
   ('MacBook Pro M3 14 inch',49990000,1,'macbook-pro-m3-14-inch-16gb-1tb-ssd--s240300748.webp',10,1200,'Apple M3','14.2" (3024 x 1964) Liquid Retina XDR','16GB','2TB','1.5','SILVER'),
   ('MacBook Air M3 15 inch',37990000,1,'macbook-air-m3-15-inch-16gb-512gb-ssd--p545832.webp',10,1200,'Apple M3','15.3" (2880 x 1864) IPS','16GB','512GB','1.5','SILVER'),
   ('MacBook Air M3 13 inch',27990000,1,'macbook-air-m3-13-inch-8gb-256gb-ssd--s240300711.webp',10,1200,'Apple M3','13.6" (2560 x 1664) IPS','4GB','1TB','1.5','SILVER'),
   ('Apple MacBook Air M2 15.3',35990000,1,'macbook-air-15-3-z18p000yl-m2-16gb-256gb-ssd-silver--p534865.webp',10,1200,'Apple M2','15.3" Liquid Retina','64GB','4TB','1.5','SILVER'),
   ('Laptop MacBook Air 13.6 inch',24990000,1,'apple-macbook-air-m2-2022-13-inch-8gb-256gb-ssd--p440566.webp',10,1200,'Apple M2','13.6" (2560 x 1664) Liquid Retina','4GB','1TB','1.5','MIDNIGHT'),
   ('MacBook Pro M3 Pro 2023 14 inch',49290000,1,'apple-macbook-pro-14-inch-m3-pro-18gb-512gb-ssd--p534244.webp',10,1200,'Apple M3 Pro','14" (3024 x 1964) Liquid Retina XDR','64GB','4TB','1.5','SILVER'),
   ('MacBook Pro M3 Pro 2023 16 inch',107490000,1,'macbook-pro-m3-pro-2023-16-inch-64gb-1tb-ssd--s231100748.webp',10,1200,'Apple M3 Pro','16" (3456 x 2234) Liquid Retina XDR','4GB','2TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('MacBook Pro M3 Pro 2023 16 inch',63990000,1,'apple-macbook-pro-16-inch-2023-m3-pro-18gb-512gb-ssd--p534238.webp',10,1200,'Apple M3 Pro','16" (3456 x 2234) Liquid Retina XDR','32GB','512GB','1.5','BLACK'),
   ('MacBook Pro M2 Pro 2023 16 inch',49990000,1,'apple-macbook-pro-16-m2-pro-16gb-512gb-ssd--p506575.webp',10,1200,'Apple M2 Pro','16.2" (3456 x 2234) Liquid Retina XDR','4GB','256GB','1.5','SILVER'),
   ('Macbook Air M2 2022 13 inch',34990000,1,'apple-macbook-air-m2-2022-13-inch-16gb-512gb-ssd--p531180.webp',10,1200,'Apple M2','13.6" (2560 x 1664) Liquid Retina','8GB','1TB','1.5','RED'),
   ('MacBook Air M2 2022 13 inch',30290000,1,'apple-macbook-air-m2-2022-13-inch-16gb-256gb-ssd--p447978.webp',10,1200,'Apple M2','13.6" (2560 x 1664) Liquid Retina','32GB','2TB','1.5','SILVER'),
   ('Laptop MacBook Air 13.6 inch',29490000,1,'apple-macbook-air-m2-2022-13-inch-8gb-512gb-ssd--p440569.webp',10,1200,'Apple M2','13.6" (2560 x 1664) Liquid Retina','16GB','512GB','1.5','SILVER'),
   ('Apple MacBook Pro M3',44490000,1,'macbook-pro-14-inch-m3-16gb-512gb-ssd--p534263.webp',10,1200,'Apple M3','14" (3024 x 1964) Liquid Retina XDR','16GB','4TB','1.5','SILVER'),
   ('Apple MacBook Pro M2 2022',40890000,1,'apple-macbook-pro-m2-2022-13-inch-16gb-512gb-ssd--s220910425.webp',10,1200,'Apple M2','13.3" (2560 x 1600) Retina','64GB','1TB','1.5','RED'),
   ('Laptop Dell Inspiron 14 7430',1999000,2,'pro_poster_8563.jpg',5,1200,'i7-1355U','14.0" Full HD+ Touch','4GB','1TB','1.5','SILVER'),
   ('Laptop Dell Inspiron 14 5430 R1808S',18590000,2,'pro_poster_8424.jpg',10,1200,'i7 - 1360P','14.0" 2K+','4GB','4TB','1.5','SILVER'),
   ('Laptop Dell Inspiron 16 5635-R1505S',13590000,2,'pro_poster_8704.jpg',10,1200,'R5 - 7530U','16" Full HD+','32GB','512GB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Dell Vostro 3520 - R3505B',11290000,2,'pro_poster_8564.jpg',10,1200,'i5 - 1135G7','15.6" Full HD','8GB','2TB','1.5','SILVER'),
   ('Laptop Gaming Dell G15 5530-9RT49',20990000,2,'6908_anb.png',10,1200,'Core i5-13450HX','15.6" Full HD 120Hz','64GB','1TB','1.5','SILVER'),
   ('Laptop Dell Inspiron 14 5420 R1608S',15590000,2,'pro_poster_7683.jpg',10,1200,'i5 - 1240P','14" 2.2K','4GB','1TB','1.5','SILVER'),
   ('Laptop Dell Inspiron 15 3520 (3520-71003262) (i7-1255U)',19690000,2,'may-tinh-xach-tay-laptop-dell-inspiron-15-3520-3520-71003262-i7-1255u-den--s221200261.webp',10,1200,'Intel Core i7-1255U','15.6" WVA (1920 x 1080),120Hz','32GB','512GB','1.5','SILVER'),
   ('Laptop Dell Vostro 3520',16490000,2,'laptop-dell-vostro-3520-71030559-i5-1235u-xam--s240201832.webp',10,1200,'Intel Core i5-1235U','15.6" WVA (1920 x 1080),120Hz','32GB','1TB','1.5','PINK'),
   ('Laptop Dell Vostro 5630',21590000,2,'laptop-dell-vostro-5630-v5630-i5p085w11gru-i5-1340p-xam--s230402248.webp',10,1200,'Intel Core i5-1340P','16" WVA (1920 x 1200)','4GB','2TB','1.5','SILVER'),
   ('Laptop Dell Vostro 5630',23690000,2,'may-tinh-xach-tay-laptop-dell-vostro-5630-i5u165w11gru-i5-1335u-xam--s230901138.webp',10,1200,'Intel Core i5-1335U','16" WVA (1920 x 1200)','4GB','256GB','1.5','SILVER'),
   ('Laptop Dell Vostro 15 3530',18900000,2,'may-tinh-xach-tay-laptop-dell-vostro-15-3530-80gg93-i5-1335u-xam--s240200257.webp',10,1200,'Intel Core i5-1335U','15.6" WVA (1920 x 1080),120Hz','16GB','4TB','1.5','SILVER'),
   ('Laptop Dell Vostro 3530',16290000,2,'may-tinh-xach-tay-laptop-dell-vostro-3530-v5i5267w1-i5-1335u-den--s230904039.webp',10,1200,'Intel Core i5-1335U','15.6" WVA (1920 x 1080),120Hz','16GB','4TB','1.5','SILVER'),
   ('Laptop Dell Vostro 3430',19290000,2,'may-tinh-xach-tay-laptop-dell-vostro-3430-71021669-i5-1335u--s231103390.webp',10,1200,'Intel Core i5-1335U','14" WVA (1920 x 1080)','64GB','2TB','1.5','RED');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Dell Inspiron 15 3530',20990000,2,'may-tinh-xach-tay-laptop-dell-inspiron-15-3530-71026454-i7-1355u-den--s231103655.webp',10,1200,'Intel Core i7-1355U','15.6" WVA (1920 x 1080)','8GB','1TB','11','SILVER'),
   ('Laptop Dell Vostro 14 3430',18790000,2,'may-tinh-xach-tay-laptop-dell-vostro-14-3430-60ygm-i5-1335u-den--s230604090.webp',10,1200,'Intel Core i5-1335U','14" IPS (1920 x 1080)','16GB','256GB','1.5','SILVER'),
   ('Laptop Dell Inspiron 3530',18990000,2,'laptop-dell-inspiron-3530-n5i5791w1-i5-1335u-den--s231004208.webp',10,1200,'Intel Core i5-1335U','15.6" WVA (1920 x 1080),120Hz','4GB','1TB','1.5','SILVER'),
   ('Laptop Dell Vostro 3430',24890000,2,'may-tinh-xach-tay-laptop-dell-vostro-3430-v3430-i7u165w11grd2-i7-1355u-xam--s230603069.webp',10,1200,'Intel Core i7-1355U','14" WVA (1920 x 1080)','16GB','4TB','1.5','RED'),
   ('Laptop Dell Inspiron 14 5430',30290000,2,'may-tinh-xach-tay-laptop-dell-inspiron-14-5430-71015633-i7-1360p-bac--s230903467.webp',10,1200,'Intel Core i7-1360P','14" WVA (2560 x 1600),90Hz','64GB','512GB','1.5','SILVER'),
   ('Laptop Dell Inspiron 14 5430',27990000,2,'may-tinh-xach-tay-laptop-dell-inspiron-14-5430-i5p165w11sl2050-i5-1340p-bac--s230901140.webp',10,1200,'Intel Core i5-1340P','14" WVA (2560 x 1600)','8GB','2TB','11','SILVER'),
   ('Laptop Dell Inspiron 16 5630',28590000,2,'may-tinh-xach-tay-laptop-dell-inspiron-16-5630-i7p165w11sl2050-i7-1360p-bac--s230901141.webp',10,1200,'Intel Core i7-1360P','16" WVA (1920 x 1200)','64GB','256GB','1.5','SILVER'),
   ('Laptop Dell Inspiron 16 5630',25290000,2,'may-tinh-xach-tay-laptop-dell-inspiron-16-5630-h6krv-i5-1340p-bac--s230901135.webp',10,1200,'Intel Core i5-1340P','16" WVA (1920 x 1200)','8GB','256GB','1.5','SILVER'),
   ('Laptop HP 15s-fq5159TU',1549000,3,'may-tinh-xach-tay-laptop-hp-15s-fq5159tu-core-i7-1255u--s221101766.webp',10,1200,'Intel Core i7-1255U','15.6" IPS (1920 x 1080)','64GB','4TB','1.5','SILVER'),
   ('Laptop Dell Inspiron 3530',23990000,2,'may-tinh-xach-tay-laptop-dell-inspiron-3530-n3530i716w1-i7-1355u-bac--s230703939.webp',10,1200,'Intel Core i7-1355U','15.6" WVA (1920 x 1080)','4GB','512GB','1.5','PINK');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop HP EliteBook 640 G10',26990000,3,'may-tinh-xach-tay-laptop-hp-elitebook-640-g10-873h3pa-i7-1355u-bac--s240103573.webp',10,1200,'Intel Core i7-1355U','14" IPS (1920 x 1080)','4GB','256GB','1.5','SILVER'),
   ('Laptop HP EliteBook 640 G10',23490000,3,'may-tinh-xach-tay-laptop-hp-elitebook-640-g10-873g4pa-i5-1335u-bac--s240103572.webp',10,1200,'Intel Core i5-1335U','14" IPS (1920 x 1080)','8GB','256GB','1.5','RED'),
   ('Laptop HP ProBook 440 G10',23490000,3,'may-tinh-xach-tay-laptop-hp-probook-440-g10-873b8pa-i7-1355u-bac--s230704098.webp',10,1200,'Intel Core i7-1355U','14" IPS (1920 x 1080)','8GB','2TB','1.5','SILVER'),
   ('Laptop HP ProBook 440 G10',19990000,3,'may-tinh-xach-tay-laptop-hp-probook-440-g10-873a9pa-i5-1335u-bac--s230704077.webp',10,1200,'Intel Core i5-1335U','14" IPS (1920 x 1080)','64GB','4TB','1.5','SILVER'),
   ('Laptop HP Victus 16-s0077AX',25990000,3,'may-tinh-xach-tay-laptop-hp-victus-16-s0077ax-8c5n6pa-amd-ryzen-7-7840hs-den--s230901120.webp',10,1200,'AMD Ryzen 7 7840HS','16.1" IPS (1920 x 1080),144Hz','16GB','256GB','1.5','RED'),
   ('Laptop HP Victus 16-s0078AX',22990000,3,'may-tinh-xach-tay-laptop-hp-victus-16-s0078ax-8c5n7pa-amd-ryzen-5-7640hs-den--s230803455.webp',10,1200,'AMD Ryzen 5 7640HS','16.1" IPS (1920 x 1080),144Hz','16GB','2TB','1.5','SILVER'),
   ('Laptop HP Pavilion 14-dv2072TU (7C0W1PA) (i7-1255U)',18990000,3,'hp-pavilion-14-dv2072tu--s221101776.webp',10,1200,'Intel Core i7-1255U','14" IPS (1920 x 1080)','4GB','2TB','1.5','PINK'),
   ('Laptop HP Victus 16-r0229TX',30990000,3,'may-tinh-xach-tay-laptop-hp-victus-16-r0229tx-9q980pa-i5-13500h-xanh--s240201275.webp',10,1200,'Intel Core i5-13500H','16.1" IPS (1920 x 1080),144Hz','8GB','256GB','1.5','SILVER'),
   ('Laptop HP Victus 16-r0228TX',29490000,3,'may-tinh-xach-tay-laptop-hp-victus-16-r0228tx-9q979pa-i5-13500h-den--s240201274.webp',10,1200,'Intel Core i5-13500H','16.1" IPS (1920 x 1080),144Hz','64GB','4TB','','SILVER'),
   ('Laptop HP Victus 16-e1107AX',17990000,3,'hp-victus-16-e1107ax-7c140pa--s221101325.webp',10,1200,'AMD Ryzen 5 6600H','16.1" IPS (1920 x 1080),144Hz','8GB','2TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop HP 15s-fq5228TU - 8U240PA',10490000,3,'laptop-hp-15s-fq5228tu-8u240pa-i3-1215u-xanh--s231002798.webp',10,1200,'Intel Core i3-1215U','15.6" (1920 x 1080)','64GB','2TB','1.5','SILVER'),
   ('Laptop HP Victus 15-fb1022AX - 94F19PA',18490000,3,'laptop-hp-victus-15-fb1022ax-94f19pa-amd-ryzen-5-7535hs-bac--s231004204.webp',10,1200,'AMD Ryzen 5 7535HS','15.6" IPS (1920 x 1080),144Hz','32GB','1TB','1.5','SILVER'),
   ('Laptop HP Pavilion X360 14-ek1047TU',24590000,3,'laptop-hp-pavilion-x360-14-ek1047tu-80r25pa-i7-1355u-vang--s231004206.webp',10,1200,'Intel Core i7-1355U','14" IPS (1920 x 1080)','32GB','256GB','1.5','SILVER'),
   ('Laptop HP ProBook 450 G10 - 873J6PA (i5-1340P)',20790000,3,'laptop-hp-probook-450-g10-873j6pa-i5-1340p-bac--s231004216.webp',10,1200,'Intel Core i5-1340P','15.6" IPS (1920 x 1080)','8GB','256GB','1.5','PINK'),
   ('Laptop HP ProBook 440 G10 - 9H8U9PT (i7-1355U)',23990000,3,'laptop-hp-probook-440-g10-9h8u9pt-i7-1355u-bac--s240201834.webp',10,1200,'Intel Core i7-1355U','14" (1920 x 1080)','16GB','2TB','1.5','SILVER'),
   ('Laptop HP ProBook 450 G10 - 9H8W0PT (i7-1360P)',24990000,3,'laptop-hp-probook-440-g10-9h8w0pt-i7-1360p-bac--s240201835.webp',10,1200,'Intel Core i7-1360P','15.6" (1920 x 1080)','32GB','4TB','1.5','SILVER'),
   ('Laptop HP 15-fd0235TU - 9Q970PA (i5-1334U)',16790000,3,'laptop-hp-15-fd0235tu-9q970pa-i5-1334u-bac--s240201836.webp',10,1200,'Intel Core i5-1334U','15.6" IPS (1920 x 1080)','16GB','512GB','1.5','SILVER'),
   ('Laptop HP Envy X360 13-bf0090TU (76B13PA) (i7-1250U)',28990000,3,'may-tinh-xach-tay-laptop-hp-envy-x360-13-bf0090tu-76b13pa-i7-1250u-xanh--s221003819.webp',10,1200,'Intel Core i7-1250U','13.3" (2880 x 1800)','4GB','1TB','1.5','RED'),
   ('Laptop HP Envy x360 13-bf0113TU (7C0V8PA) (i5-1230U)',23990000,3,'may-tinh-xach-tay-laptop-hp-envy-x360-13-bf0113tu-7c0v8pa-i5-1230u-xanh--s221201224.webp',10,1200,'Intel Core i5-1230U','13.3" OLED (2880 x 1800)','8GB','4TB','1.5','PINK'),
   ('Laptop Lenovo Thinkbook 14P G3 ARH 21EJ0001CD',16490000,5,'7171_ac_new_100__laptop_lenovo_thinkbook_14p_g3_arh_21ej0001cd_2.jpg',10,1200,'AMD R7-6800H','14" 2.2K 100% sRGB','64GB','256GB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Lenovo LOQ 15IAX9 83GS000FVN',17690000,5,'pro_poster_8795.jpg',10,1200,'i5-12450HX','15.6" 144Hz 100% sRGB','8GB','4TB','1.5','SILVER'),
   ('Laptop Lenovo LOQ 15IRH8 82XV0012US',17990000,5,'pro_poster_8715.jpg',10,1200,'i5-12450H','15.6" 144Hz','32GB','1TB','1.5','SILVER'),
   ('Lenovo IdeaPad 1 15ALC7 82R400DTUS',12990000,5,'8891_61di2gfpfcl__ac_uf894_1000_ql80_.jpg',10,1200,'AMD R7-5700U','15.6" Full HD','16GB','512GB','1.5','RED'),
   ('Laptop Lenovo Slim 7 ProX 14ARH7 82V20006US',22990000,5,'8581_ac____new_100___laptop_lenovo_slim_7_prox_14arh7_82v20006us.jpg',10,1200,'R7-6800HS','14.5" 3K 100% sRGB','32GB','2TB','1.5','SILVER'),
   ('Laptop Lenovo Legion 5 15ARP8 83EF0002US',57821000,5,'pro_poster_8427.jpg',10,1200,'AMD Ryzen 7-7735HS','15.6" 2K 165Hz 100% sRGB','64GB','256GB','1.5','SILVER'),
   ('Laptop Lenovo IdeaPad Slim 5 Light 14ABR8 82XS0006VN',12990000,5,'pro_poster_8069.jpg',10,1200,'R5-7530U','14" FHD 100% sRGB','32GB','512GB','1.5','SILVER'),
   ('Laptop Lenovo IdeaPad Slim 5 14IRL8 82XD008LVN',17990000,5,'pro_poster_8789.jpg',10,1200,'i5-13500H','14" OLED 100%DCI-P3','32GB','4TB','1.5','SILVER'),
   ('Laptop Lenovo Legion R7000 APH9 83EG0000CD',24990000,5,'pro_poster_8701.jpg',10,1200,'AMD Ryzen 7-7840H','15.6" 100% sRGB 144Hz','4GB','256GB','1.5','SILVER'),
   ('Laptop Lenovo LOQ 15IAX9 83GS001SVN',17990000,5,'pro_poster_8766.jpg',10,1200,'i5-12450HX','15.6 144Hz 100% sRGB','16GB','4TB','1.5','SILVER'),
   ('Laptop Lenovo IdeaPad 5 Pro 16IRH8 83AQ000PUS',24990000,5,'pro_poster_6965.jpg',10,1200,'i7-13700H','16" 2.5K 120hz','8GB','2TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Lenovo Ideapad Gaming 3 15ARH7-82SB00SLUS',5821000,5,'pro_poster_8514.jpg',10,1200,'R5-7535HS','15.6" FHD 120hz','32GB','256GB','1.5','PINK'),
   ('Laptop Lenovo Yoga 6 13ABR8 83B2001UUS',13990000,5,'pro_poster_7402.jpg',10,1200,'R5-7530U','13" 100% sRGB Touch','32GB','512GB','1.5','SILVER'),
   ('Laptop Lenovo LOQ 15IAX9 83GS001RVN',19690000,5,'pro_poster_8760.jpg',10,1200,'i5-12450HX','15.6" 100% sRGB 144Hz','64GB','4TB','1.5','RED'),
   ('Laptop Lenovo IdeaPad Slim 5 Light 14ABR8 82XS002JVN',3619000,5,'pro_poster_8067.jpg',10,1200,'R7 - 7730U','14" FHD 100% sRGB','32GB','2TB','1.5','SILVER'),
   ('Lenovo Legion Slim 5 16IRH8 82YA00BSVN',5821000,5,'pro_poster_8574.jpg',10,1200,'i5-13500H','16" 2K 165Hz','8GB','1TB','1.5','SILVER'),
   ('Lenovo Yoga 7 2 in 1 16IRL8 82YN0001US',15990000,5,'pro_poster_8200.jpg',10,1200,'i5 - 1335U','16" WUXGA','4GB','2TB','1.5','SILVER'),
   ('Laptop Lenovo Legion 5 Pro R9000P ARX8-82WM006KCD',32990000,5,'pro_poster_8077.jpg',10,1200,'AMD R9-7945HX','16" 2K 100% sRGB 240Hz','16GB','512GB','1.5','PINK'),
   ('Laptop Lenovo LOQ 15IAX9 83GS000RVN',23490000,5,'pro_poster_8761.jpg',10,1200,'i5-12450HX','15.6" 100% sRGB 144Hz','8GB','256GB','1.5','SILVER'),
   ('Lenovo Yoga Slim 6 14IRH8 83E00008VN',22990000,5,'pro_poster_8473.jpg',10,1200,'i7 13700H','14" OLED 100%DCIP3','32GB','256GB','1.5','SILVER'),
   ('Laptop Lenovo Legion 5 Pro Y9000P 16IAH7H 82RF00R3CD',93619000,5,'pro_poster_7590.jpg',10,1200,'i9-12900H','16" WQXGA 165Hz','32GB','2TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Lenovo LOQ 15IRH8 82XV000PVN',21990000,5,'pro_poster_8199.jpg',10,1200,'i5 - 13420H','15.6" FHD 144Hz','16GB','512GB','1.5','SILVER'),
   ('Laptop MSI Cyborg 15 A12UCX-618VND',16990000,6,'pro_poster_8801.jpg',10,1200,'i5-12450H','15.6" Full HD 144Hz','8GB','1TB','1.5','SILVER'),
   ('Laptop MSI Gaming GF63 12UC-887VN',18990000,6,'pro_poster_8796.jpg',10,1200,'Intel Core i7-12650H','15.6" Full HD 144Hz','32GB','4TB','1.5','SILVER'),
   ('Laptop MSI Cyborg 15 A12VE 412VN',3619000,6,'pro_poster_8225.jpg',10,1200,'i5 12450H','15.6" FHD 144Hz','8GB','2TB','1.5','SILVER'),
   ('Laptop MSI Cyborg 15 A12UCX-281VN',16990000,6,'pro_poster_8113.jpg',10,1200,'i5-12450H','15.6" Full HD 144Hz','64GB','256GB','1.5','SILVER'),
   ('Laptop MSI Modern 14 C13M 458VN',13990000,6,'7966_ac____laptop_msi_modern_14_c13m_458vn_22.jpg',10,1200,'i5 - 1335U','14" Full HD','8GB','512GB','1.5','SILVER'),
   ('Laptop MSI Gaming GF63 Thin 12VE-460VN',5821000,6,'pro_poster_8807.jpg',10,1200,'Intel Core i5-12450H','15.6" Full HD 144Hz','16GB','2TB','1.5','SILVER'),
   ('Laptop MSI Gaming Cyborg 15 AI A1VEK-053VN',30990000,6,'8824_80961_laptop_msi_gaming_cyborg_15_ai__a1vek_053vn____3_.jpg',10,1200,'Intel Ultra 7-155H','15.6" Full HD 144Hz','4GB','256GB','1.5','SILVER'),
   ('Laptop MSI Prestige 16 AI Studio B1VFG 082VN',54990000,6,'8860_.jpg',10,1200,'Intel Core Ultra 9 185H','16" UHD+ 100% DCI-P3','8GB','1TB','1.5','PINK'),
   ('Laptop MSI Thin 15 B12UCX 1419VN',17490000,6,'8861_.jpg',10,1200,'Intel Core i5-12450H','15.6" Full HD 144Hz','64GB','512GB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Gaming MSI Bravo 15 B7ED-010VN',17490000,6,'pro_poster_8317.jpg',10,1200,'R5 7535HS','15.6" FHD 144Hz','4GB','512GB','1.5','RED'),
   ('Laptop MSI Titan GT77HX 13VI-077VN',148990000,6,'7972_pc_portable_msi_titan_gt77hx_13vh_029fr_17_3_intel_core_i9_13980hx_64_go_ram_2_to_d_noir.jpg',10,1200,'Intel Core i9 -13980HX','17.3 Inch UHD 144Hz','16GB','4TB','1.5','SILVER'),
   ('Laptop MSI Raider GE78HX 13VH-076VN',118900000,6,'7973_1024__2_.png',10,1200,'Intel Core i9-13950HX','17 Inch QHD 240Hz','8GB','2TB','1.5','PINK'),
   ('Laptop MSI Creator Z17 HX Studio A13VGT 068VN',75990000,6,'8031_untitled_1.jpg',10,1200,'Intel Core i7-13700HX','17 Inch QHD+ 165Hz','32GB','4TB','1.5','SILVER'),
   ('Laptop MSI Prestige 16 AI Studio B1VFG 082VN',54990000,6,'8860_msi_prestige_16_ai_studio_b1vfg_082vn.jpg',10,1200,'Intel Core Ultra 9-185H','16 Inch UHD+ OLED 100% DCI-P3','64GB','2TB','1.5','SILVER'),
   ('Laptop Gaming MSI Stealth 14 AI Studio A1VFG 050VN',49990000,6,'8751_photo_2024_01_17_15_51_41.jpg',10,1200,'Intel Core Ultra 7 155H','14 inch 2.8K, OLED, 120Hz','4GB','2TB','1.5','SILVER'),
   ('Laptop MSI Cyborg 15 AI A1VE 053VN',29990000,6,'8748_photo_2024_01_17_13_45_27.jpg',10,1200,'Intel Core Ultra 7 155H','15.6 inch FHD (1920 x 1080), 144Hz','64GB','1TB','1.5','SILVER'),
   ('Laptop MSI Prestige 16 AI Studio B1VF-062VN',30990000,6,'8804_prestige_16_ai_studio.png',10,1200,'Intel Core Ultra 7 155H','13.3 Inch 2.8K OLED 100% DCI-P3','16GB','512GB','1.5','SILVER'),
   ('Laptop MSI Sword 16 HX B14VFKG 045VN',38990000,6,'8750_photo_2024_01_17_15_15_45.jpg',10,1200,'Intel Core i7-14700HX','16 inch QHD+(2560 x 1600), 240Hz','64GB','512GB','1.5','SILVER'),
   ('Laptop MSI Creator M16 B13VE 830VN',36990000,6,'8034_12387_msi_creator_m16_b13v_5.jpg',10,1200,'Intel Core i7-13700H','16 Inch Full HD+ 144Hz','4GB','1TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop MSI Gaming Cyborg 15 AI A1VEK-053VN',30990000,6,'8824_80961_laptop_msi_gaming_cyborg_15_ai__a1vek_053vn____3_ (1).jpg',10,1200,'Intel Ultra 7-155H','15.6 inch Full HD 144Hz','64GB','256GB','1.5','SILVER'),
   ('Laptop MSI Katana 15 B13VFK 676VN',29290000,6,'7970_katana_15_b13vx_1.png',10,1200,'Intel Core i7 - 13620H','15.6 Inch Full HD 144Hz','64GB','1TB','1.5','SILVER'),
   ('Laptop Gaming MSI Katana A15 AI B8VE 402VN',26990000,6,'8749_photo_2024_01_17_14_11_09.jpg',10,1200,'AMD R7 8845HS','15.6 inch FHD (1920x1080), 144Hz','4GB','4TB','1.5','SILVER'),
   ('Laptop Gaming MSI Katana A15 AI B8VE 402VN',26990000,6,'8749_photo_2024_01_17_14_11_09 (1).jpg',10,1200,'AMD R7 8845HS','15.6 inch FHD (1920x1080), 144Hz','64GB','512GB','1.5','SILVER'),
   ('Laptop MSI Prestige 14Evo B13M 401VN',25990000,6,'8029_12390_msi_prestige_14evo_b13m__3__1_.jpg',10,1200,'Intel Core i5-13500H','14 Inch Full HD+ IPS','8GB','4TB','1.5','PINK'),
   ('Laptop Acer Nitro 5 AN515-58-57QW',17690000,7,'8634_ac____new_outlet__laptop_acer_nitro_5_an515_58_57qw.jpg',10,1180,'i5 - 12450H','15.6" Full HD 144Hz','8GB','256GB','1.5','RED'),
   ('Laptop Gaming Acer Nitro 5 Eagle AN515-57-5669',3619000,7,'4766_ac_new_100__laptop_gaming_acer_nitro_5_eagle_an515_57_5669.jpg',10,1200,'Intel Core i5 - 11400H','15.6 inch Full HD 144hz','16GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Acer Nitro V ANV15-51-53VM NH.QNAAA.002',16990000,7,'8610_ac___laptop_gaming_acer_nitro_v_anv15_51_53vm_nh_qnaaa_002.jpg',10,1200,'Intel Core i5-13420H','15.6 Inch Full HD 144Hz','32GB','4TB','1.5','SILVER'),
   ('Laptop Acer Swift Go 14 SFG14-71T-78CH-NXKF5AA002',17990000,7,'7879_ac___acer_swift_go_14_sfg14_71t_78ch_nxkf5aa002_c___khung.jpg',10,1200,'Intel Core i7-13700H','14 Inch IPS WUXGA, Touch','8GB','2TB','1.5','SILVER'),
   ('Laptop Acer Nitro 5 AN515-58-57Y8',17690000,7,'6713_acer_nitro_5_led_______900x900.jpg',10,1200,'i5-12500H','15.6 Inch Full HD 144Hz','4GB','256GB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Acer Swift Go 14 SFG14-71T-78CH-NXKF5AA002',17990000,7,'7879_ac___acer_swift_go_14_sfg14_71t_78ch_nxkf5aa002_c___khung (1).jpg',10,1200,'Intel Core i7-13700H','14 Inch IPS WUXGA, Touch','4GB','512GB','1.5','SILVER'),
   ('Laptop Acer Gaming Predator Helios Neo 16 PHN16-71-73RR NHQMAAA001',23990000,7,'8779_1__13_.jpg',10,1200,'Intel Core i7-13700HX','16 inch WUXGA','64GB','256GB','1.5','SILVER'),
   ('Laptop Acer Nitro 5 AN515-58-57Y8',17690000,7,'6713_ac____new_outlet__laptop_acer_nitro_5_an515_58_57y8.jpg',10,1200,'i5-12500H','15.6 Inch Full HD 144Hz','16GB','512GB','1.5','SILVER'),
   ('Laptop Acer Nitro 5 AN515-58',18990000,7,'7863_6927_nitro5_an515_58_wallpaper_win11_rgbkb_light_on_black_01_min.png',10,1200,'Intel Core i7-12700H','15.6 Inch Full HD 144Hz','8GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Acer Nitro 5 AN515-57-536Q-NHQEKAA001',15490000,7,'8413_7949_6945_nitro_5_an515_57_01_500x500.jpg',10,1200,'Intel Core i5 11400H','15.6 Inch Full HD, 144Hz','8GB','4TB','1.5','PINK'),
   ('Laptop Acer Aspire 5 A515-58GM-59LJ',16990000,7,'8461_acer_aspire_5_5.jpg',10,1200,'Intel Core i5-13420H','15.6 Inch Full HD, IPS','4GB','2TB','1.5','SILVER'),
   ('Laptop Gaming Acer Nitro V ANV15-51-58AN NH.QNASV.001',19590000,7,'8809_78997_nitro_v___frame_rtx2050.jpg',10,1200,'Intel Core i5 - 13420H','111','4GB','512GB','1.5','SILVER'),
   ('Laptop Acer Nitro 5 AN515-58-57QW',17690000,7,'8634_ac____new_outlet__laptop_acer_nitro_5_an515_58_57qw.jpg',10,960,'i5-12450H','15.6 Inch Full HD 144Hz','64GB','512GB','1.5','RED'),
   ('Laptop Gaming Acer Predator Helios Neo 16 PHN16-71-50JG',21690000,7,'8391_laptop_gaming_acer_predator_helios_neo_16_phn16_71_50jg__1_.jpg',10,1200,'Intel Core i5-13500HX','16 Inch WUXGA (1920x1200) 165Hz, sRGB 100%','8GB','256GB','1.5','SILVER'),
   ('Laptop Acer Gaming Predator Helios Neo 16 PHN16-71-73RR',23990000,7,'8779_1__13_.jpg',10,1200,'Intel Core i7-13700HX','16 inch WUXGA','64GB','256GB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Acer Gaming Predator Helios Neo 16 PHN16-71-73RR',24990000,7,'8827_1__13_.jpg',10,1200,'Intel Core i7-13700HX','111','8GB','512GB','1.5','SILVER'),
   ('Laptop Acer Predator Helios 300 PH315-55',21990000,7,'8079_8234_laptop_gaming_acer_predator_helios_300_ph315_55_70zv.jpg',10,1200,'Intel Core i7-12700H','15.6 inch Full HD','8GB','4TB','1.5','SILVER'),
   ('Laptop Gaming Acer Nitro 16 Phoenix AN16-51',21490000,7,'7877_nitro_16.jpg',10,1200,'Intel Core i5-13500H','16 inch Full HD+','8GB','2TB','1.5','SILVER'),
   ('Laptop Acer Gaming Predator Helios Neo 16 PHN16-71-73RR NHQMAAA001',24990000,7,'8827_001.jpg',10,1200,'Intel Core i7-13700HX','16 inch WUXGA','4GB','4TB','1.5','SILVER'),
   ('Laptop Acer Nitro 5 AN515-58-57QW',17690000,7,'8634_ac____new_outlet__laptop_acer_nitro_5_an515_58_57qw.jpg',10,1200,'i5-12450H','15.6 Inch Full HD 144Hz','4GB','512GB','1.5','SILVER'),
   ('Laptop Gaming ACER Predator Helios 16 PH16-71-94N1',124990000,7,'7876_44378_laptop_acer_predator_helios_16_ph16_71_94n1.jpg',10,1200,'Intel Core i9 - 13900HX','16 Inch 2K 240Hz 100% DCI-P3','4GB','512GB','1.5','PINK'),
   ('Laptop Gaming Acer Nitro 16 Phoenix AN16-51',21490000,7,'7877_nitro_16.jpg',10,1200,'Intel Core i5-13500H','16 inch Full HD+','8GB','512GB','1.5','RED'),
   ('Laptop Gaming Acer Predator Helios 18 2023 PH18-71-94SJ',126990000,7,'7881_helios_18_1.png',10,1200,'Intel Core i9 - 13900HX','18 Inch 2K 240Hz 100% DCI-P3','16GB','512GB','1.5','SILVER'),
   ('Laptop Acer Nitro 5 AN515-58',18990000,7,'7863_6927_nitro5_an515_58_wallpaper_win11_rgbkb_light_on_black_01_min.png',10,1200,'Intel Core i7-12700H','15.6 Inch Full HD 144Hz','16GB','512GB','1.5','SILVER'),
   ('Laptop Acer Predator Helios 300 PH315-55',21990000,7,'8079_8234_laptop_gaming_acer_predator_helios_300_ph315_55_70zv.jpg',10,1200,'Intel Core i7-12700H','15.6 inch Full HD','4GB','512GB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Acer Predator Helios Neo PHN16-71-54CD',34990000,7,'8106_45073_4.jpg',10,1200,'Intel Core i5-13500HX','16 Inch 2K+ 165Hz 100% sRGB','32GB','1TB','1.5','SILVER'),
   ('Laptop Acer Aspire 3 A314-23M-R4TX - R5 7520u',12990000,7,'acer81818.png',10,1200,'Ryzen 5 - 7520U','14 inch Full HD IPS','8GB','256GB','1.5','SILVER'),
   ('Laptop LG Gram 17ZB90R-K.AAC7U1',21990000,8,'8583_ac____new_outlet__laptop_lg_gram_17zb90r_k_aac7u1.jpg',10,1200,'Intel Core i7-1360P','17 inch 2K 100% DCI-P3','64GB','1TB','1.5','SILVER'),
   ('Laptop LG Gram 17Z90Q-K.AAC7U1',18990000,8,'8286_lg_gram_17z90q_k_aac7u1.jpg',10,1200,'Intel Core i7-1260P','17 inch 2K (2560*1600) 100% DCI-P3','64GB','2TB','1.5','SILVER'),
   ('Laptop LG Gram 17ZD90Q-G.AX73A5',23990000,8,'7329_anb_lg_gram_2022_17zd90q_1.jpg',10,1200,'Intel Cor i7-1260p','17 inch 2K 100% sRGB(2560 x 1600)','64GB','512GB','1.5','SILVER'),
   ('Laptop LG Gram 2023 14Z90R - G.AH53A5',24890000,8,'8711_8129_2.jpg',10,1200,'Intel Core i5-1340P','14 Inch 2K 100% sRGB','32GB','1TB','1.5','RED'),
   ('Laptop LG Gram 16Z90R-G.AH76A5 (2023)',34890000,8,'8706_lg_gram_16z90r_g_ah76a5.jpg',10,1200,'Intel Cor i7-1360p','16 Inch WQXGA (2560 x 1600) 99% DCI-P3','16GB','4TB','1.5','SILVER'),
   ('Laptop LG Gram 2023 17Z90R',48990000,8,'8135_1_____nh______i_di___n__1_.jpg',10,1200,'Intel Core i7-1360P','17 Inch 2K (2560 x 1600) 100% sRGB','4GB','2TB','1.5','SILVER'),
   ('Laptop LG Gram 2023 16Z90R',47990000,8,'8136_1_____nh______i_di___n.jpg',10,1200,'Intel Core i7 - 1360P','16 inch WQXGA (2560x1600)','64GB','256GB','1.5','SILVER'),
   ('Laptop LG Gram 16Z90R A.ADC8U1',49990000,8,'8637_lg_gram_16z90r___a_adc8u1___anb.jpg',10,1200,'Intel Core i7-1360P','16 Inch WQXGA (2K) 100%sRGB','64GB','4TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop LG Gram 2 in 1 2023 14T90R-G.AH55A5',36290000,8,'8139_1_anhdaidien.jpg',10,1200,'Intel Core i5-1340P','14 inch WUXGA(1920 x 1200) 99%DCI-P3','4GB','512GB','1.5','SILVER'),
   ('Laptop LG Gram 2023 17ZD90R-G.AX73A5',29490000,8,'8134_lg_gram_17zd90r_g_ax73a5.jpg',10,1200,'Intel Core i7-1360P','17 Inch 2K (2560 x 1600) 100% sRGB','16GB','2TB','1.5','SILVER'),
   ('Laptop LG Gram 2023 14Z90R-G.AH75A5',37390000,8,'8131_1.jpg',10,1200,'Intel Core i7-1360P','14 Inch 2K 100% sRGB','16GB','4TB','1.5','SILVER'),
   ('Laptop LG Gram 2023 16ZD90R-G.AX55A5',38290000,8,'8130_1.jpg',10,1200,'Intel Core i5-1340P','16 Inch 2K (2560 x 1600) 100% sRGB','16GB','512GB','1.5','SILVER'),
   ('Laptop LG Gram 2023 14Z90R-G.AH53A5',24890000,8,'8711_8129_2.jpg',10,1200,'Intel Core i5-1340P','14 Inch 2K 100% sRGB','8GB','1TB','1.5','SILVER'),
   ('Laptop LG gram 2023 14ZD90R-G.AX52A5',24990000,8,'8128_1.jpg',10,1200,'Intel Core i5-1340P','14 Inch 2K 100% sRGB','32GB','4TB','1.5','SILVER'),
   ('Laptop LG Gram 2 in 1 16T90Q-K.AAC7U1',17990000,8,'7723_7723_ac11_lg_gram_2_in_1_16t90q_k.jpg',10,1200,'Intel Core i7 - 1260P','16 Inch 2K WQXGA, 100% sRGB','32GB','256GB','1.5','SILVER'),
   ('Laptop LG Gram 2022 17ZD90Q',15990000,8,'7332_3.jpg',10,1200,'Intel Core i5-1240p','17 inch WQXGA(2560 x 1600), DCI-P3 99%','8GB','1TB','1.5','RED'),
   ('Laptop LG Gram 17ZD90Q-G.AX73A5',23990000,8,'7329_anb_lg_gram_2022_17zd90q_1.jpg',10,1200,'Intel Cor i7-1260p','17 inch 2K 100% sRGB(2560 x 1600), DCI-P3 99%','8GB','256GB','1.5','SILVER'),
   ('Laptop LG Gram 2023 14Z90R',24890000,8,'8711_8129_2.jpg',10,1200,'Intel Core i5-1340P','14 Inch 2K 100% sRGB','4GB','256GB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop LG Gram 16Z90R-G.AH76A5 (2023)',34890000,8,'8706_lg_gram_16z90r_g_ah76a5.jpg',10,1200,'Intel Cor i7-1360p','16 Inch WQXGA (2560 x 1600) 99% DCI-P3','64GB','4TB','1.5','SILVER'),
   ('Laptop LG Gram 2023 16Z90R - E.AH75A5',47990000,8,'8136_1_____nh______i_di___n.jpg',10,1200,'Intel Core i7 - 1360P','16 inch WQXGA (2560x1600) 100%DCI -P3','64GB','2TB','1.5','SILVER'),
   ('Laptop LG Gram 2023 17Z90R-G.AH78A5',48990000,8,'8135_1_____nh______i_di___n__1_.jpg',10,1200,'Intel Core i7-1360P','17 Inch 2K (2560 x 1600) 100% sRGB','16GB','512GB','1.5','SILVER'),
   ('Laptop LG Gram 2023 16ZD90R-G.AX55A5',38290000,8,'8130_1.jpg',10,1200,'Intel Core i5-1340P','16 Inch 2K (2560 x 1600) 100% sRGB','4GB','1TB','1.5','SILVER'),
   ('Laptop LG Gram 2023 14Z90R-G.AH53A5',24890000,8,'8880.png',10,1200,'Intel Core i5-1340P','14 Inch 2K 100% sRGB','32GB','1TB','1.5','SILVER'),
   ('Laptop LG gram 2023 14ZD90R-G.AX52A5',24990000,8,'8128_1.jpg',10,1200,'Intel Core i5-1340P','14 Inch 2K 100% sRGB','8GB','4TB','1.5','SILVER'),
   ('Laptop LG Gram 2 in 1 16T90Q-K.AAC7U1',17990000,8,'7723_7723_ac11_lg_gram_2_in_1_16t90q_k.jpg',10,1200,'Intel Core i7 - 1260P','16 Inch 2K WQXGA, 100% sRGB','4GB','512GB','1.5','SILVER'),
   ('Laptop LG Gram 2022 17ZD90Q',15990000,8,'7332_3.jpg',10,1200,'Intel Cor i5-1240p','17 inch WQXGA(2560 x 1600), DCI-P3 99%','4GB','256GB','1.5','SILVER'),
   ('Laptop Gaming GIGABYTE AORUS 15 BMF 52US383SH',21590000,9,'8376_gigabyte_aorus_15_bmf_ac.jpg',10,1200,'Intel Core i5-13500H','15.6 Inch Full HD 144Hz','16GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN353SH',21690000,9,'8872_photo_2024_04_02_14_16_23.jpg',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','64GB','512GB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Gaming Gigabyte G5 MF5-52VN383SH',21690000,9,'8698_doc_2023_12_29_15_42_04.png',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','32GB','2TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 KF-E3VN333SH',22990000,9,'8127____nh_n___i_b___t___laptop_gaming_gigabyte_g5_kf_e3vn333sh__2_.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','4GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF E2VN333SH',20990000,9,'8126_ac___gigabyte_g5_mf_e2vn333sh_2.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','64GB','4TB','1.5','SILVER'),
   ('Laptop Gaming GIGABYTE AORUS 15 BMF 52US383SH',21590000,9,'8376_gigabyte_aorus_15_bmf_ac.jpg',10,1200,'Intel Core i5-13500H','15.6 Inch Full HD 144Hz','32GB','256GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN353SH',21690000,9,'8872_photo_2024_04_02_14_16_23.jpg',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','4GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN383SH',21690000,9,'8698_doc_2023_12_29_15_42_04.png',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','32GB','2TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 KF-E3VN333SH',22990000,9,'8127____nh_n___i_b___t___laptop_gaming_gigabyte_g5_kf_e3vn333sh__2_.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','8GB','1TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF E2VN333SH',26192000,9,'8126_ac___gigabyte_g5_mf_e2vn333sh_2.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','32GB','512GB','1.5','SILVER'),
   ('Laptop Gaming GIGABYTE AORUS 15 BMF 52US383SH',21590000,9,'8376_gigabyte_aorus_15_bmf_ac.jpg',10,1200,'Intel Core i5-13500H','15.6 Inch Full HD 144Hz','4GB','1TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN353SH',21690000,9,'8872_photo_2024_04_02_14_16_23.jpg',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','16GB','1TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Gaming Gigabyte G5 MF5-52VN383SH',21690000,9,'8698_doc_2023_12_29_15_42_04.png',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','16GB','2TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 KF-E3VN333SH',22990000,9,'8127____nh_n___i_b___t___laptop_gaming_gigabyte_g5_kf_e3vn333sh__2_.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','16GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF E2VN333SH',20990000,9,'8126_ac___gigabyte_g5_mf_e2vn333sh_2.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','4GB','512GB','1.5','SILVER'),
   ('Laptop Gaming GIGABYTE AORUS 15 BMF 52US383SH',38821000,9,'8376_gigabyte_aorus_15_bmf_ac.jpg',10,1200,'Intel Core i5-13500H','15.6 Inch Full HD 144Hz','64GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN353SH',21690000,9,'8872_photo_2024_04_02_14_16_23.jpg',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','16GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN383SH',21690000,9,'8698_doc_2023_12_29_15_42_04.png',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','4GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 KF-E3VN333SH',22990000,9,'8127____nh_n___i_b___t___laptop_gaming_gigabyte_g5_kf_e3vn333sh__2_.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','16GB','2TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF E2VN333SH',72821000,9,'8126_ac___gigabyte_g5_mf_e2vn333sh_2.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','32GB','512GB','1.5','SILVER'),
   ('Laptop Gaming GIGABYTE AORUS 15 BMF 52US383SH',21590000,9,'8376_gigabyte_aorus_15_bmf_ac.jpg',10,1200,'Intel Core i5-13500H','15.6 Inch Full HD 144Hz','64GB','4TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN353SH',21690000,9,'8872_photo_2024_04_02_14_16_23.jpg',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','16GB','4TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Gaming Gigabyte G5 MF5-52VN383SH',21690000,9,'8698_doc_2023_12_29_15_42_04.png',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','8GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 KF-E3VN333SH',22990000,9,'8127____nh_n___i_b___t___laptop_gaming_gigabyte_g5_kf_e3vn333sh__2_.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','64GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF E2VN333SH',19821000,9,'8126_ac___gigabyte_g5_mf_e2vn333sh_2.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','8GB','2TB','1.5','SILVER'),
   ('Laptop Gaming GIGABYTE AORUS 15 BMF 52US383SH',21590000,9,'8376_gigabyte_aorus_15_bmf_ac.jpg',10,1200,'Intel Core i5-13500H','15.6 Inch Full HD 144Hz','8GB','4TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN353SH',21690000,9,'8872_photo_2024_04_02_14_16_23.jpg',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','16GB','512GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN383SH',21690000,9,'8698_doc_2023_12_29_15_42_04.png',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','16GB','1TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 KF-E3VN333SH',22990000,9,'8127____nh_n___i_b___t___laptop_gaming_gigabyte_g5_kf_e3vn333sh__2_.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','16GB','2TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF E2VN333SH',13619000,9,'8126_ac___gigabyte_g5_mf_e2vn333sh_2.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','16GB','256GB','1.5','SILVER'),
   ('Laptop Gaming GIGABYTE AORUS 15 BMF 52US383SH',21590000,9,'8376_gigabyte_aorus_15_bmf_ac.jpg',10,1200,'Intel Core i5-13500H','15.6 Inch Full HD 144Hz','16GB','1TB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF5-52VN383SH',21690000,9,'8698_doc_2023_12_29_15_42_04.png',10,1200,'Intel Core i5-13500H','15.6 inch Full HD 144Hz','4GB','1TB','1.5','SILVER');
INSERT INTO storemanagement.product (product_name,product_price,category_id,images,rate_point,product_quantity,cpu,monitor,ram,rom,weight,color) VALUES
   ('Laptop Gaming Gigabyte G4 KF-E3VN333SH',22990000,9,'8127____nh_n___i_b___t___laptop_gaming_gigabyte_g5_kf_e3vn333sh__2_.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','32GB','256GB','1.5','SILVER'),
   ('Laptop Gaming Gigabyte G5 MF E2VN333SH',5821000,9,'8126_ac___gigabyte_g5_mf_e2vn333sh_2.jpg',10,1200,'Intel Core i5-12500H','15.6 Inch Full HD 144Hz','4GB','2TB','1.5','SILVER');
