#!/usr/bin/python
import sys,os.path

import datetime
now = datetime.datetime.now()
theyear=str(now.year)

alljob={}
anajob={}
filename="./data/submitted_jobs_historical_"+theyear+".csv"
file=open(filename,'r')
for line in file :
  newline=str(line).rstrip()
  num=int(newline.split(',')[0])
  key=newline.split(',')[1].split()[0]
  Y=2000+int(key.split('-')[2])
  M=str(key.split('-')[1])
  if M=='Jan' : M="01"
  if M=='Feb' : M="02"
  if M=='Mar' : M="03"
  if M=='Apr' : M="04"
  if M=='May' : M="05"
  if M=='Jun' : M="06"
  if M=='Jul' : M="07"
  if M=='Aug' : M="08"
  if M=='Sep' : M="09"
  if M=='Oct' : M="10"
  if M=='Nov' : M="11"
  if M=='Dec' : M="12"
  D=int(key.split('-')[0])
  if D < 10 :
    D="0"+str(D)
  key=str(Y)+'-'+str(M)+'-'+str(D)

  tsk=newline.split(',')[2]
  try :
    alljob[key]+=num
  except KeyError :
    alljob[key]=num
  if tsk == 'analysis' :
    anajob[key]=num

allwc={}
anawc={}
filename="./data/wallclock_jobs_historical_"+theyear+".csv"
file=open(filename,'r')
for line in file :
  newline=str(line).rstrip()
  num=int(newline.split(',')[0])
  key=newline.split(',')[1].split()[0]
  Y=2000+int(key.split('-')[2])
  M=str(key.split('-')[1])
  if M=='Jan' : M="01"
  if M=='Feb' : M="02"
  if M=='Mar' : M="03"
  if M=='Apr' : M="04"
  if M=='May' : M="05"
  if M=='Jun' : M="06"
  if M=='Jul' : M="07"
  if M=='Aug' : M="08"
  if M=='Sep' : M="09"
  if M=='Oct' : M="10"
  if M=='Nov' : M="11"
  if M=='Dec' : M="12"
  D=int(key.split('-')[0])
  if D < 10 :
    D="0"+str(D)
  key=str(Y)+'-'+str(M)+'-'+str(D)

  tsk=newline.split(',')[2]
  try :
    allwc[key]+=num
  except KeyError :
    allwc[key]=num
  if tsk == 'analysis' :
    anawc[key]=num
  
f=86400*7
print "0Week,AnalysisWC,AllWC,AnalysisJobs,AllJobs"
for key in allwc.keys() :
  print key,',',anawc[key]/f,',',allwc[key]/f,',',anajob[key],',',alljob[key]

sys.exit()
