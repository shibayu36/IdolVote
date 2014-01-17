#!/bin/sh

PERL_AUTOINSTALL=--defaultdeps LANG=C cpanm --installdeps --notest . < /dev/null
mysqladmin -uroot create idolvote
mysql -uroot idolvote < db/schema.sql

mysqladmin -uroot create idolvote_test
mysql -uroot idolvote_test < db/schema.sql
