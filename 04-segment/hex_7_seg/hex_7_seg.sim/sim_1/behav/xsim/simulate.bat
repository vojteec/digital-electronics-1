@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.3 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Wed Mar 08 11:05:51 +0100 2023
REM SW Build 3173277 on Wed Apr  7 05:07:49 MDT 2021
REM
REM IP Build 3174024 on Wed Apr  7 23:42:35 MDT 2021
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim tb_top_behav -key {Behavioral:sim_1:Functional:tb_top} -tclbatch tb_top.tcl -log simulate.log"
call xsim  tb_top_behav -key {Behavioral:sim_1:Functional:tb_top} -tclbatch tb_top.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
