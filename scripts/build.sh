#!/usr/bin/env bash
. ./scripts/functions
./scripts/gendocs
RSWC=`which swc-link-report-remove`
ruby scripts/genlinkreport.rb
python ${RSWC} -l libs/report.xml -m "${GS}" -o libs/gsreport.xml
ruby scripts/genswc.rb
rm -rf libs/report.xml
rm -rf libs/gsreport.xml