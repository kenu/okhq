select sysdate, 'okboard', count(*) from okboard
where wtime > sysdate - 1
union all
select sysdate, 'okboard_deleted', count(*) from okboard_deleted
union all
select sysdate, 'okmember', count(*) from okmember
union all
select sysdate, 'okboard_memo', count(*) from okboard_memo
where wtime > sysdate - 1
;

select * from okmember limit 0, 2;

select * from okmember limit 2, 2;

select * from okmember limit 4, 2;

select to_char(wtime, 'YYYY/MM/DD') `date`, 'okboard_deleted', count(*) from okboard_deleted
group by to_char(wtime, 'YYYY/MM/DD')
order by 1 desc
;
select to_char(wtime, 'YYYY/MM/DD') `date`, 'okboard', count(*) from okboard
group by to_char(wtime, 'YYYY/MM/DD')
order by 1 desc
;
select to_char(wtime, 'YYYY/MM/DD') `date`, 'okboard', count(*) from okboard
group by to_char(wtime, 'YYYY/MM/DD')
order by 1 desc
;
