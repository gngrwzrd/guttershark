#!/usr/bin/env bash
./scripts/gendocs.sh
RSWC=`which swc_link_report_remove.py`
ME=`whoami`
ruby scripts/genlinkreport.rb
python ${RSWC} -l libs/report.xml -m "/Users/${ME}/Development/git/guttershark" -o libs/gsreport.xml
ruby scripts/genswc.rb
rm -rf libs/report.xml
rm -rf libs/gsreport.xml