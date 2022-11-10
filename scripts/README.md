need two packages external to this repo
 - ppe_tool
 - tether

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