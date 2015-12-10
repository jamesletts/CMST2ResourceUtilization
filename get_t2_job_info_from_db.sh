#!/bin/sh
#
# Want to get by week the wallclock time and number of jobs
# submitted per Tier-2 but not CERN, grouped by activity.
#

YEAR=$1
if [ -x $YEAR ] ; then
 YEAR=`/bin/date +%Y`
fi

sites="sites=T2_AT_Vienna&sites=T2_BE_IIHE&sites=T2_BE_UCL&sites=T2_BR_SPRACE&sites=T2_BR_UERJ&sites=T2_CH_CSCS&sites=T2_CN_Beijing&sites=T2_DE_DESY&sites=T2_DE_RWTH&sites=T2_EE_Estonia&sites=T2_ES_CIEMAT&sites=T2_ES_IFCA&sites=T2_FI_HIP&sites=T2_FR_CCIN2P3&sites=T2_FR_GRIF_IRFU&sites=T2_FR_GRIF_LLR&sites=T2_FR_IPHC&sites=T2_GR_Ioannina&sites=T2_HU_Budapest&sites=T2_IN_TIFR&sites=T2_IT_Bari&sites=T2_IT_Legnaro&sites=T2_IT_Pisa&sites=T2_IT_Rome&sites=T2_KR_KNU&sites=T2_MY_UPM_BIRUNI&sites=T2_PK_NCP&sites=T2_PL_Swierk&sites=T2_PL_Warsaw&sites=T2_PT_NCG_Lisbon&sites=T2_RU_IHEP&sites=T2_RU_INR&sites=T2_RU_ITEP&sites=T2_RU_JINR&sites=T2_RU_PNPI&sites=T2_RU_RRC_KI&sites=T2_RU_SINP&sites=T2_TH_CUNSTDA&sites=T2_TR_METU&sites=T2_TW_Taiwan&sites=T2_UA_KIPT&sites=T2_UK_London_Brunel&sites=T2_UK_London_IC&sites=T2_UK_SGrid_Bristol&sites=T2_UK_SGrid_RALPP&sites=T2_US_Caltech&sites=T2_US_Florida&sites=T2_US_MIT&sites=T2_US_Nebraska&sites=T2_US_Purdue&sites=T2_US_UCSD&sites=T2_US_Vanderbilt&sites=T2_US_Wisconsin"

dates="start=${YEAR}-01-01&end=$[$YEAR+1]-01-01"

wallclock_url="http://dashb-cms-jobsmry.cern.ch/dashboard/request.py/consumptionscsv?${sites}&activities=all&sitesSort=2&${dates}&timeRange=daily&granularity=Weekly&generic=0&sortBy=1&series=All&type=wab"

submitted_url="http://dashb-cms-jobsmry.cern.ch/dashboard/request.py/jobnumberscsv?${sites}&activities=all&sitesSort=2&${dates}&timeRange=daily&granularity=Weekly&generic=0&sortBy=1&series=All&type=s"

curl -ks -o wallclock_jobs_historical_${YEAR}.csv $wallclock_url
curl -ks -o submitted_jobs_historical_${YEAR}.csv $submitted_url

exit
