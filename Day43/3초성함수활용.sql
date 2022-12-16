use db1

/*
exec dbo.sp_檬己八祸 'さぁ'
*/

create procedure dbo.sp_檬己八祸
	@in_檬己涝仿 nvarchar(100)

as
begin

	set nocount on

	create table #力前(
		力前内靛 nvarchar(30) not null,
		力前疙 nvarchar(100),
		力前檬己 nvarchar(100) default,
		primary key (力前内靛)
	)

	insert into #力前 (力前内靛, 力前疙) values
	('A','荤苞'),
	('B','荤苞侥檬'),
	('C','器档'),
	('D','寸辟'),
	('E','没器档')

	update A set
	A.力前檬己 = [DBO].[UF_檬己炼雀] (A.力前疙)
	from #力前 A
	where A.力前檬己 = ''

	select A.力前内靛, A.力前疙, A.力前檬己
	from #力前 A
	where A.力前檬己 like '%' + @in_檬己涝仿 + '%' 
	order by 1

end