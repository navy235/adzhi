insert into dbo.Category 
(
 CateCode,
 CateName,
 Length,
 PCateCode,
 OrderIndex,
 CategoryType
)
select CityCode,CityName,Length,PCityCode,OrderIndex,CategoryType from  CoreUser.dbo.Area 
where CityCode<>'001'