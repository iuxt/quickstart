
添加新用户
ldapadd -x -D cn=Manager,dc=nutstore,dc=com -w com.012 -f basedomain.ldif
ldapadd -x -D cn=Manager,dc=nutstore,dc=com -w com.012 -f add_user.ldif