---------Admin---------------------
create table Admin
(
NIC varchar(12) not null,
F_name varchar(20),
L_name varchar(20),
Dob date,
age int,
Gender varchar(10),
House_no varchar(5),
Lane varchar(20),
City varchar(20),
constraint admin_PK primary key (NIC),
constraint checkAdminNIC check (NIC like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-
9][0-9][v\V]'),
);
---------Vehicle---------------------
create table Vehicle
(
Vehicle_ID varchar(15) not null,
Vehicle_reg_number varchar(20) not null,
Vehicle_type varchar(20),
Vehicle_brand varchar(20),
Fuel_type varchar(10),
Engin_capacity varchar(10),
Cost_1km real,
constraint vehicle_PK primary key (Vehicle_ID),
constraint checkVehicleId check (Vehicle_ID like '[v\V][i\I][d-D][0-9][0-9][0-
9][0-9][0-9][0-9][0-9]'),
);
---------Customer---------------------
create table Customer
(
Customer_ID varchar(15) not null,
F_name varchar(20) not null,
L_name varchar(20) not null,
Gender varchar(10),
House_no varchar(10),
Lane varchar(30),
City varchar(30),
Occupation varchar(20),
NIC varchar(12) not null,
constraint customer_PK primary key (Customer_ID),
constraint customer_FK foreign key (NIC) references Admin (NIC),
constraint checkVehicleId1 check (Customer_ID like '[c-C][i-I][d-D][0-9][0-9][0-
9][0-9][0-9][0-9][0-9]'),
);
--------Reservation---------------------
create table Reservation
(
Reservation_ID varchar(15) not null,
Schedule_date date,
Pickup_date date,
Pickup_time time,
Pickup_location varchar(50),
Return_date date,
Vehicle__type varchar(15),
No_passengers int,
NIC varchar(12) not null,
Vehicle_ID varchar(15) not null,
Customer_ID varchar(15) not null,
constraint reservation_PK primary key (Reservation_ID),
constraint reservation_FK1 foreign key(NIC) references Admin (NIC),
constraint reservation_FK2 foreign key(Vehicle_ID) references Vehicle
(Vehicle_ID),
constraint reservation_FK3 foreign key(Customer_ID) references Customer
(Customer_ID),
);
-------Driver---------------------
create table Driver
(
Driver_ID varchar(15),
Driver_licence_id varchar(15),
F_name varchar(20),
L_name varchar(20),
Dob date,
Age int,
Gender varchar(10),
House_no varchar(10),
Lane varchar(30),
City varchar(30),
NIC varchar(12) not null,
constraint driver_PK primary key (Driver_id),
constraint driver_FK foreign key(NIC) references Admin (NIC),
);
---------Payments---------------------
create table Payments
(
Payment_ID varchar(15),
C_name varchar(20),
Vehicle_type varchar(20),
Amount real,
Reservation_ID varchar(15),
Customer_ID varchar(15),
Payment_date date, --2001-01-01
Payment_time time, --23:59:59.00
constraint payments_PK primary key (Payment_ID),
constraint payments_FK1 foreign key(Reservation_ID) references Reservation
(Reservation_ID),
constraint payments_FK2 foreign key(Customer_ID) references Customer
(Customer_ID),
);
---------Feedback---------------------
create table Feedback
(
Name varchar(20),
Customer_ID varchar(15) not null,
NIC varchar(12) not null,
Description varchar(100),
constraint feedback_PK primary key (Name,Customer_ID),
constraint feedback_FK1 foreign key(Customer_ID) references Customer
(Customer_ID),
constraint feedback_FK2 foreign key(NIC) references Admin (NIC),
);
---------Insurance---------------------
create table Insurance
(
I_ID varchar(15) not null,
Vehicle_ID varchar(15),
I_type varchar(50),
Vehicle_price real,
Issue_date datetime,
constraint insurance_PK primary key (I_ID),
constraint insurance_FK foreign key (Vehicle_ID) references Vehicle (Vehicle_ID),
);
---------Admin_phone-----------------
create table Admin_phone
(
Phone_number varchar(10) not null,
NIC varchar(12) not null,
constraint Admin_phone_PK primary key (Phone_number,NIC),
constraint insu_FK foreign key (NIC) references Admin (NIC),
constraint checkAdminPhone check (Phone_number like '[0-9][0-9][0-9][0-9][0-9][0-
9][0-9][0-9][0-9][0-9]'),
);
---------Admin_mail---------------------
create table Admin_mail
(
Email varchar(30),
NIC varchar(12) not null,
constraint Admin_mail_PK primary key (Email,NIC),
constraint Admin_mail_FK foreign key (NIC) references Admin (NIC),
);
---------Driver_phone
create table Driver_phone
(
Phone_number varchar(15),
Driver_ID varchar(15),
--constraint Driver_phone_PK primary key (Phone_number,Driver_ID),
constraint Driver_phone_FK foreign key (Driver_ID) references Driver (Driver_ID),
constraint checkDriverPhone check (Phone_number like '[0-9][0-9][0-9][0-9][0-9][0-
9][0-9][0-9][0-9][0-9]'),
);
---------Driver_mail---------------------
create table Driver_mail
(
Email varchar(30),
Driver_ID varchar(15) not null,
constraint Driver_mail_PK primary key (Email,Driver_ID),
constraint Driver_mail_FK foreign key (Driver_ID) references Driver (Driver_ID),
);
---------Customer_phone---------------------
create table Customer_phone
(
Phone_number varchar(15),
Customer_ID varchar(15),
constraint Customer_phone_PK primary key (Phone_number,Customer_ID),
constraint Customer_phone_FK foreign key (Customer_ID) references Customer
(Customer_ID),
constraint checkCustomerPhone check (Phone_number like '[0-9][0-9][0-9][0-9][0-
9][0-9][0-9][0-9][0-9][0-9]'),
);
---------Customer_mail---------------------
create table Customer_mail
(
Email varchar(30),
Customer_ID varchar(15),
constraint Customer_mail_PK primary key (Email,Customer_ID),
constraint Customer_mail_FK foreign key (Customer_ID) references Customer
(Customer_ID),
);
---------Customer_Vehicle---------------------
create table Customer_Vehicle
(
Vehicle_ID varchar(15),
Customer_ID varchar(15),
constraint Vehicle_id_PK primary key (Vehicle_ID,Customer_ID),
constraint Vehicle_id_FK foreign key (Vehicle_ID) references Vehicle (Vehicle_ID),
constraint Customer_id_FK foreign key (Customer_ID) references Customer
(Customer_ID),
);
---------Driver_Vehicle---------------------
create table Driver_Vehicle
(
Vehicle_ID varchar(15),
Driver_ID varchar(15),
constraint Vehicle_id_PK11 primary key (Driver_ID,Vehicle_ID),
constraint Vehicle_id_FK11 foreign key (Vehicle_ID) references Vehicle
(Vehicle_ID),
constraint Driver_id_FK11 foreign key (Driver_ID) references Driver (Driver_ID),
);
---------insert in to Admin---------------------
insert into Admin values('901234567V','Shamal','Aravinda','1990-03-
23',31,'Male','22/7','Araliya Lane','Piliyandala')
insert into Admin values('921234567V','Chathura','Gamage','1992-09-
08',28,'Male','11/B','Samagi mawatha','Kahathuduwa')
insert into Admin values('881234567V','Tharuki','Wijesinghe','1988-01-
23',32,'Female','08','Asiri lane','Homagama')
insert into Admin values('861234567V','Kumari','Siriwardhana','1986-11-
11',34,'Female','18/A','River road','Rathmalana')
insert into Admin values('951234567V','Pasindu','Dissanayake','1995-08-
12',25,'Male','06','Temple road','Kottawa')
---------insert in to Vehicle---------------------
insert into Vehicle 
values('VID1234567','V12345','Car','Toyota','Petrol','2600CC','50.00')
insert into Vehicle 
values('VID9876543','V34567','Van','Mitsubishi','Diesel','2500CC','80.00')
insert into Vehicle values('VID3456823','V98765','Bus','Tata','Diesel','3000CC','120.00')
insert into Vehicle values('VID1357926','V57689','Jeep','Range 
rover','Petrol','4000CC','250.00')
insert into Vehicle values('VID1324356','V24696','Car','Honda','Petrol','2300CC','60.00')
---------insert in to Customer---------------------
insert into Customer values('CID1234567','Amali','Thenuwara','Female','34/A','Saman 
Mawatha','Rajagiriya','Teacher','901234567V')
insert into Customer values('CID9876543','Jhon','Silva','Male','03','Kumudu 
Mawatha','Galle','Engineer','921234567V')
insert into Customer values('CID5784560','Damith','Asanka','Male','25/3','Welakubura 
road','Dehivala','Doctor','881234567V')
insert into Customer values('CID1369846','Thanuja','Nayomi','Female','12/B','Kahawatta 
Road','Nugegoda','Clark','861234567V')
insert into Customer values('CID3546576','Lahiru','Vidumina','Male','06','Sapumal 
Mawatha','Boralasgamuwa','Lawyer','951234567V')
---------insert in to Reservation---------------------
insert into Reservation values('RID1234567','2021-08-03','2021-08-
05','08:00:00','Nuggegoda','2021-08-06','Car',4,'901234567V','VID1234567','CID1234567')
insert into Reservation values('RID3456780','2021-09-12','2021-09-
15','14:00:00','Boralasgamuwa','2021-09-
17','Van',12,'921234567V','VID9876543','CID9876543')
insert into Reservation values('RID4534232','2021-10-15','2021-10-
20','10:30:00','Homagama','2021-10-23','Bus',30,'881234567V','VID3456823','CID5784560')
insert into Reservation values('RID1324345','2021-07-23','2021-07-
28','18:00:00','Rathmalana','2021-08-02','Jeep',5,'861234567V','VID1357926','CID1369846')
insert into Reservation values('RID8585898','2021-10-11','2021-10-
14','11:00:00','Kottawa','2021-10-19','Car',5,'951234567V','VID1324356','CID3546576')
---------insert in to Driver---------------------
insert into Driver values('DID1234567','SL1234567','Lal','Jayasena','1980-09-
13',40,'Male','06','Samagipura','Kalutara','901234567V')
insert into Driver values('DID9876543','SL0987654','Nimal','Yapa','1975-10-
26',45,'Male','12/C','Isuru Mawatha','Gampaha','921234567V')
insert into Driver values('DID3456789','SL1029387','Chandana','Sirikumara','1985-11-
22',35,'Male','08','Gonamaditt a road','Seeduwa','881234567V')
insert into Driver values('DID7263549','SL3456789','Kasun','Danushka','1992-07-
09',28,'Male','29/A','Gadabuwana road','Ragama','861234567V')
insert into Driver values('DID1029384','SL2837456','Gamini','Fernando','1979-02-
12',42,'Male','12','Siripura Mawatha','Malabe','951234567V')
---------insert in to Payments---------------------
insert into Payments values('PID1234567','Amali 
Thenuwara','Car','1000.00','RID1234567','CID1234567','2021-08-05','08:00:00')
insert into Payments values('PID0987654','Jhon 
Silva','Van','2220.00','RID3456780','CID9876543','2021-09-15','14:00:00')
insert into Payments values('PID3456789','Damith 
Asanka','Bus','7800.00','RID4534232','CID5784560','2021-10-20','10:30:00')
insert into Payments values('PID3546578','Thanuja 
Nayomi','Jeep','3260.00','RID1324345','CID1369846','2021-07-28','18:00:00')
insert into Payments values('PID1527476','Lahiru 
Vidumina','Car','5030.00','RID8585898','CID3546576','2021-10-14','11:00:00')
---------insert in to Feedback---------------------
insert into Feedback values('Amali Thenuwara','CID1234567','901234567V','All went very 
smoothly')
insert into Feedback values('Jhon Silva','CID9876543','921234567V','Everything was good 
with my trip')
insert into Feedback values('Damith Asanka','CID5784560','881234567V','Extreme surprised 
and impressed with quality of the service')
insert into Feedback values('Thanuja Nayom','CID1369846','861234567V','Best company for 
any car rental')
insert into Feedback values('Lahiru Vidumina','CID3546576','951234567V','Everything went 
100% problem free and very smoothly')
---------insert in to Insurance---------------------
insert into Insurance values('IID1234567','VID1234567','Rental reimbursement 
insurance','5460.00','2020-10-30')
insert into Insurance values('IID0987654','VID9876543','Emergency roadside 
assistance','8260.00','2021-02-13')
insert into Insurance values('IID3456789','VID3456823','Mechanical breakdown 
insurance','9490.00','2019-09-26')
insert into Insurance values('IID4758690','VID1357926','Pay-as-you-go 
insurance','7480.00','2021-03-02')
insert into Insurance values('IID3845690','VID1324356','Rental reimbursement 
insurance','6970.00','2020-10-02')
---------insert in to Admin_phone---------------------
insert into Admin_phone values('0772234517','901234567V')
insert into Admin_phone values('0721326746','921234567V')
insert into Admin_phone values('0712348954','881234567V')
insert into Admin_phone values('0709853265','861234567V')
insert into Admin_phone values('0772098767','951234567V')
---------insert in to Admin_mail---------------------
insert into Admin_mail values('shamal123@gmail.com','901234567V')
insert into Admin_mail values('chathura_n@gmail.com','921234567V')
insert into Admin_mail values('tharuki222@gmail.com','881234567V')
insert into Admin_mail values('kumari_f@gmail.com','861234567V')
insert into Admin_mail values('pasindu890@gmail.com','951234567V')
---------insert in to Driver_phone---------------------
insert into Driver_phone values('0772234567','DID1234567')
insert into Driver_phone values('0709878893','DID9876543')
insert into Driver_phone values('0778294382','DID3456789')
insert into Driver_phone values('0709853209','DID7263549')
insert into Driver_phone values('0772098897','DID1029384')
---------insert in to Driver_mail---------------------
insert into Driver_mail values('lal123@gmail.com','DID1234567')
insert into Driver_mail values('nimal_n@gmail.com','DID9876543')
insert into Driver_mail values('chandra452@gmail.com','DID3456789')
insert into Driver_mail values('kasun_f@gmail.com','DID7263549')
insert into Driver_mail values('Gamini000@gmail.com','DID1029384')
---------insert in to Customer_phone---------------------
insert into Customer_phone values('0771234567','CID1234567')
insert into Customer_phone values('0709898783','CID9876543')
insert into Customer_phone values('0778098722','CID5784560')
insert into Customer_phone values('0712345678','CID1369846')
insert into Customer_phone values('0772095677','CID3546576')
---------insert in to Customer_mail---------------------
insert into Customer_mail values('amali123@gmail.com','CID1234567')
insert into Customer_mail values('jhon_nrt@gmail.com','CID9876543')
insert into Customer_mail values('Damith146@gmail.com','CID5784560')
insert into Customer_mail values('thanuja_p@gmail.com','CID1369846')
insert into Customer_mail values('lahiru@gmail.com','CID3546576')
---------insert in to Customer_Vehicle ---------------------
insert into Customer_Vehicle values('VID1234567','CID1234567')
insert into Customer_Vehicle values('VID9876543','CID9876543')
insert into Customer_Vehicle values('VID3456823','CID5784560')
insert into Customer_Vehicle values('VID1357926','CID1369846')
insert into Customer_Vehicle values('VID1324356','CID3546576')
---------insert in to Driver_Vehicle ---------------------
insert into Driver_Vehicle values('VID1234567','DID1234567')
insert into Driver_Vehicle values('VID9876543','DID9876543')
insert into Driver_Vehicle values('VID3456823','DID3456789')
insert into Driver_Vehicle values('VID1357926','DID7263549')
insert into Driver_Vehicle values('VID1324356','DID1029384')