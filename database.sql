create tablespace Hafidanz_07070
	datafile 'D:\Praktikum_Basdat\Modu 1\hafida_nz07070.dbf'
	size 30M;

CREATE USER Hafidanz_07070
	IDENTIFIED BY 123
 	DEFAULT TABLESPACE Hafidanz_07070
	QUOTA 30M ON Hafidanz_07070;

GRANT ALL PRIVILEGES TO Hafidanz_07070;

CONN Hafidanz_07070/123

create table Jenis_Barang
	(
	Id_JenisBarang INTEGER not null,
	Nama_JenisBarang VARCHAR2(45),
	constraint PK_JenisBarang primary key (Id_JenisBarang)
	);

create table Barang
	(
	Id_barang INTEGER not null,
	Id_JenisBarang INTEGER,
	Nama_barang VARCHAR2(45),
	Harga_barang FLOAT,
	Stok INTEGER,
	constraint PK_Barang primary key (Id_barang)
	);

create table Login
	(
	Id_owner INTEGER not null,
	Username VARCHAR2(10),
	Password VARCHAR2(10),
	constraint PK_Login primary key (Id_owner)
	);

create table Transaksi
	(
	Id_transaksi INTEGER not null,
	Id_owner INTEGER,
	Total_harga FLOAT,
	Tgl_transaksi DATE,
	Uang_bayar INTEGER,
	Kembalian FLOAT,
	constraint PK_Transaksi primary key (Id_transaksi)
	);

create table Detail_Transaksi
	(
	Id_barang INTEGER not null,
	Id_transaksi INTEGER,
	Jumlah INTEGER
	);

alter table Barang
	add constraint FK_Id_JenisBarang FOREIGN KEY (Id_JenisBarang)
	references Jenis_Barang(Id_JenisBarang);

alter table Transaksi
	add constraint FK_Id_owner FOREIGN KEY (Id_owner)
	references Login(Id_owner);

alter table Detail_Transaksi
	add constraint FK_Id_barang FOREIGN KEY (Id_barang)
	references Barang(Id_barang)
	add constraint FK_Id_transaksi FOREIGN KEY (Id_transaksi)
	references Transaksi(Id_transaksi);

create sequence Id_JenisBarang
	minvalue 1
	maxvalue 1000
	start with 1
	increment by 1
	cache 20;

Alter table Login add constraint Username unique (Username);

alter table Barang modify(Stok NUMBER(3));

insert into Jenis_barang (Id_jenisbarang, Namajenisbarang_07070) values (1,'Makanan');

insert into Jenis_barang (Id_jenisbarang, Namajenisbarang_07070) values (2,'Minuman');


insert all
 	into Barang(Id_barang,Id_jenisbarang,Nama_barang,Harga_barang,Stok) values (6,3,'Baras Merah','8000','20')
	into Barang(Id_barang,Id_jenisbarang,Nama_barang,Harga_barang,Stok) values (7,4,'marina','2000','40')
 	into Barang(Id_barang,Id_jenisbarang,Nama_barang,Harga_barang,Stok) values (8,5,'lux','5000','60')
	into Barang(Id_barang,Id_jenisbarang,Nama_barang,Harga_barang,Stok) values (9,6,'Rinso','10000','20')
 	into Barang(Id_barang,Id_jenisbarang,Nama_barang,Harga_barang,Stok) values (10,7,'zinc','5000','40')
 	select 1 from dual;

insert all
  	into Login (Id_owner,Username,Password) values (2,'Hafidz','123')
	into Login (Id_owner,Username,Password) values (3,'Ikha','123')
 	into Login (Id_owner,Username,Password) values (4,'Elma','123')
	into Login (Id_owner,Username,Password) values (5,'Hahan','123')
 	into Login (Id_owner,Username,Password) values (6,'Aly','123')
  	select 1 from dual;

insert all
 	into Transaksi(Id_transaksi,Id_owner,Total_harga,Tgl_transaksi,Uang_bayar,Kembalian) values (4,1,'16000',to_date('01/01/2019','dd/mm/yyyy'), '20000','4000')
  	into Transaksi(Id_transaksi,Id_owner,Total_harga,Tgl_transaksi,Uang_bayar,Kembalian) values (5,1,'4000',to_date('02/02/2019','dd/mm/yyyy'), '5000','1000')
	into Transaksi(Id_transaksi,Id_owner,Total_harga,Tgl_transaksi,Uang_bayar,Kembalian) values (6,1,'5000',to_date('03/03/2019','dd/mm/yyyy'), '10000','5000')
	into Transaksi(Id_transaksi,Id_owner,Total_harga,Tgl_transaksi,Uang_bayar,Kembalian) values (7,1,'5000',to_date('03/03/2019','dd/mm/yyyy'), '10000','5000')
	into Transaksi(Id_transaksi,Id_owner,Total_harga,Tgl_transaksi,Uang_bayar,Kembalian) values (8,1,'5000',to_date('03/03/2019','dd/mm/yyyy'), '10000','5000')
 	select 1 from dual;

