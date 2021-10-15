-- LAB 7

-- TASK 1 all background process
select * from V_$BGPROCESS;

-- TASK 2 active background process
select * from V_$BGPROCESS
    WHERE PADDR != hextoraw('00')
        order by NAME;

-- TASK 3 -- processes DBWn, when is active
select NAME, DESCRIPTION, PRIORITY from V_$BGPROCESS
    WHERE PADDR != hextoraw('00') and  NAME like 'DBW%';

-- TASK 4 get the current sessions
select paddr, username, service_name, status, server
    from v$session
        where username is not null;

-- TASK 5 get mode the current sessions


-- TASK 6 point access (services)
select username, server
    from v$session
    where username is not null;

-- TASK 7
SELECT * FROM V$DISPATCHER;

-- TASK 8 LINUX daemon in linux
-- LISTENER -inherit

-- TASK 9 connections instance  dedicated/shared
select username, server
    from v$session
    where username is not null;

-- TASK 10 (body listener.ora)
/*
# listener.ora Network Configuration File: /u01/app/oracle/product/19.3.0/dbhome_1/network/admin/listener.ora
# Generated by Oracle configuration tools.

LISTENER =
  (DESCRIPTION_LIST =
    (DESCRIPTION =
      (ADDRESS = (PROTOCOL = TCP)(HOST = oracle-db-19c.centlinux.com)(PORT = 1521))
      (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
    )
  )
 */

-- TASK 11
-- LSTNRCTL
/*
start           stop            status          services
servacls        version         reload          save_config
trace           spawn           quit            exit
set*            show*
 */

-- TASK 12 dedicated servers
select ses.paddr, ses.username, ses.status, ses.server  from v$session ses
join v$process pr on ses.paddr = pr.addr where ses.username is not null and pr.background is null;
