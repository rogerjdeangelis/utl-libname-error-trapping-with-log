Libname error trapping with log

github
https://tinyurl.com/yx35rqxx
https://github.com/rogerjdeangelis/utl-libname-error-trapping-with-log

SAS Forum  related to
https://tinyurl.com/w3k3nnm
https://communities.sas.com/t5/SAS-Programming/WRITE-A-CODE-TO-CREATE-ALL-LIBRARIES-AT-A-TIME-FROM-A-DATASET/m-p/629527

*_                   _
(_)_ __  _ __  _   _| |_
| | '_ \| '_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
;

Some librefs and paths. Second path does not exist

tmp1 c:\tmp1
tmp2 c:\doesNotExist
tmp3 c:\tmp2

*            _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| '_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
;

 WORK.LOG total obs=3

 LIBREF    PATH                   RC    MSG

  tmp1     c:\tmp1                 0    SUCCESS
  tmp2     c:\doesNotExist    -70008    NOTE: Library TMP2 does not exist.
  tmp3     c:\tmp2                 0    SUCCESS

Note I clear the librefs. Remove the 'rc=libname(libref,' ');' if you want to
to assign librefd. Also note options 'engine' and 'access=' are available on libname statement.

*
 _ __  _ __ ___   ___ ___  ___ ___
| '_ \| '__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
;

data log;
  informat libref $4. path $16.;
  input libref path;
  rc=libname(libref,path);
  if rc then msg=sysmsg();
  else msg='SUCCESS';
  output;
  rc=libname(libref,' ');
cards4;
tmp1 c:\tmp1
tmp2 c:\doesNotExist
tmp3 c:\tmp2
;;;;
run;quit;