insert all
  	into Detail_Transaksi(Id_barang,Id_transaksi,Jumlah) values ('6','1','2')
	into Detail_Transaksi(Id_barang,Id_transaksi,Jumlah) values ('7','2','2')
 	into Detail_Transaksi(Id_barang,Id_transaksi,Jumlah) values ('8','3','1')
 	into Detail_Transaksi(Id_barang,Id_transaksi,Jumlah) values ('9','4','1')
 	into Detail_Transaksi(Id_barang,Id_transaksi,Jumlah) values ('10','4','1')
	select 1 from dual;

select * from barang;
select * from Jenis_barang;
select * from Login;
select * from Transaksi;
select * from Detail_transaksi;

create SEQUENCE Login_seq
	Start with 1
	Increment by 1
 	Nocache
 	Nocycle;

insert into Login (Id_owner,Username,Password) values (Login_seq.nextval,'Hafida','123');

Update Barang
 	SET Stok = '20';

Update Jenis_barang
	Set Namajenisbarang_07070 = 'Cemilan'
	Where Id_jenisbarang = 1;

Update transaksi
	Set Total_harga = '8000', Kembalian = '12000'
	Where Kembalian LIKE '4%';

Update detail_transaksi
	Set Jumlah = '1'
	Where Id_transaksi = '1' AND Id_barang <= 1
 	Or Id_barang = 1;

delete from Detail_transaksi
 	where Id_barang = '1'
 	AND Id_transaksi = '1';

delete from detail_transaksi
  	where id_barang < 3;

delete from detail_transaksi
	where id_barang LIKE '3%';

savepoint sv1;
rollback to sv1;
commit;

select * from barang
  	order by Nama_barang ASC;

select Nama_barang
	from barang
 	group by Nama_barang;

select id_transaksi, Max(Uang_bayar) AS
	Terbanyak, Min(Uang_bayar) AS Terendah from Transaksi
	group by id_transaksi;

select id_owner,count(id_owner) as banyak_akun
  	from login where id_owner = 1 or id_owner = 2 AND id_owner = 3 group by id_owner;

select sum(stok) as Jumlah_stok from barang;

select sum(stok) as Jumlah_stok , avg(stok) as Rata2_stok from barang;

select
	id_barang, stok
	from barang
	where stok = (select min(stok)
	from barang)
 	or stok = (select max(stok)
	from barang);

select nama_barang,
 	(select count(*) from barang where barang.id_barang = barang.id_barang)
 	as Jumlah_stok from barang;

select nama_barang,
	(select sum(stok) from barang where barang.id_barang = barang.id_barang)
	as total_stok from barang where id_barang= 1;

select nama_barang,
 	(select avg(stok) from barang where barang.id_barang = barang.id_barang)
	as total_stok from barang ;

select id_owner, sum(kembalian) as total_kembalian
 	from transaksi
 	where id_owner = 1
 	group by id_owner;

select id_transaksi, id_owner, tgl_transaksi
 	from transaksi where id_owner = (select id_owner from login where username = 'hafida');

select id_owner from(select * from (select * from (select * from Transaksi)
	where id_owner = '1') where kembalian LIKE '%1%');

select a.nama_barang, b.nama_jenisbarang
	from barang a join
 	jenis_barang b
 	on a.id_jenisbarang = b.id_jenisbarang
	where rownum <=5;

select detail_transaksi.Id_barang from detail_transaksi 
	LEFT JOIN barang ON barang.id_barang = detail_transaksi.id_barang 
	LEFT JOIN transaksi ON transaksi.id_transaksi = detail_transaksi.id_transaksi 
	where detail_transaksi.id_transaksi = (select id_transaksi from transaksi where id_transaksi = 1

SELECT Detail_transaksi.Id_barang, count (detail_transaksi.Id_transaksi) as Jumlah_Transaksi FROM detail_transaksi 
	RIGHT JOIN barang ON barang.id_barang = detail_transaksi.id_barang 
	RIGHT JOIN transaksi ON transaksi.id_transaksi = detail_transaksi.id_transaksi 
	group by detail_transaksi.Id_barang;

create view Harga as
 	select id_barang,harga_barang from barang;

create view list_barang
	As select a.nama_barang, b.nama_jenisbarang
	from barang a join jenis_barang b
	On a.id_jenisbarang = b.id_jenisbarang
	where rownum <=5;

create view Left_view as
  	select detail_transaksi.Id_barang from detail_transaksi 
	LEFT JOIN barang ON barang.id_barang = detail_transaksi.id_barang 
	LEFT JOIN transaksi ON transaksi.id_transaksi = detail_transaksi.id_transaksi 
	where detail_transaksi.id_transaksi = (select id_transaksi from transaksi where id_transaksi = 1);

create view right_view as
  	SELECT Detail_transaksi.Id_barang, count (detail_transaksi.Id_transaksi) as Jumlah_Transaksi FROM detail_transaksi 
	RIGHT JOIN barang ON barang.id_barang = detail_transaksi.id_barang 
	RIGHT JOIN transaksi ON transaksi.id_transaksi = detail_transaksi.id_transaksi 
	group by detail_transaksi.Id_barang;

select * from list_barang;
select * from Left_view;
select * from right_view;



















