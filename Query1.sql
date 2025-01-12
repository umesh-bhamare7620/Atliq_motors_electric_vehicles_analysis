create database elecric_vahical;

create table dim_date(
date date primary key ,
fiscal_year int,
quarter varchar(50));

create table electric_v_s_by_m(
`date` date ,
vahicle_category varchar(50),
maker varchar(50),
electric_v_so int,
foreign key (`date`) references dim_date(`date`));

create table electric_v_s_by_st(
`date` date ,
state varchar(40),
vehicle_category varchar(50),
electric_v_so int ,
total_v_so int,
foreign key (`date`) references dim_date(`date`));
select * from dim_date;