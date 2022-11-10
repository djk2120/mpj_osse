need two packages external to this repo
 - ppe_tool
 - tether
 
### Experiment A: US-Mpj, kmax and p50
 - varying kmax and psi50, 100 simulations, factorial design
    - docs.google.com/spreadsheets/d/1aFf5gMXY_YUVT3gC4k31x-2_KOCVGm_QFW74VI9K4eU/
 - running ctl and 2xco2 simulations
 - basecases: dir=/glade/work/djk2120/ctsm_amflx/cime/scripts/CTL2010SP/basecases
    - PPEn11_2xCO2SPSpin_US-Mpj-beta3 (32-year spinup)
    - PPEn11_2xCO2SP_US-Mpj-beta3 (2008-2017)
    - PPEn11_CTL2010SPSpin_US-Mpj-beta3 (32-year spinup)
    - PPEn11_CTL2010SP_US-Mpj-beta3 (2008-2017)

## November 10, 2022
Setting up Experiment A

made the paramfiles
 - ../params/params.ipynb

making a list of all the paramfiles
 - ls /glade/scratch/djk2120/PPEn11/amflx_lhc/paramfiles/a*.nc | cut -d/ -f8 | cut -d. -f1 > a.txt
 
customizing the config file
 - a_ctl.config
 
testing for just one parameterization:
 - looks good

running for the other 100:
 - qcmd -l walltime=2:00:00 -- bash ~/ppe_tools/jobscripts/run_ens.sh a_ctl.config &> a_ctl.log &
 
 
creating the 2xco2 spinup:
 - cd /glade/work/djk2120/ctsm_amflx/cime/scripts/CTL2010SP/basecases
 - ../../create_clone --clone PPEn11_CTL2010SPSpin_US-Mpj-beta3 --case PPEn11_2xCO2SPSpin_US-Mpj-beta3 --keepexe
 - cd PPEn11_2xCO2SPSpin_US-Mpj-beta3/
 - ./xmlchange CCSM_CO2_PPMV=734.0
 
creating the 2xco2 production:
 - cd /glade/work/djk2120/ctsm_amflx/cime/scripts/CTL2010SP/basecases
 - ../../create_clone --clone PPEn11_CTL2010SP_US-Mpj-beta3 --case PPEn11_2xCO2SP_US-Mpj-beta3 --keepexe
 - cd PPEn11_2xCO2SP_US-Mpj-beta3
 - ./xmlchange CCSM_CO2_PPMV=734.0
 
running the 2xco2 simulations:
 - make the config file: a_2xco2.config
 - qcmd -l walltime=2:00:00 -- bash ~/ppe_tools/jobscripts/run_ens.sh a_2xco2.config &> a_2xco2.log &