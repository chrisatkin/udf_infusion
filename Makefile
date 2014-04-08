
all:
	gcc -fPIC -O2 -pipe -shared -I /usr/local/Cellar/mysql/5.6.17/include/mysql -o udf_infusion.so udf_infusion.c
	mv udf_infusion.so /usr/local/Cellar/mysql/5.6.17/lib/plugin
	gawk -f db.awk -v drop=0 < udf_infusion.c | /usr/local/Cellar/mysql/5.6.17/bin/mysql -f --user=root --password=


uninstall:
	gawk -f db.awk -v drop=1 < udf_infusion.c | /usr/local/Cellar/mysql/5.6.17/bin/mysql -f --user=root --password=
	rm -f /usr/local/mysql/lib/plugin/udf_infusion.so
