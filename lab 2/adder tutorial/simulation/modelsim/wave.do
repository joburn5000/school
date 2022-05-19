view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 10 -range 1 0 -starttime 0ps -endtime 1000ps sim:/adder2/A 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ps -endtime 1000ps sim:/adder2/B 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 00 -starttime 0ps -endtime 1000ps sim:/adder2/c_in 
WaveCollapseAll -1
wave clipboard restore
